/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module execute(
	input clock,
	input nreset,
	//BEGIN interface with ID/EX pipeline register.
	input [4:0] alu_top_sel,
	input [4:0] alu_bot_sel,
	input [7:0] data_in_top,
	input [7:0] data_in_bot,
	input [31:0] instruction,
	input [1:0] ex_mem_data_input_sel,
	output [2:0] flags_out,
	//BEGIN interface with EX/MEM pipeline register.
	input [31:0] ex_mem_operation,
	input [31:0] mem_wb_operation,
	input [7:0] ex_mem_data_top,
	input [7:0] ex_mem_data_bot,
	input [7:0] mem_wb_data_top, //Add this as a data passtrough in EX/MEM register.
	input [7:0] mem_wb_data_bot,
	output [7:0] data_out_top,
	output [7:0] data_out_bot,
	output [4:0] sfr_input_sel,
	output [4:0] mem_str_data_sel_top,
	output [4:0] mem_str_data_sel_bot,
	output [3:0] mem_wb_data_sel_top,
	output [6:0] mem_wb_data_sel_bot
);

	wire [7:0] alu_data_in_top;
	wire [7:0] alu_data_in_bot;
	wire [7:0] alu_data_top_inv;
	//instantiate alu input multiplexor
	alu_input_mux alu_mux(
		//.clock(clock),
		.alu_input_sel_top(alu_top_sel),
		.alu_input_sel_bot(alu_bot_sel),
		.id_ex_data_top(data_in_top),
		.id_ex_data_bot(data_in_bot),
		.ex_mem_top(ex_mem_data_top),
		.ex_mem_bot(ex_mem_data_bot),
		.mem_wb_top(mem_wb_data_top),
		.mem_wb_bot(mem_wb_data_bot),
		.alu_data_input_top(alu_data_in_top),
		.alu_data_input_bot(alu_data_in_bot)
	);

	assign alu_data_top_inv[0] = (instruction[20] & ~alu_data_in_top[0]) | (alu_data_in_top[0] & ~instruction[20]);
	assign alu_data_top_inv[1] = (instruction[20] & ~alu_data_in_top[1]) | (alu_data_in_top[1] & ~instruction[20]);
	assign alu_data_top_inv[2] = (instruction[20] & ~alu_data_in_top[2]) | (alu_data_in_top[2] & ~instruction[20]);
	assign alu_data_top_inv[3] = (instruction[20] & ~alu_data_in_top[3]) | (alu_data_in_top[3] & ~instruction[20]);
	assign alu_data_top_inv[4] = (instruction[20] & ~alu_data_in_top[4]) | (alu_data_in_top[4] & ~instruction[20]);
	assign alu_data_top_inv[5] = (instruction[20] & ~alu_data_in_top[5]) | (alu_data_in_top[5] & ~instruction[20]);
	assign alu_data_top_inv[6] = (instruction[20] & ~alu_data_in_top[6]) | (alu_data_in_top[6] & ~instruction[20]);
	assign alu_data_top_inv[7] = (instruction[20] & ~alu_data_in_top[7]) | (alu_data_in_top[7] & ~instruction[20]);

	wire [15:0] alu_out;
	wire [2:0] alu_flags_out;
	//instantiate alu
	alu alu(
		.clock(clock),
		.nreset(nreset),
		.alu_operation_select(instruction[18]),
		.alu_operation(instruction[1:0]),
		.top_operand(alu_data_top_inv),
		.bottom_operand(alu_data_in_bot),
		.alu_flags(alu_flags_out),
		.alu_out(alu_out)
	);
	assign flags_out = alu_flags_out;

	//instantiate EX/MEM data input multiplexor.
	ex_mem_data_input_mux ex_mem_input_mux(
		//.clock(clock),
		.sel_signals(ex_mem_data_input_sel),
		.id_ex_top(data_in_top),
		.id_ex_bot(data_in_bot),
		.alu_res_top(alu_out[15:8]),
		.alu_res_bot(alu_out[7:0]),
		.ex_data_out_top(data_out_top),
		.ex_data_out_bot(data_out_bot)
	);

	//instantiate memory forwarding stub.
	memory_forwarding_logic mem_frwd(
		//.clock(),
		.instruction(instruction),
		.ex_mem_instruction(ex_mem_operation),
		.mem_wb_instruction(mem_wb_operation),
		.sfr_input_sel(sfr_input_sel),
		.mem_wb_data_sel_top(mem_wb_data_sel_top),
		.mem_wb_data_sel_bot(mem_wb_data_sel_bot),
		.mem_write_data_sel_top(mem_str_data_sel_top),
		.mem_write_data_sel_bot(mem_str_data_sel_bot)
	);

	wire [2:0] cur_flags;
	//instantiate flags register.
	flags_register flags_reg(
		.clock(clock),
		.nreset(nreset),
		.new_flags(alu_flags_out),
		.cur_flags(cur_flags)
	);

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("execute.vcd");
  $dumpvars (0, execute);
  #1;
end
`endif
*/
endmodule
