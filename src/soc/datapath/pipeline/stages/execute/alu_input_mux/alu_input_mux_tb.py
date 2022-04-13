import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_alu_input_mux(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    await FallingEdge(dut.clock)
    dut.id_ex_data_top.value = 0x0FF
    dut.id_ex_data_bot.value = 0x0FF
    dut.ex_mem_top.value = 0x0EE
    dut.ex_mem_bot.value = 0x0EF
    dut.mem_wb_top.value = 0x0DD
    dut.mem_wb_bot.value = 0x0DF

    dut.alu_input_sel_top.value = 1
    dut.alu_input_sel_bot.value = 1

    await FallingEdge(dut.clock)
    assert dut.alu_data_input_top.value == 0x0FF, f"Mux Failed on Reg File inputs"
    assert dut.alu_data_input_bot.value == 0x0FF, f"Mux failed on reg file inputs"

    dut.alu_input_sel_top.value = 2
    dut.alu_input_sel_bot.value = 2

    await FallingEdge(dut.clock)
    assert dut.alu_data_input_top.value == 0x0EE, f"Mux Failed on ex_mem_top inputs"
    assert dut.alu_data_input_bot.value == 0x0EE, f"Mux failed on ex_mem_top inputs"

    dut.alu_input_sel_top.value = 4
    dut.alu_input_sel_bot.value = 4

    await FallingEdge(dut.clock)
    assert dut.alu_data_input_top.value == 0x0EF, f"Mux Failed on ex_mem_bot inputs"
    assert dut.alu_data_input_bot.value == 0x0EF, f"Mux failed on ex_mem_bot inputs"

    dut.alu_input_sel_top.value = 8
    dut.alu_input_sel_bot.value = 8

    await FallingEdge(dut.clock)
    assert dut.alu_data_input_top.value == 0x0DD, f"Mux Failed on mem_wb_top inputs"
    assert dut.alu_data_input_bot.value == 0x0DD, f"Mux failed on mem_wb_top inputs"

    dut.alu_input_sel_top.value = 16
    dut.alu_input_sel_bot.value = 16

    await FallingEdge(dut.clock)
    assert dut.alu_data_input_top.value == 0x0DF, f"Mux Failed on mem_wb_bot inputs"
    assert dut.alu_data_input_bot.value == 0x0DF, f"Mux failed on mem_wb_bot inputs"
