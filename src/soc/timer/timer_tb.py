import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_timer(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.nreset.value = 1
    dut.control_reg.value = 1

    for i in range(200):
        await FallingEdge(dut.clock)

    assert dut.timer_value != 0, f"Timer Not counting"

    dut.control_reg.value = 0
    dut.nreset.value = 0
    await FallingEdge(dut.clock)
    assert dut.timer_value.value == 0, "Reset Failed"

    dut.control_reg.value = 1
    dut.nreset.value = 1

    cnt = 1

    for i in range(200):
        await FallingEdge(dut.clock)
        print(hex(cnt))
        assert dut.timer_value.value == cnt, "Timer not Counting synchrnously"
        cnt += 1

    dut.control_reg.value = 2
    await FallingEdge(dut.clock)
    assert dut.timer_value.value == 0, "Clear Bit failed"
