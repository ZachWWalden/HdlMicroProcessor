import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_ex_mem_data_input_mux(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    await FallingEdge(dut.clock)

    dut.reg_file_top.value = 0x0AA
    dut.reg_file_bot.value = 0x0AA
    dut.alu_res_top.value = 0x0FF
    dut.alu_res_bot.value = 0x0FF

    dut.sel_signals.value = 0

    await FallingEdge(dut.clock)
    assert dut.ex_data_out_top.value == 0x0AA, f"Muxing Failed on the top byte"
    assert dut.ex_data_out_bot.value == 0x0AA, f"Muxing Failed on the bottom byte"

    await FallingEdge(dut.clock)
    dut.sel_signals.value = 3

    await FallingEdge(dut.clock)
    assert dut.ex_data_out_top.value == 0x0FF, f"Muxing Failed on the top byte"
    assert dut.ex_data_out_bot.value == 0x0FF, f"Muxing Failed on the bottom byte"
