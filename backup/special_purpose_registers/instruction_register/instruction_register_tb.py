import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_instruction_register(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    k = 325894 #define a nonzerp value

    print("Starting write test")
    dut.nreset.value = 1
    dut.stall.value = 0
    await RisingEdge(dut.clock)
    dut.data_in.value = k
    await RisingEdge(dut.clock)
    assert dut.data_out.value == k, f"write did not work"

    print("Starting Stall Test")
    j = 1000000
    dut.data_in.value = j
    dut.stall.value = 1
    dut.nreset.value = 1
    await RisingEdge(dut.clock)
    dut.data_in.value = j
    await RisingEdge(dut.clock)
    assert dut.data_out.value == k, f"stall did not prevent the clock in of data."
    #Signals "stall" & "nreset" would normally conflict. This will not be an issue as the pipeline hazard module will pull all stall signals high long enough to achieve stability throughout the machine. This may be a few cycles due to "nreset" not being routed through through the FPGA's dedicated clocktree. Although, this likely will not be an issue since reset will be a human input and thus be pulled high for an exorbinantly long period of time from the perspective of the processor.

    print("Starting Reset Test")
    #This test will also verify that reset and stall do not conflict to introduce metastability.
    await RisingEdge(dut.clock)
    dut.stall.value = 0
    await FallingEdge(dut.clock)
    dut.nreset.value = 0
    await FallingEdge(dut.clock)
    dut._log.info("data_out is %s", dut.data_out.value)
    assert dut.data_out.value == 0, f"Reset did not function properly"
