import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_program_counter(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.stall.value = 0

    #Test Parallel Load
    dut.nreset.value = 1
    dut.branch_target.value = 0x20
    dut.take_branch_target.value = 1
    await FallingEdge(dut.clock)
    assert dut.prog_mem_addr_fetch.value == 0x20, f"Parallel Load Failed"

    #Test That data on load bus is not latched without the take_branch_target signal high
    #This test also verifies the supremacy of take_branch_target over stall.
    dut.branch_target.value = 0x10
    dut.take_branch_target.value = 0
    await FallingEdge(dut.clock)
    assert dut.prog_mem_addr_fetch.value == 0x21, f"Parallel Load occured when signal was low. or stall did not function properly addr = {dut.prog_mem_addr_fetch.value}"

    #Test that an increment does not occur by pulling stall high.
    dut.stall.value = 1
    await FallingEdge(dut.clock)
    assert dut.prog_mem_addr_fetch.value == 0x21, f"Program Counter Increment occured when stall was asserted"

    #Ensure control signal supremacy nreset > take_branch_target > stall
    #Care Must be taken, that on a cycle in which the program counter must stall, the take_branch_target signal, must be low.
    dut.nreset.value = 0
    dut.stall.value = 1
    dut.take_branch_target.value = 1
    await FallingEdge(dut.clock)
    assert dut.prog_mem_addr_fetch == 0, f"Reset did not function, or it did not have supremacy over stall and take_branch_target"
