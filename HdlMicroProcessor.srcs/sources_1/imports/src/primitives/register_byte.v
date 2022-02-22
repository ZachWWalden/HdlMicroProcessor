/*
Module - Simple 8-bit register
Author - Zach Walden
Last Changed - 1/21/22
Description - This module is a simple 8-bit register. Writes appear on the positive edge of the clock, reads occur on the negative edge of the clock.
	It takes a clock & reset signal, a write & read enable signal, and has to data ports, 8-bits in, and 8 bits out.
*/
`timescale 1ns / 1ps

module register_byte(
	input clock,
	input nreset,
	input write_enable,
	input [7:0] data_in,
	output [7:0] data_out
);

	reg [7:0] value = 0;

	always @ (posedge clock)
	begin
		if(~nreset)
		begin
			value <= 0;
		end
		else if(write_enable)
		begin
			value <= data_in;
		end
		else
		begin
		  value <= value;
		end
	end
    assign data_out = value;
endmodule
