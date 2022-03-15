import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_horiz_cntr(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    for i in range (410):
        await FallingEdge(dut.clock)
