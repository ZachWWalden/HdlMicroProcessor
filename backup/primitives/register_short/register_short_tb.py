import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge
from cocotb.types import Logic
@cocotb.test()
async def test_register_short(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.ren.value = 3
    dut.wen.value = 0

    #Turn on Reset to ensure proper starting values.
    dut.nreset.value = 0
    await FallingEdge(dut.clock)
    #Turn off Reset
    dut.nreset.value = 1

    #initialize some test constants.
    j = 7
    k = 0x700
    l = ~(j | k)

    #test wen low
    await FallingEdge(dut.clock)
    dut.wen.value = 1
    dut.data_in.value = j
    await FallingEdge(dut.clock)
#   val = str(Logic(dut.data_out.value))
#   assert dut.data_out.value == j, f"wen low failed"

    #test wen high
    dut.wen.value = 2
    dut.data_in.value = k
    await FallingEdge(dut.clock)
#    assert dut.data_out.value == k, f"wen high failed"

    #test wen both
    dut.wen.value = 3
    dut.data_in.value = l
    await FallingEdge(dut.clock)
#   assert dut.data_out.value == l, f"wen both failed"

    #test wen both low
    dut.wen.value = 0
    dut.data_in.value = 0
    await FallingEdge(dut.clock)
#   assert dut.data_out.value == l, f"wen both low failed"


    #FIGURE OUT HOW TO TEST HIGH Z
    #test ren low
    dut.ren.value = 1
    await FallingEdge(dut.clock)
#   assert dut.data_out.value == l & 0x00FF, f"wen low failed"

    #test ren high
    dut.ren.value = 2
    await FallingEdge(dut.clock)
#   assert dut.data_out.value == l & 0xFF00, f"wen high failed"

    #test ren both high
    dut.ren.value = 3
    await FallingEdge(dut.clock)
#   assert dut.data_out.value == l, f"wen both failed"

    #test ren both low
    dut.ren.value = 0
    await FallingEdge(dut.clock)
#   assert dut.data_out.value == 0, f"wen both low failed"

    #test a single cycle write then read.
    dut.data_in.value = 0x6969
    dut.wen.value = 3
#   await FallingEdge(dut.clock)

    dut.data_in.value = 0x4242
    dut.ren.value = 3
    await FallingEdge(dut.clock)
#   assert dut.data_out == 0x4242, f"wite on positive edge did not take effect at negative edge for a read."

    #test high byte half cycle write.
    dut.wen.value = 2
    dut.data_in = 0x6969
    await FallingEdge(dut.clock)
#   assert dut.data_out.value == 0x6942, f"High byte did not properly write in the half cycle window"

    #test high byte half cycle write.
    dut.wen.value = 1
    dut.data_in = 0x6969
    await FallingEdge(dut.clock)
#   assert dut.data_out.value == 0x6969, f"Low byte did not properly write in the half cycle window"

    #Test reset along with supremacy over wen.
    dut.nreset.value = 0
    dut.wen.value = 3
    dut.ren.value = 3
    dut.data_in.value = 0xFFFF
    await FallingEdge(dut.clock)
#   assert dut.data_out.value == 0, "reset failed to have supremacy over write."
    await FallingEdge(dut.clock)
