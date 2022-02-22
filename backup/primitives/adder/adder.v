/*
Module - Adder
Author - Zach Walden
Last Changed - 1/28/22
Description - Adds or subtracts two operands. This module sets all 3 flags.
Parameters - input clock - system clock
	     input nreset - system reset, active low.
	     input add_sub - 0 results in a subtraction 1 results in an addition.
	     input oe - 1 results in the devices data being output to the alu output bus. 0 high impedance.
	     input [7:0] primary_operand - speakes for itself.
	     input [7:0] secondary_operand - speaks for itself.
	     output [2:0] flags - carry, negative, and zero flags in order from most to least significant.
	     output [7:0] result - a-bit adder result.
*/

module adder(
	input clock,
	input nreset,
	input add_sub,
	input oe,
	input [7:0] primary_operand,
	input [7:0] secondary_operand,
	output [2:0] flags,
	output [7:0] result
);

	reg [2:0] flag_result = 0;
	reg [8:0] value = 0;

	always @ (posedge clock)
	begin
		if(nreset ==1'b0)
		begin
			value <= 9'b000000000;
			flag_result <= 3'b000;
		end
		else
		begin
			if(add_sub == 1'b1)
			begin
				value = primary_operand + secondary_operand;
			end
			else if(add_sub == 1'b0)
			begin
				value = primary_operand - secondary_operand;
			end
			else
			begin
				value = value;
			end

			if(value[7] == 1'b0)
			begin
				flag_result[1] <= 0;
			end
			else
			begin
				flag_result[1] <= 1;
			end

			if(value[7:0] == 8'b00000000)
			begin
				flag_result <= 1;
			end
			else
			begin
				flag_result <= 0;
			end

			flag_result[2] <= value[8];
		end
	end

	assign flags = oe ? flag_result : 3'bzzz;
	assign result = oe ? value[7:0] : 8'hZZ;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("adder.vcd");
  $dumpvars (0, adder);
  #1;
end
`endif
endmodule
