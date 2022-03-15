import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_vert_cntr(dut):
    clock = Clock(dut.row_done, 10, units="ns")
    cocotb.start_soon(clock.start())

    for i in range(550):
        await FallingEdge(dut.row_done)
