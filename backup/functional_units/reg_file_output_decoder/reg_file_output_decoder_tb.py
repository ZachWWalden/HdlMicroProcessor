import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_reg_file_output_decoder(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    read_en = 0x03

    z_byte = "zzzzzzzz"
    s = ""

    registers = []

    for i in range(32):
        s = s + z_byte
        registers.append(0x0FF)
        #registers.append(i & 0x0FF)

    print(registers)

    high_z = cocotb.binary.BinaryValue(s, 256, False, 0)
    await RisingEdge(dut.clock)
    dut.data_in.value = high_z

    addr1 = 0x00

    await FallingEdge(dut.clock)
    dut.rd_en.value = 0x3

    for i in range(16):
        dut.rd_addr.value = (addr1 | (((addr1 | (1 << 4) ) << 5) & 0x3E0)) & 0x3FF
        dut.data_in.value = cocotb.binary.BinaryValue(gen_data_in(z_byte, registers, addr1 & 0x1F, (addr1 | 1 << 4) & 0x1F), 256, True, 0)
        await FallingEdge(dut.clock)
        await FallingEdge(dut.clock)
        addr1 = addr1 + 1

    #dut.data_in.value = cocotb.binary.BinaryValue(gen_data_in(z_byte, true_byte, registers, addr1, addr2), 256, False, 0)

    await FallingEdge(dut.clock)

    await FallingEdge(dut.clock)

def gen_data_in(z_byte, registers, addr1, addr2):
    s = ""
    j = 31
    for i in range(32):
        if(j is addr1):
            bin = cocotb.binary.BinaryValue(registers[j], 8, False, 0)
            s = s + bin.binstr
            print(str(bin.integer))
            print(str(registers[j]) + " addr1 = " + str(addr1) + ", addr2 = " + str(addr2) + ", i = " + str(i) + ", j = " + str(j))
        elif(j is addr2):
            bin = cocotb.binary.BinaryValue(registers[j], 8, False, 0)
            s = s + bin.binstr
            print(str(bin.integer))
            print(str(registers[j]) + " addr1 = " + str(addr1) + ", addr2 = " + str(addr2) + ", i = " + str(i) + ", j = " + str(j))
        else:
            s = s + cocotb.binary.BinaryValue(i, 8, False, 0).binstr
            #s = s + z_byte
        j = j - 1
    return s
