import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_memory_io(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.mem_wen.value = 0

    dut.call_stk_en.value = 1
    #Read Call Stack
    dut.call_stk_data_in.value = 0x3FFF
    dut.call_stk_addr_in.value = 0xFF
    dut.call_stk_dout.value = 0x2AA
    await FallingEdge(dut.clock)
    assert dut.call_stk_addr.value == 0xFF, f"addr ass. failed."
    assert dut.call_stk_wen.value == 0, f"call stack wen ass. failed"
    assert dut.call_stk_data_out.value == 0x2AA, f"call stack read failed"

    #write to call stack
    dut.mem_wen.value = 1
    await FallingEdge(dut.clock)
    assert dut.call_stk_wen.value == 1, f"call stack write failed."
    assert dut.call_stk_data_in == 0x3FFF, f"data not properly propagating"

    dut.call_stk_en.value = 0

    #Write too the multiplexed memories. Main -> Framebuffer (Check that only the correct wen is 1)
    dut.data_in.value = 0xFFF
    dut.addr_in.value = 0x1FFFF

    #write to main memory
    dut.main_mem_en.value = 1
    await FallingEdge(dut.clock)
    assert dut.main_mem_wen.value == 1, f"main memory write failed."
    assert dut.main_mem_addr.value == 0x0FFFF, f"Address assignment failed for main mem"
    assert dut.main_mem_din.value == 0xFF, f"Data ass. failed, main mem"
    dut.main_mem_en.value = 0

    #write to the framebuffer.
    dut.fb_en.value = 1
    await FallingEdge(dut.clock)
    assert dut.frame_buf_wena.value == 1, f"FB write failed"
    assert dut.frame_buf_addra.value == 0x1FFFF, f"FB address ass. failed"
    assert dut.frame_buf_dina.value == 0xFFF, f"FB write data ass. failed"
    dut.fb_en.value = 0


    #read from the three multiplexed memories. Main -> Prog -> Framebuffer
    dut.mem_wen.value = 0
    dut.main_mem_dout.value = 0xFF
    dut.prog_mem_doutb.value = 0xEE
    dut.frame_buf_douta.value = 0xDDD

    #read from main memory
    dut.main_mem_en.value = 1
    await FallingEdge(dut.clock)
    assert dut.main_mem_wen.value == 0, f"main mem read failed"
    assert dut.data_out.value == 0x0FF, f"main mem data out multiplexing failed"
    dut.main_mem_en.value = 0

    #read from program memory
    dut.prog_mem_en.value = 1
    await FallingEdge(dut.clock)
    assert dut.prog_mem_addrb.value == 0x0FFFF, f"program memory address assignment ffailed"
    assert dut.data_out.value == 0x0EE, f"program memory data multiplex failed"
    dut.prog_mem_en.value = 0

    #read from the framebuffer
    dut.fb_en.value = 1
    await FallingEdge(dut.clock)
    assert dut.frame_buf_wena.value == 0, f"FB read failed"
    assert dut.data_out.value == 0xDDD, f"FB data multiplex Failed"
    dut.fb_en.value = 0

    #read from the instruction fetch port of program memory.
    dut.prog_mem_addr_fetch.value = 0x2AA
    dut.prog_mem_douta.value = 0xFEFEFEFE
    await FallingEdge(dut.clock)
    assert dut.prog_mem_addra.value == 0x2AA, f"Fetch prot address assign failed"
    assert dut.prog_mem_instruction.value == 0xFEFEFEFE, f"Fetch port data assignment failed"
