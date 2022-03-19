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
