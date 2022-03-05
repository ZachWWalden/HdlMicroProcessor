import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_branch_resolution_logic(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    #Run Through Each Control Flow Opcode, Jump and Branches.

    #Jump Opcode = 0b00111 1 00
    dut.operation.value = 0x3C
    #Loop through each value for the flags registor 0-8 decimal and ensure that take_branch_target is high.
    for i in range(8):
        dut.flags.value = i
        await FallingEdge(dut.clock)
        assert dut.take_branch_target.value == 1, f"Jump failed."

    #Branch If Carry Set Opcode = 0b00111 1 01
    dut.operation.value = 0x3D
    dut.flags.value = 0
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 0, f"BRCS Taken when carry cleared"
    dut.flags.value = 4
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 1, f"BRCS Not Taken when carry is set"

    #Branch If Carry Clear Opcode = 0b00111 0 01
    dut.operation.value = 0x39
    dut.flags.value = 4
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 0, f"BRCS Taken when carry set"
    dut.flags.value = 0
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 1, f"BRCS Not Taken when carry is cleared"

    #Branch If Equal Opcode = 0b00111 1 10
    dut.operation.value = 0x3E
    dut.flags.value = 0
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 0, f"BREQ Taken when Zero flag is cleared"
    dut.flags.value = 1
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 1, f"BREQ Not Taken when Zero flag is set"

    #Branch If Not Equal Opcode = 0b00111 0 10
    dut.operation.value = 0x3A
    dut.flags.value = 1
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 0, f"BRNE Taken when Zero flag is set"
    dut.flags.value = 0
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 1, f"BRNE Not Taken when Zero flag is cleared"

    #Branch If Negative Opcode = 0b00111 1 11
    dut.operation.value = 0x3F
    dut.flags.value = 0
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 0, f"BRNG Taken when Negative flag is cleared"
    dut.flags.value = 3
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 1, f"BRNG Not Taken when Negative flag is set"

    #Branch If Positive Opcode = 0b00111 0 11
    dut.operation.value = 0x3B
    dut.flags.value = 3
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 0, f"BRPS Taken when Negative flag is set"
    dut.flags.value = 0
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 1, f"BRPS Not Taken when Negative flag is cleared"

    #Test if a branch is taken when a non branch operation is set
    dut.operation.value = 0
    dut.flags.value = 0
    await FallingEdge(dut.clock)
    assert dut.take_branch_target.value == 0, f"Branch Target Taken on a non branch operation."
