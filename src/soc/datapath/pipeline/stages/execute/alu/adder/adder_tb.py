import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_adder(dut):
    clock = Clock(dut.clock, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.oe.value = 1;

    print("Starting Addition Test")
    dut.nreset.value = 1
    dut.add_sub.value = 1
    pri = 0
    sec = 1

    for i in range(256):
        dut.primary_operand.value = pri
        dut.secondary_operand.value = sec
        res = addition(pri, sec)
        await FallingEdge(dut.clock)
        assert dut.result.value == res, f"addition was unsuccessful with these operands: pri = {pri} sec = {sec}"
        pri = pri + 1

    print("Starting Subtraction Test")
    sec = 0xF0
    pri = 0x00
    dut.add_sub.value = 0

    for i in range(256):
        dut.primary_operand.value = pri
        dut.secondary_operand.value = sec
        res = subtraction(pri, sec)
        await FallingEdge(dut.clock)
        assert dut.result.value == res, f"Subtraction failed with these operands pri = {pri} sec = {sec}"
        pri = pri + 1

    #test what happens when reset and oe are asserted.




def addition(A, B):
    return (A + B) & 0xFF

def subtraction(A, B):
    return (A - B) & 0xFF
