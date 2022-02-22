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
	output [2:0] flags,
	output [7:0] result
);

    integer Index;
    
	wire [2:0] flags_value;
	reg [7:0] value = 0;

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin
			value <= 8'b00000000;
		end
		else
		begin
		    value = primary_operand;
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
	
	//assign the zero flag
    assign flags_value[0] = (value[7:0] == 8'h00) ? 1'b1 : 1'b0;
    //assign the negative flag 
    assign flags_value[1] = value[7] ? 1'b1 : 1'b0;
    //if shift left carry flag == high bit, if shift right, carry flag = low bit. both of the input operand.
    assign flags_value[2] = (primary_operand[7] & ~right_left) | (primary_operand[0] & right_left);
    
	assign result = oe ? value : 8'hZZ;
	assign flags = oe ? flags_value : 3'bzzz;

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("bit_shifter.vcd");
  $dumpvars (0, bit_shifter);
  #1;
end
`endif
*/
endmodule
