/*
Module - Instruction Fetch/Instruction Decode Pipeline Register.
Author - Zach Walden
Last Changed - 2/12/22
Description - This register simply stores the instruction word coming out of the fetch port on the positive edge of every clock.
Parameters - 	clock - System Clock.
		nreset - Active low system reset signal.
		[31:0] instruction_in - Instruction word input. This bus comes directly from the program memory read port in the Instruction Fetch pipeline stage.
		[31:0] instruction_out - Instruction word output going to the decode pipeline stage.
*/

module if_id(
	input clock,
	input nreset,
	input stall,
	input take_branch_addr,
	output take_branch_addr_out,
	input [31:0] instruction_in,
	output [31:0] instruction_out
);

	reg [31:0] instruction_word = 32'h00000000;

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin
			instruction_word <= 32'h00000000;
		end
		else if(stall == 1'b1)
		begin
			instruction_word <= instruction_word;
		end
		else
		begin
			instruction_word <= instruction_in;
		end
	end

	assign instruction_out = stall ? 32'h00000000 : instruction_word;
	assign take_branch_addr_out = take_branch_addr;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("if_id.vcd");
  $dumpvars (0, if_id);
  #1;
end
`endif
endmodule
