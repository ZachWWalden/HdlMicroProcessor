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
    await FallingEdge(dut.clock)

    dut.nreset.value = 1
    dut.wr_en.value = 1
    dut.rd_en.value = 3
    dut.wr_addr.value = 0x000
    dut.rd_addr.value = 0x000
    dut.data_in.value = j

    for i in range(32):
        dut.data_in.value = j
        k = (addr1 | ((addr1 + 1) << 5)) & 0x3FF
        dut.wr_addr.value = (k & 0x1F)
        dut.rd_addr.value = (k & 0x1F)
        await FallingEdge(dut.clock)
        await FallingEdge(dut.clock)
        addr1 = (addr1 + 1) & 0x1F

    await FallingEdge(dut.clock)
    await RisingEdge(dut.clock)
    #assert dut.data_out.value == 0xFFFF, f"write or read failed"
