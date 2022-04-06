import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_call_stk(dut):
    clock = Clock(dut.clka, 10, units="ns")
    cocotb.start_soon(clock.start())

    addr = 0
    dut.wea.value = 0
    dut.dina.value = 0
    dut.nreset.value = 0
    await RisingEdge(dut.clka)
    dut.nreset.value = 1

    for i in range(256):
        dut.addra.value = addr
        await RisingEdge(dut.clka)
        assert dut.douta.value == 0, f"Reset Failed"
        addr += 1

    addr = 0

    for i in range(256):
        dut.wea.value = 1
        dut.addra.value = addr
        dut.dina.value = addr
        await RisingEdge(dut.clka)
        dut.wea.value = 0
        await RisingEdge(dut.clka)
        assert dut.douta.value == addr, f"Read & Write Failed."
        addr += 1
