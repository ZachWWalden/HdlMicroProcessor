import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_hazard_control_unit(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.nreset.value = 1
    dut.ret.value = 0
    dut.halt.value = 0
    dut.fetch_stl_req.value = 0
    dut.dec_stl_req.value = 0
    dut.interrupt.value = 0
    dut.interrupt_vector_address.value = 0x3FFF
    dut.take_branch_target.value = 0

    await RisingEdge(dut.clock)
    await RisingEdge(dut.clock)

    assert dut.stall_fetch.value == 0
    assert dut.stall_decode.value == 0, f"Normal Signal Bad"
    assert dut.prog_cntr_load_sel.value == 2, f"Bad"
    assert dut.inst_word_sel.value == 0, f"Normal Operation signals not correct."
    assert dut.control_state.value == 0, f"State not normal"

    #Test The ret sequence. and its immunity to interrupts.
    dut.ret.value = 1

    await RisingEdge(dut.clock)

    dut.ret.value = 0
    dut.interrupt.value = 1

    assert dut.control_state.value == 5, f"State Not Return 1"
    assert dut.stall_fetch.value == 1, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 2, f"Bad"
    assert dut.inst_word_sel.value == 1, f"Return 1 signals not correct."

    await RisingEdge(dut.clock)
    assert dut.control_state.value == 6, f"State Not Return 2"
    assert dut.stall_fetch.value == 1, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 2, f"Bad"
    dut.inst_word_sel.value == 1, f"Return 2 signals not correct."

    await RisingEdge(dut.clock)
    assert dut.control_state.value == 7, f"State Not Return 3"
    assert dut.stall_fetch.value == 1, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 8, f"Bad"
    assert dut.inst_word_sel.value == 1, f"Return 3 signals not correct."

    await RisingEdge(dut.clock)
    assert dut.stall_fetch.value == 0, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 2, f"Bad"
    assert dut.inst_word_sel.value == 0, f"Normal Operation signals not correct."
    assert dut.control_state.value == 0, f"State not normal"

    await RisingEdge(dut.clock)
    assert dut.stall_fetch.value == 0, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 4, f"Bad"
    assert dut.inst_word_sel.value == 1, f"Bad"
    assert dut.prog_cntr_int_addr.value == 0x3FFF
    assert dut.new_inst_word.value == 0xFFFC0042, f"Interrupt signals not correct."
    assert dut.control_state.value == 2, f"State not interrupt"

    #Test Halt
    dut.interrupt.value = 0
    dut.halt.value = 1
    await RisingEdge(dut.clock)
    await RisingEdge(dut.clock)
    assert dut.stall_fetch.value == 1, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 2, f"Bad"
    assert dut.inst_word_sel.value == 1, f"Bad"
    assert dut.prog_cntr_int_addr.value == 0, f"Bad"
    assert dut.new_inst_word.value == 0, f"Halt signals not correct."
    assert dut.control_state.value == 1, f"State not Halt"

    dut.halt.value = 0

    dut.fetch_stl_req.value = 1

    await RisingEdge(dut.clock)
    assert dut.stall_fetch.value == 1, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 2, f"Bad"
    assert dut.inst_word_sel.value == 1, f"Bad"
    assert dut.prog_cntr_int_addr.value == 0, f"Bad"
    assert dut.new_inst_word.value == 0, f"Halt signals not correct."
    assert dut.control_state.value == 1, f"State not Halt"

    dut.fetch_stl_req.value = 0
    dut.dec_stl_req.value = 1

    await RisingEdge(dut.clock)
    assert dut.stall_fetch.value == 1, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 2, f"Bad"
    assert dut.inst_word_sel.value == 1, f"Bad"
    assert dut.prog_cntr_int_addr.value == 0, f"Bad"
    assert dut.new_inst_word.value == 0, f"Halt signals not correct."
    assert dut.control_state.value == 1, f"State not Halt"

    dut.dec_stl_req.value = 0
    dut.ret.value = 1

    await RisingEdge(dut.clock)
    assert dut.stall_fetch.value == 1, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 2, f"Bad"
    assert dut.inst_word_sel.value == 1, f"Bad"
    assert dut.prog_cntr_int_addr.value == 0, f"Bad"
    assert dut.new_inst_word.value == 0, f"Halt signals not correct."
    assert dut.control_state.value == 1, f"State not Halt"

    dut.ret.value = 0
    dut.interrupt.value = 1

    await RisingEdge(dut.clock)
    assert dut.stall_fetch.value == 0, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 4, f"Bad"
    assert dut.inst_word_sel.value == 1, f"Bad"
    assert dut.prog_cntr_int_addr.value == 0x3FFF
    assert dut.new_inst_word.value == 0xFFFC0042, f"Interrupt signals not correct."
    assert dut.control_state.value == 2, f"State not interrupt"

    #Test Take Branch Target
    dut.interrupt.value = 0
    await RisingEdge(dut.clock)

    dut.take_branch_target.value = 1

    await RisingEdge(dut.clock)
    assert dut.stall_fetch.value == 0, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 1, f"Bad"
    assert dut.inst_word_sel.value == 1, f"Bad"
    assert dut.prog_cntr_int_addr.value == 0
    assert dut.new_inst_word.value == 0, f"Interrupt signals not correct."
    assert dut.control_state.value == 8, f"State not Take Branch Target"

    dut.take_branch_target.value = 0

    await RisingEdge(dut.clock)
    assert dut.stall_fetch.value == 0, f"Bad"
    assert dut.stall_decode.value == 0, f"Bad"
    assert dut.prog_cntr_load_sel.value == 2, f"Bad"
    assert dut.inst_word_sel.value == 0, f"Bad"
    assert dut.prog_cntr_int_addr.value == 0
    assert dut.new_inst_word.value == 0, f"Interrupt signals not correct."
    assert dut.control_state.value == 0, f"State not Normal"
