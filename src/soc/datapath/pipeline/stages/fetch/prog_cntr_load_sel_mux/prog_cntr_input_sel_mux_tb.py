import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_CHANGE(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.sel_signals.value = 1

    dut.next_prog_cntr.value = 32
    dut.branch_target_addr.value = 64
    dut.int_branch_addr.value = 128
    dut.ret_addr.value = 256

    await FallingEdge(dut.clock)
    assert dut.prog_cntr_load_val.value == 64, f"failed"

    dut.sel_signals.value = 2
    await FallingEdge(dut.clock)
    assert dut.prog_cntr_load_val.value == 32, f"failed"

    dut.sel_signals.value = 4
    await FallingEdge(dut.clock)
    assert dut.prog_cntr_load_val.value == 128, f"failed"

    dut.sel_signals.value = 8
    await FallingEdge(dut.clock)
    assert dut.prog_cntr_load_val.value == 256, f"failed"
