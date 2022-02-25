/* //DONE
Module - Special Function Register File Input Selection Multiplexer
Author - Zach Walden
Last Changed - 2/23/22
Description - This multi
Parameters -
*/

module sfr_sel_mux(
	input clock,
	input [2:0] sel_signals,
	input [7:0] ex_mem_data_bot,
	input [7:0] mem_wb_data_top,
	input [7:0] mem_wb_data_bot,
	output [7:0] sfr_data_input
);

	//sel_signals[0] -> sfr_data_input ex_mem_data_bot, sel_signals[1] -> sfr_data_input = mem_wb_data_top, sel_signals[2] -> sfr_data_input = mem_wb_data_bot
	assign sfr_data_input[0] = (sel_signals[0] & ex_mem_data_bot[0]) | (sel_signals[1] & mem_wb_data_top[0]) | (sel_signals[2] & mem_wb_data_bot[0]);
	assign sfr_data_input[1] = (sel_signals[0] & ex_mem_data_bot[1]) | (sel_signals[1] & mem_wb_data_top[1]) | (sel_signals[2] & mem_wb_data_bot[1]);
	assign sfr_data_input[2] = (sel_signals[0] & ex_mem_data_bot[2]) | (sel_signals[1] & mem_wb_data_top[2]) | (sel_signals[2] & mem_wb_data_bot[2]);
	assign sfr_data_input[3] = (sel_signals[0] & ex_mem_data_bot[3]) | (sel_signals[1] & mem_wb_data_top[3]) | (sel_signals[2] & mem_wb_data_bot[3]);
	assign sfr_data_input[4] = (sel_signals[0] & ex_mem_data_bot[4]) | (sel_signals[1] & mem_wb_data_top[4]) | (sel_signals[2] & mem_wb_data_bot[4]);
	assign sfr_data_input[5] = (sel_signals[0] & ex_mem_data_bot[5]) | (sel_signals[1] & mem_wb_data_top[5]) | (sel_signals[2] & mem_wb_data_bot[5]);
	assign sfr_data_input[6] = (sel_signals[0] & ex_mem_data_bot[6]) | (sel_signals[1] & mem_wb_data_top[6]) | (sel_signals[2] & mem_wb_data_bot[6]);
	assign sfr_data_input[7] = (sel_signals[0] & ex_mem_data_bot[7]) | (sel_signals[1] & mem_wb_data_top[7]) | (sel_signals[2] & mem_wb_data_bot[7]);

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("sfr_sel_mux.vcd");
  $dumpvars (0, sfr_sel_mux);
  #1;
end
`endif
endmodule
