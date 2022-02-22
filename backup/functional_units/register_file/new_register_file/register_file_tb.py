import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_register_file(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.nreset.value = 1

    j = 0xFFFF
    addr1 = 0
    addr2 = 31
    await RisingEdge(dut.clock)

    dut.nreset.value = 1
    dut.wr_en.value = 1
    dut.rd_en.value = 1
    dut.wr_addr.value = 0x000
    dut.rd_addr.value = 0x000

    #write 0-32 to all registers.
    #This test validates write on the positive edge & read on the negative edge.:w

    for i in range(32):
        dut.data_in.value = (addr1 + 1) & 0x0FF
        k = (addr1 ) & 0x01F
        dut.wr_addr.value = (k & 0x1F)
        dut.rd_addr.value = (k & 0x1F)
        await RisingEdge(dut.clock)
        print("data_out = " + str(dut.data_out.value.integer) + " data_in = " + str(dut.data_in.value.integer))
        assert dut.data_out.value == (addr1 + 1) & 0x0FF, f"write failed data_out = {dut.data_out.value.integer}, data_in = {dut.data_in.value.integer}"
        addr1 = (addr1 + 1) & 0x1F

    addr1 = 0
    #reset the register file. This should zero out every register
    dut.wr_en.value = 0
    dut.nreset.value = 0
    await FallingEdge(dut.clock)
    dut.nreset.value = 1
    await RisingEdge(dut.clock)
    #loop through every register to ensure that a full reset occured.
    for i in range(32):
        k = (addr1) & 0x1F
        dut.rd_addr.value = k
        await RisingEdge(dut.clock)
        assert dut.data_out.value == 0, f"reset failed"
        addr1 = (addr1 + 1) & 0x1F

    write_list = [0xEE, 0xFF, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88]

    #flash reset again
    dut.nreset.value = 0
    await RisingEdge(dut.clock)
    dut.nreset.value = 1

    await RisingEdge(dut.clock)

    addr1 = 0
    j = 0
    dut.wr_en.value = j

    for i in range(4):
        k = (addr1 & 0x1F | ((addr1 + 1)) & 0x3E0) & 0x3FF
        dut.rd_addr.value = k
        dut.wr_addr.value = k
        l = ((write_list[addr1] & 0x0FF)|((write_list[addr1 + 1] << 8) & 0xFF00)) & 0x0FFFF
        dut.data_in.value = l
        await RisingEdge(dut.clock)
        check_different_rd_wrs(j, write_list, l, addr1, dut)
        addr1 = (addr1 + 2) & 0x1F
        j = (j + 1) & 0x3
        dut.wr_en.value = j
        dut.rd_en.value = j



def check_different_rd_wrs(j, write_list, l, addr1, dut):
    if(j == 0):
        f = 0
        assert dut.data_out.value == f, f"No write failed data_out = {dut.data_out.value}, f = {f}"
    elif(j == 1):
        f = write_list[addr1] & 0x0FF
        assert dut.data_out.value == f, f"Low write & read failed data_out = {dut.data_out.value.integer}, f = {f}"
    elif(j == 2):
        f = (write_list[addr1 + 1] << 8) & 0x0FF00
        assert dut.data_out.value == f, f"High write & read failed data_out = {dut.data_out.value.integer}, f = {f}"
    else:
        assert dut.data_out.value == l, f"Double write and read failed data_out = {dut.data_out.value.integer}, l = {l}"
