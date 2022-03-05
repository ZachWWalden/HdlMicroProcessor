/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module alu_forwarding_logic(
		input clock,
		input [31:0] instruction_word,
		input [7:0] mem_wb_operation,
		input [4:0] mem_wb_addr_low,
		input [4:0] mem_wb_addr_high,
		input [7:0] ex_mem_operation,
		input [4:0] ex_mem_addr_low,
		input [4:0] ex_mem_addr_high,
		input [7:0] id_ex_operation,
		input [4:0] id_ex_addr_low,
		input [4:0] id_ex_addr_high,
		output [4:0] alu_top_sel,
		output [5:0] alu_bot_sel,
		output stall_req
);

	wire [4:0] dec_addr_low = instruction_word[12:8]; 	//Destination Address
	wire [4:0] dec_addr_high = instruction_word[17:13]; 	//Source Address

	always @ (*)
	begin
		//If any potential hazard is detected.
		if(dec_addr_high == mem_wb_addr_high || dec_addr_high == mem_wb_addr_low || dec_addr_high == ex_mem_addr_high || dec_addr_high == ex_mem_addr_low || dec_addr_high == id_ex_addr_high || dec_addr_high == id_ex_addr_low || dec_addr_low == mem_wb_addr_high || dec_addr_low == mem_wb_addr_low || dec_addr_low == ex_mem_addr_high || dec_addr_low == ex_mem_addr_low || dec_addr_low == id_ex_addr_high || dec_addr_low == id_ex_addr_low)
		begin

		end
		else
		begin
			/*
			alu_bot_sel = 6'b000001;
			alu_top_sel = 5'b00001;
			stall_req = 1;
			*/
		end
	end

	assign alu_bot_sel = 1;
	assign alu_top_sel = 1;
	assign stall_req = 0;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("alu_forwarding_logic.vcd");
  $dumpvars (0, alu_forwarding_logic);
  #1;
end
`endif
endmodule
