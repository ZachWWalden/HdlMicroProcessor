/*
Module - Instruction Decode
Author - Zach Walden
Last Changed - 3/28/22
Description - Instruction Decode Pipeline Stage
Parameters -
*/

module decode(
	input clock,
	input nreset,
	//BEGIN interface definition with General Purpose Register File.
	output [1:0] reg_file_ren,
	input [7:0] reg_file_data_top,
	input [7:0] reg_file_data_bot,
	//BEGIN Interface with IF/ID pipeline register
	output take_branch_target,
	input [31:0] instruction_word,
	//BEGIN Interface with ID/EX pipeline register.
	input [31:0] id_ex_instruction,
	input [31:0] ex_mem_instruction,
	input [2:0] alu_flags,
	output [4:0] alu_top_sel,
	output [4:0] alu_bot_sel,
	output [1:0] ex_mem_data_input_sel,
	output mem_wen,
	output main_memory_en,
	output fb_en,
	output call_stack_en,
	output prog_mem_en,
	output [6:0] mem_ptr_ctl,
	output [1:0] reg_file_wen,
	output [1:0] sfr_file_wren,
	output [7:0] id_ex_data_top,
	output [7:0] id_ex_data_bot,
	//BEGIN interface to hazard unit.
	output stall_fetch,
	output stall_decode,
	output halt,
	output illegal_opcode_exception,
	output return_in_pipeline					//This signal is neccessary in order to communicate to the hazard unit that a return instruction has entered the pipeline. Requiring fetch to stall until the return address can be popped off of the call stack and loaded into the program counter.
);

	wire idex_data_sel;
	//instantiate instruction decode unit.
	decode_logic inst_decoder(
		.instruction(instruction_word),
		.reg_file_ren(reg_file_ren),
		.id_ex_data_input_sel(idex_data_sel),
		.ex_mem_data_input_sel(ex_mem_data_input_sel),
		.main_memory_enable(main_memory_en),
		.frame_buffer_enable(fb_en),
		.call_stack_enable(call_stack_en),
		.prog_mem_enable(prog_mem_en),
		.mem_ptr_ctl(mem_ptr_ctl),
		.sfr_wren(sfr_file_wren),
		.mem_wen(mem_wen),
		.reg_file_wen(reg_file_wen),
		.return_in_pipeline(return_in_pipeline),
		.stall_fetch(stall_fetch),
		.illegal_opcode_exception(illegal_opcode_exception),
		.halt(halt)
	);

	//instantiate branch_resolution_logic.
	branch_resolution_logic branch_resolver(
		//.clock(clock),
		.operation(instruction_word),
		.flags(alu_flags),
		.take_branch_target(take_branch_target)
	);

	//instantiate alu forwarding unit.
	alu_forwarding_logic forward_alu(
		//.clock(),
		.instruction(instruction_word),
		.ex_mem_instruction(ex_mem_instruction),
		.id_ex_instruction(id_ex_instruction),
		.alu_top_sel(alu_top_sel),
		.alu_bot_sel(alu_bot_sel),
		.stall_decode(stall_decode)
	);

	//instantiate ex_mem_data_input_mux
	id_ex_data_input_mux id_ex_mux(
		.sel_signal(idex_data_sel),
		.immeadiate_data(instruction_word[31:24]),
		.reg_file_top(reg_file_data_top),
		.reg_file_bot(reg_file_data_bot),
		.id_ex_data_input_top(id_ex_data_top),
		.id_ex_data_input_bot(id_ex_data_bot)
	);

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("decode.vcd");
  $dumpvars (0, decode);
  #1;
end
`endif
*/
endmodule
