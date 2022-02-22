/*
Module - Multiplier
Author - Zach Walden
Last Changed - 1/24/22 10:02 PM
Description - This module multiplies two 8-bit operands and produces a 16-bit result. It also checks & set the zero and negative flag accordingly.
Parameters - 	input [7:0] primary_operand - primary operand
		input [7:0] secondary_operand - secondary operand
		input enable - unit enable signal. This comes from the alu operation decode logic, it it asyncronous and is assumed to be valid on the rising edge of hte devices clock.
		output [2:0] flags - condition flags. This unit only accesses the zero flag - flags[0], and the negative flag - flags[1].
		output [7:0] result_low - This is the least significant byte of the result of multiplication.
		output [7:0] result_high - This is the most significant byte of the multiplication.
*/

module multiplier(
	input clock,
	input nreset,
	input [7:0] primary_operand,
	input [7:0] secondary_operand,
	input oe,
	output [2:0] flags,
	output [15:0] mult_out
);

	reg [15:0] result = 0;
	reg [2:0] flags_result = 0;

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin
			result <= 0;
			flags_result <= 0;
		end
		else
		begin
			result = primary_operand * secondary_operand;
			if(result == 16'b0000000000000000)
			begin
				flags_result[0] <= 1;
			end
			else
			begin
				flags_result[0] <= 0;
			end

			if(result[15] == 1'b1)
			begin
				flags_result[1] <= 1;
			end
			else
			begin
				flags_result[1] <= 0;
			end

		end
	end

	assign flags = oe ? flags_result : 3'bzzz;
	assign mult_out = oe ? result : 16'hZZZZ;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("multiplier.vcd");
  $dumpvars (0, multiplier);
  #1;
end
`endif
endmodule
