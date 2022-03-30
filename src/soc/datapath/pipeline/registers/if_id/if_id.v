/*
Module - Instruction Fetch/Instruction Decode Pipeline Register.
Author - Zach Walden
Last Changed - 2/12/22, 3/27/22
Description - This register simply stores the instruction word coming out of the fetch port on the positive edge of every clock.
Parameters - 	clock - System Clock.
		nreset - Active low system reset signal.
		[31:0] instruction_in - Instruction word input. This bus comes directly from the program memory read port in the Instruction Fetch pipeline stage.
		[31:0] instruction_out - Instruction word output going to the decode pipeline stage.
*/

module if_id(
	input clock,
	input nreset,
	input take_branch_addr_in,
	output take_branch_addr_out,
	input [31:0] instruction_in,
	output reg [31:0] instruction_out = 0,
	input [13:0] return_addr_in,
	output reg [13:0] return_addr_out = 0
);

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin
			instruction_word_out <= 32'h00000000;

			return_addr_out <= 0;
		end
		else
		begin
			instruction_word_out <= instruction_in;

			return_addr_out <= return_addr_in;
		end
	end

	assign take_branch_addr_out = take_branch_addr_in;

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("if_id.vcd");
  $dumpvars (0, if_id);
  #1;
end
`endif
*/
endmodule
