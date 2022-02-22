import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def flags_register_tb(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.stall.value = 0
    dut.nreset = 1

    #test clock in
    dut.new_flags.value = 7
    await FallingEdge(dut.clock)
    assert dut.cur_flags.value == 7, f"clock in failed"

    #test that stall blocks a clock in.
    dut.stall = 1
    dut.new_flags.value = 3
    await FallingEdge(dut.clock)
    assert dut.cur_flags.value == 7, f"stall did not block the latching of a new data value"

    #test reset & its supremacy.
    dut.nreset.value = 0
    await FallingEdge(dut.clock)
    assert dut.cur_flags.value == 0, f"reset failed"
