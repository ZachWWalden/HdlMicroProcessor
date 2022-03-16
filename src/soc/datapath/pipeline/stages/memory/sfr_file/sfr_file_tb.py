import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_sfr_file(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.nreset.value = 0
    await FallingEdge(dut.clock)
    dut.nreset.value = 1
    await FallingEdge(dut.clock)

    addr1 = 0

    dut.sfr_file_in.value = 0

    dut.wren.value = 2

    #loop through each register and write too it.
    for i in range(32):
        dut.rd_addr.value = addr1 & 0x1F
        await FallingEdge(dut.clock)
        assert dut.read_data.value == 0x0, f"reset failed"
        addr1 = addr1 + 1

    #NOTE It should be of note that, the way things are designed, there is a 2 cycle latency between when a value appears on an input line and when it can properly be read out into the processing pipeline. This is acceptable behaviuor as I/O will be a much slower series of events in comparison to CPU execution.

    #Test Input Functionality
    dut.sfr_file_in.value = 0x0000000FF
    await FallingEdge(dut.clock)
    dut.rd_addr.value = 28
    await FallingEdge(dut.clock)
    #await FallingEdge(dut.clock)
    assert dut.read_data.value == 0x0FF, f"Input failed"

    dut.sfr_file_in.value = 0x00000FF00
    await FallingEdge(dut.clock)
    dut.rd_addr.value = 29
    await FallingEdge(dut.clock)
    #await FallingEdge(dut.clock)
    assert dut.read_data.value == 0x0FF, f"Input failed"

    dut.sfr_file_in.value = 0x000FF0000
    await FallingEdge(dut.clock)
    dut.rd_addr.value = 30
    await FallingEdge(dut.clock)
    #await FallingEdge(dut.clock)
    assert dut.read_data.value == 0x0FF, f"Input failed"

    dut.sfr_file_in.value = 0x0FF000000
    await FallingEdge(dut.clock)
    dut.rd_addr.value = 31
    await FallingEdge(dut.clock)
    #await FallingEdge(dut.clock)
    assert dut.read_data.value == 0x0FF, f"Input failed"

    await FallingEdge(dut.clock)
    #await RisingEdge(dut.clock)

    #Test Writing in values.
    #This is a two cycle process.
    #Addresses 0-27

    for addr1 in range(28):
        dut.wren.value = 1
        dut.rd_addr.value = addr1
        dut.wr_addr.value = addr1
        dut.write_data.value = 0x0AA
        await FallingEdge(dut.clock)
        dut.wren.value = 2
        await FallingEdge(dut.clock)
        #await RisingEdge(dut.clock)
        assert dut.read_data.value == 0x0AA, f"Write, and then read failed."

    await FallingEdge(dut.clock)
    dut.wren.value = 0

    dut.mem_ptr_ctl_signals.value = 1
    await FallingEdge(dut.clock)
    #await RisingEdge(dut.clock)
    #assert dut.stack_ptr.value == 0x0AAAB

    dut.mem_ptr_ctl_signals.value = 2
    await FallingEdge(dut.clock)
    #await RisingEdge(dut.clock)
    #assert dut.stack_ptr.value == 0x0AAAA

    dut.mem_ptr_ctl_signals.value = 4
    await FallingEdge(dut.clock)
    dut.mem_ptr_ctl_signals.value = 0
    await FallingEdge(dut.clock)
    #assert dut.call_stk_ptr.value == 0x0AB

    dut.mem_ptr_ctl_signals.value = 8
    await FallingEdge(dut.clock)
    dut.mem_ptr_ctl_signals.value = 0
    await FallingEdge(dut.clock)
    #assert dut.call_stk_ptr.value == 0x0AA
