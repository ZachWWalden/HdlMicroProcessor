/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module decode(
	input clock,
	input nreset,
	input stall,
	//BEGIN interface definition with General Purpose Register File.
	output [1:0] reg_file_ren,
	output [9:0] reg_file_read_addr,
	//BEGIN Interface with IF/ID pipeline register
	output take_branch_address,
	input [31:0] instruction_word
	//BEGIN Interface with ID/EX pipeline register.
	input [7:0] ex_mem_operation,
	input [4:0] ex_mem_addr_low,
	input [4:0] ex_mem_addr_high,
	input [7:0] mem_wb_operation,
	input [4:0] mem_wb_addr_low,
	input [4:0] mem_wb_addr_high,
	output [5:0] alu_top_select,
	output [6:0] alu_bot_select,
	output [1:0] ex_mem_data_input_sel,
	output [1:0] mem_wb_data_input_sel,
	output alu_enable,
	output [1:0] mem_wren,
	output main_memory_en,
	output fb_en,
	output call_stack_en,
	output [1:0] reg_file_wen,
	output [1:0] sfr_file_wren,
	//BEGIN interface to hazard unit.
	output request_stall,
	output ret 					//This signal is neccessary in order to communicate to the hazard unit that a return instruction has entered the pipeline. Requiring fetch to stall until the return address can be popped off of the call stack and loaded into the program counter.
);

	//instantiate instruction decode unit.

	//instantiate branch_resolution_logic.

	//instantiate alu forwarding unit.

	//instantiate ex_mem_data_input_mux

	always @ (posedge clock)
	begin

	end

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("decode.vcd");
  $dumpvars (0, decode);
  #1;
end
`endif
endmodule
