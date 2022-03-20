import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_alu_forwarding_logic(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.instruction.value = 0x00000000
    dut.ex_mem_instruction.value = 0x00000000
    dut.id_ex_instruction.value = 0x00000000

    await FallingEdge(dut.clock)
    assert dut.alu_top_sel.value == 0x00001, f"ALU Top select not default"
    assert dut.alu_bot_sel.value == 0x00001, f"ALU Bottpm Select dot default"
    assert dut.stall_decode.value == 0, f"Stall High when all NOP"

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x006C20FB #Top Addr is 0x1, bottom addr is 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x00242080

    await FallingEdge(dut.clock)
    assert dut.stall_decode.value == 1, f"Stall High when all NOP"

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = 0x00000000

    await FallingEdge(dut.clock)
    assert dut.alu_top_sel.value ==0x10, f"ALU Top select not default"
    assert dut.alu_bot_sel.value == 0x8, f"ALU Bottpm Select dot default"
    assert dut.stall_decode.value == 0, f"Stall High when all NOP"

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x006C20FB

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0F2C20BC

    await FallingEdge(dut.clock)
    assert dut.stall_decode.value == 1, f"Dependent Load did not stall"

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = 0x00000000

    await FallingEdge(dut.clock)
    assert dut.alu_top_sel.value ==0x10, f"ALU Top select not default"
    assert dut.alu_bot_sel.value == 0x1, f"ALU Bottpm Select dot default"
    assert dut.stall_decode.value == 0, f"Stall High when all NOP"

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)

    #Shift the Instructions
    dut.ex_mem_instruction.value = dut.id_ex_instruction.value
    dut.id_ex_instruction.value = dut.instruction.value
    dut.instruction.value = 0x0

    await FallingEdge(dut.clock)
