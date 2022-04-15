import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_cpu(dut):
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
            value = int("0x" + (lines[i].split(";"))[0], 16)
            prog_mem.append(value & 0x0FF)
            prog_mem.append(value & 0x0FF00 >> 8)
            prog_mem.append(value & 0x0FF0000 >> 16)
            prog_mem.append(value & 0x0FF000000 >> 24)
            break
        value = int("0x" + (lines[i].split(","))[0], 16)
        prog_mem.append(value & 0x0FF)
        prog_mem.append(value & 0x0FF00 >> 8)
        prog_mem.append(value & 0x0FF0000 >> 16)
        prog_mem.append(value & 0x0FF000000 >> 24)
        i += 1

    #Define Program Memory
    prog_mem_fetch = []
    i = 2
    for a in range(16384):
        if(a == 16383):
            prog_mem_fetch.append(int("0x" + (lines[i].split(";"))[0], 16))
            break
        prog_mem_fetch.append(int("0x" + (lines[i].split(","))[0], 16))
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
    for i in range(32768):
        frame_buf.append(0)

    testProg.close()

    #Begin testing
    dut.nreset.value = 0

    await FallingEdge(dut.clock)
    dut.nreset.value = 1

    for i in range(1000):
        dut.prog_mem_douta.value = prog_mem_fetch[dut.prog_mem_addra.value]
        await FallingEdge(dut.clock)
        #perform any memory reads or writes;
        #Program memory read
        dut.prog_mem_doutb.value = prog_mem[dut.addr_in.value]
        #call stack
        if dut.call_stk_wen.value == 1:
            call_stk[dut.call_stk_addr.value] = dut.call_stk_din.value
        else:
            dut.call_stk_dout.value = call_stk[dut.call_stk_addr.value]
        #main memory
        if dut.main_mem_wen.value == 1:
            main_mem[dut.addr_in.value] = dut.data_in.value & 0x0FF
        else:
            dut.main_mem_dout.value = main_mem[dut.addr_in.value]
        #Frame Buffer
        if dut.fb_wena.value == 1:
            frame_buf[dut.addr_in.value & 0x7FFF] = dut.data_in.value
        else:
            dut.fb_douta.value = frame_buf[(dut.addr_in.value) & 0x7FFF]
