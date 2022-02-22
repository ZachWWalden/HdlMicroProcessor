import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_alu(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.nreset.value = 1

    await FallingEdge(dut.clock)

    #test Adder/Subtractor (tests for carry & negative & zero)
    dut.alu_operation.value = 0 & 0x3

    # add 1 to ff this should result in over flow leaving the result to be zero with the carry and zero flags set.
    dut.top_operand.value = 0x0FF
    dut.bottom_operand.value = 0x1
    dut.alu_operation_select.value = 0x1 & 0x1 #select an addition
    await FallingEdge(dut.clock)
    assert dut.alu_out.value.integer & 0x00FF == 0, f"addition result incorrect"
    assert dut.alu_flags.value == 0x5, f"carry & zero not set in adder test"

    dut.top_operand.value = 0x07E
    dut.bottom_operand.value = 0x1
    await FallingEdge(dut.clock)
    assert dut.alu_out.value.integer & 0x00FF == 0x07F, f"addition result incorrect"
    assert dut.alu_flags.value == 0x0, f"carry & zero not set in adder test"

    #set bottom_operand to 0 to test the negative flag. carry and zero should be cleared.
    dut.top_operand.value = 0x0FF
    dut.bottom_operand.value = 0x00
    await FallingEdge(dut.clock)
    assert dut.alu_out.value.integer & 0x00FF == 0xFF, f"addition result incorrect"
    assert dut.alu_flags.value == 0x2, f"negative not set in adder test"

    #test signed operation -1 = 0xFF
    dut.top_operand.value = 0x0FF
    dut.bottom_operand.value = 0x0FF
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == -2 & 0x0FF, f"two's complement addition value failed"
    assert dut.alu_flags.value == 6, f"bad flags in -1 + -1 addition test"

    #BEGIN SUBTRACTION TESTS
    #test a non overflowed subtraction.
    dut.alu_operation_select.value = 0x0
    dut.top_operand.value = 0x1
    dut.bottom_operand.value = 0x1
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0, f"subtract 1 from 1 failed to produce 0"
    assert dut.alu_flags.value == 1, f"zero flag not set"

    #test that, when correct, no flags are set
    dut.top_operand.value = 0x0A
    dut.bottom_operand.value = 0x1
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 9, f"subtract 1 from 9 failed to produce 0"
    assert dut.alu_flags.value == 0, f"flag set"

    #Test an overflowed subtraction
    dut.top_operand.value = 0x1
    dut.bottom_operand.value = 0x0FF
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0x2, f"subtract 255 from 1 failed to produce -254 in 9 bit form."
    assert dut.alu_flags.value == 4, f"flags not properly set in overflowed subtraction test."

    #Test a subtraction that produces a carry out, but does not overflow out of the 8-bit signed range. In this case 127 - 143 which produces -16 in 2's comp ie 0xF0
    dut.top_operand.value = 0x7F
    dut.bottom_operand.value = 0x8F
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0xF0, f"subtract 143 from 127 failed to produce -16"
    assert dut.alu_flags.value == 6, f"flags not set properly in non overflow, carried out subtraction"

    #Perform a non overflow subtraction that produces a carry and a negative value.
    dut.top_operand.value = 0x7F
    dut.bottom_operand.value = 0xFF
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0x80, f"subtract 255 from 255 failed to produce 0"
    assert dut.alu_flags.value == 6, f"flags not set properly in non overflow, carried out subtraction"
    await FallingEdge(dut.clock)

    #Test Multiplier (tests for negative & zero)
    dut.alu_operation.value = 1 & 0x3

    dut.top_operand.value = 0x0FF
    dut.bottom_operand.value = 0x0FF
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FFFF == (0x0FF * 0x0FF) & 0x0FFFF, f"multiply 255*255 failed"
    assert dut.alu_flags.value == 2, f"flags not set properly in 255*255 multiplication"

    #test multiplication by a 2's complement number THIS TEST WILL FAIL AS THE SIMULATOR DOES NOT INFER SIGNED MULTIPLICATION, HOWEVER, IT MAY WORK ON HARDWARE AS MY FPGA HAS A 25x18 signed hardware multiplier in each of its 120 DSP slices.:w
    dut.top_operand.value = 0x01
    dut.bottom_operand.value = 0x0FF
    await FallingEdge(dut.clock)
    #assert dut.alu_out.value & 0x0FFFF == (0x01 * (-1 & 0x0FF)) & 0x0FFFF, f"multiply 1*-1 failed"
    #assert dut.alu_flags.value == 2, f"flags not set properly in 1*-1 multiplication"

    #test the zero flag
    dut.top_operand.value = 0x0FF
    dut.bottom_operand.value = 0x0
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FFFF == 0, f"multiply 255*0 failed"
    assert dut.alu_flags.value == 1, f"flags not set properly in 255*0 multiplication"

    dut.top_operand.value = 0x00F
    dut.bottom_operand.value = 0x0F
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FFFF == 225 & 0x0FFFF, f"multiply 15*15 failed"
    assert dut.alu_flags.value == 0, f"flags not set properly in 15*15 multiplication"

    #Test Shifter (tests for negative(SHL) & zero)
    dut.alu_operation.value = 2 & 0x3

    #test Shift right. NOTE negative flag can never be high.
    dut.alu_operation_select.value = 1

    dut.top_operand.value = 0x0FF
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0x7F, f"right shift failed"
    assert dut.alu_flags.value == 0x4, f"carry not set when a 1 is shifted out SHR"

    dut.top_operand.value = 0x0FE
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0x7F, f"right shift failed"
    assert dut.alu_flags.value == 0x0, f"carry not set when a 1 is shifted out SHR"

    dut.top_operand.value = 0x1
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0, f"right shift failed"
    assert dut.alu_flags.value == 0x5, f"zero not set when a 1 is shifted out SHR"

    dut.top_operand.value = 0x0
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0, f"right shift failed"
    assert dut.alu_flags.value == 0x1, f"zero not set when a 1 is shifted out SHR"

    #test Shift left, negative and zero can never be simultaneously set.
    dut.alu_operation_select.value = 0

    dut.top_operand.value = 0xFF
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0x0FE, f"right shift failed"
    assert dut.alu_flags.value == 0x6, f"zero not set when a 1 is shifted out SHR"

    dut.top_operand.value = 0x7F
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0x0FE, f"right shift failed"
    assert dut.alu_flags.value == 0x2, f"zero not set when a 1 is shifted out SHR"

    dut.top_operand.value = 0x80
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0, f"right shift failed"
    assert dut.alu_flags.value == 0x5, f"zero not set when a 1 is shifted out SHR"

    dut.top_operand.value = 0x0
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0, f"right shift failed"
    assert dut.alu_flags.value == 0x1, f"zero not set when a 1 is shifted out SHR"

    #Test Bitwise Logic (Check negative and zero flags)
    dut.alu_operation.value = 3 & 0x3

    #Test bitwise and. Zero and Negative may never be high at the same time.
    dut.alu_operation_select.value = 1

    dut.top_operand.value = 0x0FF
    dut.bottom_operand.value = 0x0F
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 255 & 0x0F, f"bitwise and failed"
    assert dut.alu_flags.value == 0, f"flags not set properly in bitwise and"

    dut.top_operand.value = 0x0FF
    dut.bottom_operand.value = 0x0F0
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 255 & 0x0F0, f"bitwise and failed"
    assert dut.alu_flags.value == 2, f"flags not set properly in bitwise and"

    dut.top_operand.value = 0x0FF
    dut.bottom_operand.value = 0x0
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 255 & 0x0, f"bitwise and failed"
    assert dut.alu_flags.value == 1, f"flags not set properly in bitwise and"

    #Test bitwise or. Zero and Negative may never be high at the same time.
    dut.alu_operation_select.value = 0

    dut.top_operand.value = 0x0F0
    dut.bottom_operand.value = 0x0F
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0x0F0 | 0x0F, f"bitwise or failed"
    assert dut.alu_flags.value == 2, f"flags not set properly in bitwise or"

    dut.top_operand.value = 0x0
    dut.bottom_operand.value = 0x0
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0, f"bitwise or failed"
    assert dut.alu_flags.value == 1, f"flags not set properly in bitwise or"

    dut.top_operand.value = 0x02A
    dut.bottom_operand.value = 0x55
    await FallingEdge(dut.clock)
    assert dut.alu_out.value & 0x0FF == 0x7F, f"bitwise or failed"
    assert dut.alu_flags.value == 0, f"flags not set properly in bitwise or"
