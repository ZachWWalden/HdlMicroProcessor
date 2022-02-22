import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_if_id(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.nreset.value = 1
    dut.stall.value = 0
    await FallingEdge(dut.clock)

    #Test clock in nreset = 1, stall = 0
    dut.instruction_in.value = 0xFFFFFFFF
    await FallingEdge(dut.clock)
    assert dut.instruction_out.value == 0xFFFFFFFF, f"Instruction clock in failed"

    #test the take branch control signal passthrough from the Instruction Decode pipeline stage.
    dut.take_branch_addr.value = 1
    await FallingEdge(dut.clock)
    assert dut.take_branch_addr_out == 1, f"Take brach passthrough failed"

    #Test stall, nreset = 1, stall = 1
    dut.stall.value = 1
    dut.instruction_in.value = 0xFFFFFFFF
    await FallingEdge(dut.clock)
    assert dut.instruction_out.value == 0, f"Stall Failed"

    #Test reset, nreset = 0 other signals do not matter.
    dut.nreset.value = 0
    dut.instruction_in.value = 0xFFFFFFFF
    await FallingEdge(dut.clock)
    assert dut.instruction_out.value == 0, f"Reset failed"
