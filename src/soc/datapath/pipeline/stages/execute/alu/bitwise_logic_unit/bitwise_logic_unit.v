/*
Module - Bitwise Logic Unit
Author - Zach Walden
Last Changed - 1/25/22 11:47 PM
Description -
Parameters -
*/

module bitwise_logic_unit(
		input clock,
		input nreset,
		input oe,
		input and_or,
		input [7:0] primary_operand,
		input [7:0] secondary_operand,
		output [2:0] flags,
		output [7:0] result
);

	reg [7:0] value;
	wire [2:0] flags_result;

	always @ (*)
	begin
		if(and_or == 1'b1)
		begin
			value = primary_operand & secondary_operand;
		end
		else
		begin
			value = primary_operand | secondary_operand;
		end
	end

    assign flags_result[0] = (value == 8'h00) ? 1'b1 : 1'b0;
    assign flags_result[1] = value[7] ? 1'b1 : 1'b0;
    assign flags_result[2] = 0;  //there will never be a carry set when performing bitwise logic.

	assign result = oe ? value : 8'hZZ;
	assign flags = oe ? flags_result : 3'bzzz;

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("bitwise_logic_unit.vcd");
  $dumpvars (0, bitwise_logic_unit);
  #1;
end
`endif
*/
endmodule
