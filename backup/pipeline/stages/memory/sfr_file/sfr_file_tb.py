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

    dut.wren.value = 2

    #loop through each register and write too it.
    for i in range(32):
        dut.rd_addr.value = addr1 & 0x1F
        await FallingEdge(dut.clock)
        assert dut.read_data.value == 0x0, f"reset failed"
        addr1 = addr1 + 1
