import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_inst_word_sel_mux(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.mem_inst_word.value = 0xFFFFFFFF
    dut.hazard_unit_inst_word.value = 0xAAAAAAAA

    dut.sel.value = 0
    #test taking memory instruction word.
    await FallingEdge(dut.clock)
    assert dut.inst_word_out.value == 0xFFFFFFFF, f"Taking Memory fetched value failed"

    #test taking hazard unit inst word
    dut.sel.value = 1
    await FallingEdge(dut.clock)
    assert dut.inst_word_out.value == 0xAAAAAAAA, f"Taking Hazard value failed"
