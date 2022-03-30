import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_interrupt_controller(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.nreset.value = 0
    dut.hazard_unit_state.value = 0
    dut.sfr_output.value = 1

    await FallingEdge(dut.clock)

    dut.nreset.value = 1

    dut.vblank_int.value = 0
    dut.illegal_opcode_exception.value = 0

    await FallingEdge(dut.clock)

    dut.vblank_int.value = 1
    dut.illegal_opcode_exception.value = 0

    await FallingEdge(dut.clock)
    await FallingEdge(dut.clock)
    assert dut.interrupt.value == 1, f"Failed"
    dut.hazard_unit_state.value = 2
    await FallingEdge(dut.clock)
    assert dut.interrupt.value == 0, f"Failed after ack"
    dut.hazard_unit_state.value = 0

    dut.vblank_int.value = 0
    dut.illegal_opcode_exception.value = 0

    await FallingEdge(dut.clock)

    dut.vblank_int.value = 0
    dut.illegal_opcode_exception.value = 1

    await FallingEdge(dut.clock)
    assert dut.interrupt.value == 1, f"Failed"
    dut.hazard_unit_state.value = 2

    await FallingEdge(dut.clock)
    assert dut.interrupt.value == 0, f"Failed"
