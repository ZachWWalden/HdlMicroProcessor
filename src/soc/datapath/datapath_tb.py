import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_datapath(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    #Open Test Program.coe

    testProg = open("test.coe", "r")
    lines = testProg.readlines()
    #Define Program Memory
    prog_mem = []
    i = 2
    for a in range(16384):
        if(a == 16383):
            prog_mem.append(int("0x" + (lines[i].split(";"))[0], 16))
            break
        prog_mem.append(int("0x" + (lines[i].split(","))[0], 16))
        i += 1

    main_mem = []
    #Deine Main Memory
    for i in range(65536):
        main_mem.append(0)

    call_stk = []
    #Define The Call Stack
    for i in range(256):
        call_stk.append(0)

    frame_buf = []
    #Define The Framebuffer
    for i in range(19200):
        frame_buf.append(0)

    #Begin testing
    dut.nreset.value = 0
    dut.mem_fetch_instruction.value = 0
    dut.read_data.value = 0
    dut.call_stk_read_data.value = 0
    dut.stall_fetch.value = 0
    dut.stall_decode.value = 0
    dut.hazard_prog_cntr_sel.value = 1
    dut.inst_word_sel.value = 0
    dut.hazard_inst_word.value = 0
    dut.prog_cntr_int_addr.value = 0
    dut.sfr_file_in.value = 0
    await FallingEdge(dut.clock)
    dut.nreset.value = 1

    for i in range(250):
        dut.mem_fetch_instruction.value = prog_mem[dut.prog_cntr_val.value]
        await FallingEdge(dut.clock)
