/*
Module - instruction_register
Author - Zachary Walden
Last Modified - 1/21/22
Description - This module is a 32-bit special purpose register. Its job is to store an instruction word.
Parameters - input clock - Clock input.
	     input nreset - reset signal
*/

module instruction_register(
	input clock,
	input nreset,

	input wire [31:0] data_in,
	output reg [31:0] data_out
	);

	reg [31:0] value = 0;

	always @ (posedge clock)
	begin
		if(~nreset)
		begin
			value <= 0;
		end
		data_out <= value;
	end

	always @ (negedge clock)
	begin
		value <= data_in;
	end

endmodule
