/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module bit_shifter(
	input clock,
	input nreset,
	inout oe,
	input right_left,
	input [7:0] primary_operand,
	input [7:0] secondary_operand,
	output [2:0] flags,
	output [7:0] result
);
	reg [2:0] flags_value = 0;
	reg [7:0] value = 0;

	always @ (posedge clock)
	begin
		if(nreset == 1'b0 || enable == 1'b0)
		begin
			value <= 8'b00000000;
		end
		else
		begin
			if(right_left == 1'b1)
			begin
				//shift right
				for(Index=0 ; Index < 6 ; Index=Index+1)
				begin
					value[Index] = value[Index + 1];
				end
				value[7] = 1'b0;
			end
			else if (right_left == 1'b0)
			begin
				//shift left
				for(Index=7; Index>0; Index=Index-1)
				begin
					value[Index] = value[Index - 1];
				end
				value[0] = 1'b0;
			end
			else
			begin
				value <= 8'b00000000;
			end
		end
	end

	assign result = oe ? value : 8'hZZ;
	assign flags = oe ? flags_value : 3'bzzz;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("bit_shifter.vcd");
  $dumpvars (0, bit_shifter);
  #1;
end
`endif
endmodule
