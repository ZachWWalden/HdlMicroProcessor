import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge

@cocotb.test()
async def test_register_byte(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    print("starting write_enable and data_out test")
    k = 0
    dut.nreset.value = 1
    dut.write_enable.value = 1
    await FallingEdge(dut.clock)
    for i in range(256):
        dut.data_in.value = k
        await FallingEdge(dut.clock)
        assert dut.data_out.value == k, f"data_out was incorrect on the {i}th cycle"
        k = k + 1

    k = 10
    dut.write_enable.value = 0
    dut.nreset.value = 1
    await FallingEdge(dut.clock)
    dut.data_in.value = k
    await FallingEdge(dut.clock)
    assert dut.data_out.value == 255, f"Write occured with write enable low"

    print("starting reset test")
    dut.write_enable.value = 0
    await FallingEdge(dut.clock)
    dut.nreset.value = 0
    await FallingEdge(dut.clock)
    assert dut.data_out.value == 0, f"reset did not work properly"

    print("Starting write_enable nreset confliction test")
    dut.write_enable.value = 0
    dut.data_in.value = 27
    await FallingEdge(dut.clock)
    dut.nreset.value = 0
    await FallingEdge(dut.clock)
    assert dut.data_out.value == 0, f"reset and write_enable conflict"
