/*
Module - Memory Pipeline Stage
Author - Zach Walden
Last Changed - 2/18/22, 3/28/22
Description - Memory Stage of the pipeline.
Parameters -
*/

module memory(
	input clock,
	input nreset,
	//BEGIN interface with EX/MEM pipeline register
	input [7:0] data_in_top,
	input [7:0] data_in_bot,
	input [31:0] instruction,
	input [3:0] mem_wb_data_input_sel_top,
	input [6:0] mem_wb_data_input_sel_bot,
	input [4:0] sfr_file_input_sel,
	input [6:0] mem_ptr_ctl,
	input [4:0] mem_str_data_input_sel_top,
	input [4:0] mem_str_data_input_sel_bot,
	input [1:0] sfr_file_wren,
	//BEGIN interface with MEM/WB pipeline register
	output [7:0] data_out_top,
	output [7:0] data_out_bot
	input [7:0] mem_wb_top,
	input [7:0] mem_wb_bot,
	input [7:0] mem_wb_tm1_top,
	input [7:0] mem_wb_tm1_bot,
	//BEGIN interface with memory i/o unit
	output [16:0] address,
	output [7:0] call_stack_ptr,
	output [15:0] stack_ptr,
	input [11:0] mem_read_data, 		//This is assumed to be sign extended.
	output [11:0] mem_write_data,
	//BEGIN I/O interface
	input [31:0] sfr_file_in,
	output [143:0] sfr_file_out
);

	wire [7:0] sfr_input;
	//instantiate sfr input mux
	sfr_sel_mux sfr_in_sel(
		//.clock(clock),
		.sel_signals(sfr_file_input_sel),
		.ex_mem_data_bot(data_in_bot),
		.mem_wb_data_top(mem_wb_top),
		.mem_wb_data_bot(mem_wb_bot),
		.mem_wb_tm1_data_top(mem_wb_tm1_top),
		.mem_wb_tm1_data_bot(mem_wb_tm1_bot),
		.sfr_data_input(sfr_input)
	);

	wire [7:0] sfr_output;
	wire [15:0] x_ptr;
	wire [15:0] y_ptr;
	wire [15:0] z_ptr;
	wire [15:0] stack_ptr;
	wire fb_segment;
	//instantiate SFR file
	sfr_file sf_reg_file(
		.clock(clock),
		.nreset(nreset),
		.mem_ptr_ctl_signals(mem_ptr_ctl), 	//Add to control signal list
		.wren(sfr_file_wren),
		.wr_addr(instruction[12:8]),
		.write_data(sfr_input),
		.rd_addr(instruction[17:13]),
		.read_data(sfr_output),
		.stack_ptr(stack_ptr),
		.x_ptr(x_ptr),
		.y_ptr(y_ptr),
		.z_ptr(z_ptr),
		.fb_segment(address[16]),  	//This is now a page address, rather than a segment address.
		.call_stk_ptr(call_stack_ptr),
		.sfr_file_in(sfr_file_in),
		.sfr_file_out(sfr_file_out)
	);

	//instantiate memeory io data input mux
	mem_str_data_sel_mux mem_data_in_mux(
		//.clock(clock),
		.sel_signal_top(mem_str_data_input_sel_top),
		.sel_signal_bot(mem_str_data_input_sel_bot),
		.ex_mem_data_top(ex_mem_data_top),
		.ex_mem_data_bot(ex_mem_data_bot),
		.mem_wb_data_top(mem_wb_top),		//these signals must be connected to the data outputs of the MEM/WB pipeline register.
		.mem_wb_data_bot(mem_wb_bot),
		.mem_wb_tm1_data_top(mem_wb_tm1_top),
		.mem_wb_tm1_data_bot(mem_wb_tm1_bot),
		.mem_data(mem_write_data)
	);

	wire [3:0] mem_addr_sel_signals; //instruction[19:18]
	assign mem_addr_sel_signals[0] = ~instruction[18] & ~instruction[19];
	assign mem_addr_sel_signals[0] = instruction[18] & ~instruction[19];
	assign mem_addr_sel_signals[0] = ~instruction[18] & instruction[19];
	assign mem_addr_sel_signals[0] = instruction[18] & instruction[19];
	//instantiate memeory address input mux
	mem_addr_sel_mux mem_addr_in_mux(
		//.clock(clock),
		.sel_signals(mem_addr_sel_signals),
		.x_ptr(x_ptr),
		.y_ptr(y_ptr),
		.z_ptr(z_ptr),
		.stack_ptr(stack_ptr),
		.mem_addr(address[15:0])
	);

	//instantiate MEM/WB data input mux
	mem_wb_data_input_mux mem_wb_input_mux(
			//.clock(clock),
			.sel_signals_top(mem_wb_data_input_sel_top),
			.sel_signals_bot(mem_wb_data_input_sel_bot),
			.sfr_data(sfr_output),
			.ex_mem_data_top(data_in_top),
			.ex_mem_data_bot(data_in_bot),
			.ld_res_top(mem_read_data[11:8]),
			.ld_res_bot(mem_read_data[7:0]),
			.mem_wb_top(mem_wb_top),
			.mem_wb_bot(mem_wb_bot),
			.mem_wb_tm1_top(mem_wb_tm1_top),
			.mem_wb_tm1_bot(mem_wb_tm1_bot),
			.mem_data_out_top(data_out_top),
			.mem_data_out_bot(data_out_bot)
		);

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("memory.vcd");
  $dumpvars (0, memory);
  #1;
end
`endif
*/
endmodule
