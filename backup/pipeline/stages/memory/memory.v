/*
Module - Memory Pipeline Stage
Author - Zach Walden
Last Changed - 2/18/22
Description - Memory Stage of the pipeline.
Parameters -
*/

module memory(
	input clock,
	input nreset,
	input stall,
	//BEGIN interface with EX/MEM pipeline register
	input [7:0] data_in_top,
	input [7:0] data_in_bot,
	input [31:0] instruction,
	input [1:0] memory_wren,
	input main_mem_en,
	input fb_en,
	input cs_en,
	input [1:0] mem_wb_data_input_sel,
	input sfr_file_input_sel,
	input [3:0] mem_str_data_input_sel_top,
	input [3:0] mem_str_data_input_sel_bot,
	input [1:0] sfr_file_wren,
	//BEGIN interface with MEM/WB pipeline register
	output [7:0] data_out_top,
	output [7:0] data_out_bot
	//BEGIN interface with memory i/o unit
	output [16:0] address,
	output [7:0] call_stack_ptr,
	output [15:0] stack_ptr,
	output [7:0] mem_write_data_top,
	output [7:0] mem_write_data_bot,
	input [7:0] mem_read_data_top,
	input [7:0] mem_read_data_bot
);

	//instantiate sfr input mux

	//instantiate SFR file

	//instantiate memeory io data input mux

	//instantiate memeory address input mux

	//instantiate MEM/WB data input mux
	mem_wb_data_input_mux mem_wb_input_mux(
			.clock(clock),
			.sel_signals(mem_wb_data_input_sel),
			.mem_data_top(data_in_top),
			.mem_data_bot(data_in_bot),
			.ld_res_top(mem_read_data_top),
			.ld_res_bot(mem_read_data_bot),
			.mem_data_out_top(data_out_top),
			.mem_data_out_bot(data_out_bot)
		);
	always @ (posedge clock)
	begin

	end

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("memory.vcd");
  $dumpvars (0, memory);
  #1;
end
`endif
endmodule
