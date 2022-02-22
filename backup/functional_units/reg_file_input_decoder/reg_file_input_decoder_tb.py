import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_reg_file_input_decoder(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    j = 0xFF11
    k = (~j) & 0xFFFF

    l = 0x3E0
    m = (~l) & 0x3FF

    await FallingEdge(dut.clock)

    dut.wr_en.value = 3
    dut.data_in.value = j
    dut.wr_addr.value = l

    await FallingEdge(dut.clock)
    dut.wr_en.value = 3
    dut.data_in.value = k
    dut.wr_addr.value = m
    dut.wen_int.value[0] = 3
    print(dut.wen_int.value)
    await FallingEdge(dut.clock)
    dut.wr_en.value = 3
    dut.data_in.value = j
    dut.wr_addr.value = l
    #test = dut.wen_int.value
    #test[0] = 3
    #dut.wen_int.value = test
    print(dut.wen_int.value)
    await FallingEdge(dut.clock)
    dut.wr_en.value = 3
    dut.data_in.value = k
    dut.wr_addr.value = m
    dut.wen_int.value[0] = 3
    print(dut.wen_int.value)
    await FallingEdge(dut.clock)
