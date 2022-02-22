`timescale 1ns/1ps
/*
Module - instruction_register
Author - Zachary Walden
Last Modified - 1/21/22
Description - This module is a 32-bit special purpose register. Its job is to store an instruction word.
Parameters - input clock - Clock input.
	     input nreset - reset signal
	     input stall - this signal will be asserted when the pipline is being stalled due to a resource, data, or branch contention.
		     input [31:0] data_in - This 32-bit value is the instruction fetched from memory. It is clocked in on the negative edge of the clock due to my Spartan 7's Block RAM's memory latency.
*/

module instruction_register(
	input clock,
	input nreset,
	input stall,
	input [31:0] data_in,
	output [31:0] data_out
	);

	reg [31:0] value = 0;

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin
			value <= 0;
		end
		else
		begin
			value <= value;
		end
	end

	always @ (negedge clock)
	begin
		if(~stall && nreset)
		begin
			value <= data_in;
		end
		else
		begin
			value <= value;
		end
	end
	assign data_out = value;
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("instruction_register.vcd");
  $dumpvars (0, instruction_register);
  #1;
end
`endif
endmodule
