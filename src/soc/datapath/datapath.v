/*
Module - Datapath
Author - Zach Walden
Last Changed - 3/28/22
Description - This module contains the CPU's Datapath
Parameters -
*/

module datapath(
	input clock,
	input nreset,
	//Memory Interface
	output [13:0] prog_cntr_val,
	input [31:0] mem_fetch_instruction,
	output main_mem_en,
	output prog_mem_en,
	output fb_en,
	output call_stk_en,
	output mem_wen,
	output [16:0] mem_addr,
	output [7:0] call_stk_addr,
	output [11:0] write_data,
	input [11:0] read_data,
	output [13:0] call_stk_write_data,
	input [13:0] call_stk_read_data,
	//Hazard Unit Interface
	input stall_fetch,
	input stall_decode,
	input [2:0] hazard_prog_cntr_sel,
	input inst_word_sel,
	input [31:0] hazard_inst_word,
	input [13:0] prog_cntr_int_addr,
	output stall_fetch,
	output stall_decode,
	output halt,
	output illegal_opcode_exception,
	output return_in_pipeline,
	//SFR I/O Interface
	input [31:0] sfr_file_in,
	output [143:0] sfr_file_out
);

	wire [1:0] reg_file_wen;
	wire [1:0] reg_file_ren;
	wire [15:0] reg_file_rd_data;
	wire [15:0] reg_file_wr_data;
	wire [9:0] reg_file_rd_addr;
	wire [9:0] reg_file_wr_addr;
	//Istaniate Register File
	register_file reg_file(
		.clock(clock),
		.nreset(nreset),
		.wr_en(reg_file_wen),
		.rd_en(reg_file_ren),
		.wr_addr(reg_file_wr_addr),
		.rd_addr(reg_file_rd_addr),
		.data_in(reg_file_wr_data),
		.data_out(reg_file_rd_data)
	);

	wire [31:0] if_id_inst;
	//Instantiate Instruction Word Selection Mux
	inst_word_sel_mux fetch_inst_word_sel_mux(
		.sel(inst_word_sel),
		.prog_mem_out(mem_fetch_instruction),
		.hazard_call_instruction(hazard_inst_word),
		.instruction_word(if_id_inst)
	);

	wire [3:0] prog_cntr_sel;
	wire [13:0] branch_target_address;
	wire [13:0] fetch_return_address;
	wire [13:0] ret_addr_wb;
	//Instantiate Fetch Stage
	fetch fetch_stage(
		.clock(clock),
		.nreset(nreset),
		.stall(stall_fetch),
		.prog_mem_fetch_read_addr(prog_cntr_val),
		.prog_cntr_input_sel(prog_cntr_sel),
		.branch_target_address(branch_target_address),
		.interrupt_branch_addr(prog_cntr_int_addr),
		.ret_addr_mem(ret_addr_wb),
		.return_addr_out(fetch_return_address)
	);

	wire take_branch_addr;
	wire take_brach_addr_in;
	wire [31:0] if_id_inst_out;

	wire [13:0] if_id_ret_addr;
	//Instantiate IF/ID Pipeline Register
	if_id if_id_register(
		.clock(clock),
		.nreset(nreset),
		.take_branch_addr_in(take_brach_addr_in), 				//From the Decode Stage
		.take_branch_addr_out(take_branch_addr),
		.instruction_in(if_id_inst),
		.instruction_out(if_id_inst_out),
		.return_addr_in(fetch_return_address),
		.return_addr_out(if_id_ret_addr)
	);
	assign prog_cntr_sel[0] = take_branch_addr;
	assign prog_cntr_sel[3:1] = hazard_prog_cntr_sel;

	assign reg_file_rd_addr = if_id_inst_out[17:8];

	wire [31:0] id_ex_instruction_out;
	wire [31:0] ex_mem_instruction_out;
	wire [31:0] mem_wb_instruction_out;

	wire [2:0] alu_flags;
	wire [4:0] alu_top_sel;
	wire [4:0] alu_bot_sel;

	wire [1:0] ex_mem_data_input_sel_dec;

	wire mem_wen_dec;

	wire main_mem_en_dec;
	wire fb_en_dec;
	wire call_stk_en_dec;
	wire prog_mem_en_dec;

	wire [6:0] mem_ptr_ctl_dec;

	wire [1:0] reg_file_wen_dec;
	wire [1:0] sfr_wren_dec;

	wire [15:0] id_ex_data;
	//Instantiate Decode Stage
	decode decode_stage(
		.clock(clock),
		.nreset(nreset),
		//BEGIN interface definition with General Purpose Register File.
		.reg_file_ren(reg_file_ren),
		.reg_file_data_top(reg_file_rd_data[15:8]),
		.reg_file_data_bot(reg_file_data_top[7:0]),
		//BEGIN Interface with IF/ID pipeline register
		.take_branch_target(take_brach_addr_in),
		.instruction_word(if_id_inst_out),
		//BEGIN Interface with ID/EX pipeline register.
		.id_ex_instruction(id_ex_instruction_out),
		.ex_mem_instruction(ex_mem_instruction_out),
		.alu_flags(alu_flags),
		.alu_top_sel(alu_top_sel),
		.alu_bot_sel(alu_bot_sel),
		.ex_mem_data_input_sel(ex_mem_data_input_sel_dec),
		.mem_wen(mem_wen_decode),
		.main_memory_en(main_mem_en_dec),
		.fb_en(fb_en_dec),
		.call_stack_en(call_stk_en_dec),
		.prog_mem_en(prog_mem_en_dec),
		.mem_ptr_ctl(mem_ptr_ctl_dec),
		.reg_file_wen(reg_file_wen_dec),
		.sfr_file_wren(sfr_wren_dec),
		.id_ex_data_top(id_ex_data[15:0]),
		.id_ex_data_bot(id_ex_data[7:0]),
		//BEGIN interface to hazard unit.
		.stall_fetch(stall_fetch),
		.stall_decode(stall_decode),
		.halt(halt),
		.illegal_opcode_exception(illegal_opcode_exception),
		.return_in_pipeline(return_in_pipeline)
	);

	wire [4:0] alu_top_sel_out;
	wire [4:0] alu_bot_sel_out;

	wire mem_wen_id_ex;

	wire main_mem_en_idex;
	wire fb_en_idex;
	wire call_stk_en_idex;
	wire prog_mem_en_idex;

	wire [6:0] mem_ptr_ctl_idex;

	wire [1:0] ex_mem_data_input_sel_idex;

	wire [1:0] reg_file_wen_idex;
	wire [1:0] sfr_wren_idex;

	wire [15:0] id_ex_data_out;

	wire [13:0] ret_addr_idex;
	//Instantiate ID/EX Pipeline Register
	id_ex id_ex_register(
		.clock(clock),
		.nreset(nreset),
		.alu_top_select_in(alu_top_sel),
		.alu_top_select_out(alu_top_sel_out),
		.alu_bot_select_in(alu_bot_sel),
		.alu_bot_select_out(alu_bot_sel_out),
		.id_ex_top_in(id_ex_data[15:8]),
		.id_ex_top_out(id_ex_data_out[15:8]),
		.id_ex_bot_in(id_ex_data[7:0]),
		.id_ex_bot_out(id_ex_data_out[7:0]),
		.instruction_in(if_id_inst_out),
		.instruction_out(id_ex_instruction_out),
		.mem_wen_in(mem_wen_decode),
		.mem_wen_out(mem_wen_id_ex),
		.main_memory_enable_in(main_mem_en_dec),
		.main_memory_enable_out(main_mem_en_idex),
		.frame_buffer_enable_in(fb_en_dec),
		.frame_buffer_enable_out(fb_en_idex),
		.call_stack_enable_in(call_stk_en_dec),
		.call_stack_enable_out(call_stk_en_idex),
		.prog_mem_enable_in(prog_mem_en_dec),
		.prog_mem_enable_out(prog_mem_en_idex),
		.mem_ptr_ctl_in(mem_ptr_ctl_dec),
		.mem_ptr_ctl_out(mem_ptr_ctl_idex),
		.ex_mem_data_input_sel_in(ex_mem_data_input_sel_dec),
		.ex_mem_data_input_sel_out(ex_mem_data_input_sel_idex),
		.reg_file_wen_in(reg_file_wen_dec),
		.reg_file_wen_out(reg_file_wen_idex),
		.sfr_file_wren_in(sfr_wren_dec),
		.sfr_file_wren_out(sfr_wren_idex),
		.call_addr_in(if_id_ret_addr),
		.call_addr_out(ret_addr_idex)
	);

	wire [15:0] ex_mem_data_out;

	wire [15:0] execute_data_out;

	wire [4:0] sfr_input_sel_ex;
	wire [3:0] mem_str_data_sel_top_ex;
	wire [3:0] mem_str_data_sel_bot_ex;
	wire [3:0] mem_wb_data_sel_top_ex;
	wire [6:0] mem_wb_data_sel_bot_ex;
	//Instantiate Execute Stage
	execute execute_stage(
		.clock(clock),
		.nreset(nreset),
		//BEGIN interface with ID/EX pipeline register.
		.alu_top_sel(alu_top_sel_out),
		.alu_bot_sel(alu_bot_sel_out),
		.data_in_top(id_ex_data_out[15:8]),
		.data_in_bot(id_ex_data_out[7:0]),
		.instruction(id_ex_instruction_out),
		.ex_mem_data_input_sel(ex_mem_data_input_sel_idex),
		.flags_out(alu_flags),
		//BEGIN interface with EX/MEM pipeline register.
		.ex_mem_operation(ex_mem_instruction_out),
		.mem_wb_operation(mem_wb_instruction_out),
		.ex_mem_data_top(ex_mem_data_out[15:8]),
		.ex_mem_data_bot(ex_mem_data_out[7:0]),
		.mem_wb_data_top(mem_wb_data_out[15:8]), //Add this as a data passtrough in EX/MEM register().
		.mem_wb_data_bot(mem_wb_data_out[7:0]),
		.data_out_top(execute_data_out[15:8]),
		.data_out_bot(execute_data_out[7:0]),
		.sfr_input_sel(sfr_input_sel_ex),
		.mem_str_data_sel_top(mem_str_data_sel_top_ex),
		.mem_str_data_sel_bot(mem_str_data_sel_bot_ex),
		.mem_wb_data_sel_top(mem_str_data_sel_top_ex),
		.mem_wb_data_sel_bot(mem_str_data_sel_bot_ex)
	);

	wire [6:0] mem_ptr_ctl_exmem;

	wire [1:0] reg_file_wen_exmem;
	wire [1:0] sfr_wren_exmem;

	wire [4:0] sfr_input_sel_exmem;
	wire [3:0] mem_str_data_sel_top_exmem;
	wire [3:0] mem_str_data_sel_bot_exmem;
	wire [3:0] mem_wb_data_sel_top_exmem;
	wire [6:0] mem_wb_data_sel_bot_exmem;
	//Instantiate EX/MEM Pipeline Register
	ex_mem ex_mem_register(
		.clock(clock),
		.nreset(nreset),
		.data_top_in(execute_data_out[15:8]),
		.data_top_out(ex_mem_data_out[15:8]),
		.data_bot_in(execute_data_out[7:0]),
		.data_bot_out(ex_mem_data_out[7:0]),
		.instruction_in(id_ex_instruction_out),
		.instruction_out(ex_mem_instruction_out),
		.mem_wen_in(mem_wen_id_ex),
		.mem_wen_out(mem_wen),
		.main_memory_enable_in(main_mem_en_idex),
		.main_memory_enable_out(main_mem_en),
		.frame_buffer_enable_in(fb_en_idex),
		.frame_buffer_enable_out(fb_en),
		.call_stack_enable_in(call_stk_en_idex),
		.call_stack_enable_out(call_stk_en),
		.prog_mem_enable_in(prog_mem_en_idex),
		.prog_mem_enable_out(prog_mem_en),
		.mem_ptr_ctl_in(mem_ptr_ctl_idex),
		.mem_ptr_ctl_out(mem_ptr_ctl_exmem),
		.mem_wb_data_sel_top_in(mem_wb_data_sel_top_ex),
		.mem_wb_data_sel_top_out(mem_wb_data_sel_top_exmem),
		.mem_wb_data_sel_bot_in(mem_wb_data_sel_bot_ex),
		.mem_wb_data_sel_bot_out(mem_wb_data_sel_bot_exmem),
		.sfr_file_input_sel_in(sfr_input_sel_ex),
		.sfr_file_input_sel_out(sfr_input_sel_exmem),
		.mem_str_data_sel_top_in(mem_str_data_sel_top_ex),
		.mem_str_data_sel_top_out(mem_str_data_sel_top_exmem),
		.mem_str_data_sel_bot_in(mem_str_data_sel_bot_ex),
		.mem_str_data_sel_bot_out(mem_str_data_sel_bot_exmem),
		.reg_file_wen_in(reg_file_wen_idex),
		.reg_file_wen_out(reg_file_wen_exmem),
		.sfr_file_wren_in(sfr_wren_idex),
		.sfr_file_wren_out(sfr_wren_exmem),
		.call_addr_in(ret_addr_idex),
		.call_addr_out(call_stk_write_data)
	);

	wire [15:0] memory_data_out;
	wire [15:0] mem_wb_tm1_data_out;
	//Instantiate Memory Stage
	memory memory_stage(
		.clock(clock),
		.nreset(nreset),
		//BEGIN interface with EX/MEM pipeline register
		.data_in_top(ex_mem_data_out[15:8]),
		.data_in_bot(ex_mem_data_out[7:0]),
		.instruction(ex_mem_instruction_out),
		.mem_wb_data_input_sel_top(mem_wb_data_sel_top_exmem),
		.mem_wb_data_input_sel_bot(mem_wb_data_sel_bot_exmem),
		.sfr_file_input_sel(sfr_input_sel_exmem),
		.mem_ptr_ctl(mem_ptr_ctl_exmem),
		.mem_str_data_input_sel_top(mem_str_data_sel_top_exmem),
		.mem_str_data_input_sel_bot(mem_str_data_sel_bot_exmem),
		.sfr_file_wren(sfr_wren_exmem),
		//BEGIN interface with MEM/WB pipeline register
		.data_out_top(memory_data_out[15:8]),
		.data_out_bot(memory_data_out[7:0]),
		.mem_wb_top(mem_wb_data_out[15:8]),
		.mem_wb_bot(mem_wb_data_out[7:0]),
		.mem_wb_tm1_top(mem_wb_tm1_data_out[15:8]),
		.mem_wb_tm1_bot(mem_wb_tm1_data_out[7:0]),
		//BEGIN interface with memory i/o unit
		.address(mem_addr),
		.call_stack_ptr(call_stk_addr),
		//.stack_ptr(),
		.mem_read_data(read_data),
		.mem_write_data(write_data),
		//BEGIN I/O interface
		.sfr_file_in(sfr_file_in), 					//These are enormus.
		.sfr_file_out(sfr_file_out)
	);

	wire [15:0] mem_wb_data_out;
	//Instantiate MEM/WB Pipline Register
	mem_wb mem_wb_register(
		.clock(clock),
		.nreset(nreset),
		.data_top_in(memory_data_out[15:8]),
		.data_top_out(mem_wb_data_out[15:8]),
		.data_bot_in(memory_data_out[7:0]),
		.data_bot_out(mem_wb_data_out[7:0]),
		.data_tm1_top(mem_wb_tm1_data_out[15:8]),
		.data_tm1_bot(mem_wb_tm1_data_out[7:0]),
		.instruction_in(ex_mem_instruction_out),
		.instruction_out(mem_wb_instruction_out),
		.reg_file_wen_in(reg_file_wen_exmem),
		.reg_file_wen_out(reg_file_wen),
		.ret_addr_in(call_stk_read_data), 				//From Memory I/O buffer
		.ret_addr_out(ret_addr_wb)
	);

	assign reg_file_wr_data = mem_wb_data_out;

	assign reg_file_wr_addr = mem_wb_instruction_out[17:8];

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("datapath.vcd");
  $dumpvars (0, datapath);
  #1;
end
`endif
endmodule
