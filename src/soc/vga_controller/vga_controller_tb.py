import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_vga_controller(dut):
    clock = Clock(dut.clock, 80, units="ns")
    cocotb.start_soon(clock.start())

    dut.pixel_data.value = 0xFFF
    dut.nreset.value = 1

    for i in range(4*76800):
        await FallingEdge(dut.clock)
