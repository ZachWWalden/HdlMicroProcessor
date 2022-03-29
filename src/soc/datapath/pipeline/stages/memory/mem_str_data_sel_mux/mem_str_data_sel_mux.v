/* NEEDS WORK
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module mem_str_data_sel_mux(
	//input clock,
	input [4:0] sel_signal_top,
	input [4:0] sel_signal_bot,
	input [7:0] ex_mem_data_top,
	input [7:0] ex_mem_data_bot,
	input [7:0] mem_wb_data_top,
	input [7:0] mem_wb_data_bot,
	input [7:0] mem_wb_tm1_data_top,
	input [7:0] mem_wb_tm1_data_bot,
	output [11:0] mem_data
);

	//sel_signal_bot[0] -> mem_data[7:0] = ex_mem_data_bot, sel_signal_bot[1] -> mem_data[7:0] -> mem_wb_data_top, sel_signal_bot[2] -> mem_wb_data_bot, sel_signal_bot[3] -> mem_data[11:8] -> mem_wb_data_top[3:0], sel_signal_bot[4] -> mem_data[11:8] = mem_wb_data_bot[3:0]
	//sel_signal_top[0] -> mem_data[11:8] = ex_mem_data_top[3:0], sel_signal_top[1] -> mem_data[11:8] -> mem_wb_data_top[3:0], sel_signal_top[2] -> mem_data[11:8] = mem_wb_data_bot[3:0], sel_signal_top[3] -> mem_data[11:8] -> mem_wb_tm1_data_top[3:0], sel_signal_top[4] -> mem_data[11:8] = mem_wb__tm1data_bot[3:0]

	assign mem_data[0] = (sel_signal_bot[0] & ex_mem_data_bot[0]) | (sel_signal_bot[1] & mem_wb_data_top[0]) | (sel_signal_bot[2] & mem_wb_data_bot[0]) | (sel_signal_bot[3] & mem_wb_tm1_data_top[0]) | (sel_signal_bot[4] & mem_wb_tm1_data_bot[0]);
	assign mem_data[1] = (sel_signal_bot[0] & ex_mem_data_bot[1]) | (sel_signal_bot[1] & mem_wb_data_top[1]) | (sel_signal_bot[2] & mem_wb_data_bot[1]) | (sel_signal_bot[3] & mem_wb_tm1_data_top[1]) | (sel_signal_bot[4] & mem_wb_tm1_data_bot[1]);
	assign mem_data[2] = (sel_signal_bot[0] & ex_mem_data_bot[2]) | (sel_signal_bot[1] & mem_wb_data_top[2]) | (sel_signal_bot[2] & mem_wb_data_bot[2]) | (sel_signal_bot[3] & mem_wb_tm1_data_top[2]) | (sel_signal_bot[4] & mem_wb_tm1_data_bot[2]);
	assign mem_data[3] = (sel_signal_bot[0] & ex_mem_data_bot[3]) | (sel_signal_bot[1] & mem_wb_data_top[3]) | (sel_signal_bot[2] & mem_wb_data_bot[3]) | (sel_signal_bot[3] & mem_wb_tm1_data_top[3]) | (sel_signal_bot[4] & mem_wb_tm1_data_bot[3]);
	assign mem_data[4] = (sel_signal_bot[0] & ex_mem_data_bot[4]) | (sel_signal_bot[1] & mem_wb_data_top[4]) | (sel_signal_bot[2] & mem_wb_data_bot[4]) | (sel_signal_bot[3] & mem_wb_tm1_data_top[4]) | (sel_signal_bot[4] & mem_wb_tm1_data_bot[4]);
	assign mem_data[5] = (sel_signal_bot[0] & ex_mem_data_bot[5]) | (sel_signal_bot[1] & mem_wb_data_top[5]) | (sel_signal_bot[2] & mem_wb_data_bot[5]) | (sel_signal_bot[3] & mem_wb_tm1_data_top[5]) | (sel_signal_bot[4] & mem_wb_tm1_data_bot[5]);
	assign mem_data[6] = (sel_signal_bot[0] & ex_mem_data_bot[6]) | (sel_signal_bot[1] & mem_wb_data_top[6]) | (sel_signal_bot[2] & mem_wb_data_bot[6]) | (sel_signal_bot[3] & mem_wb_tm1_data_top[6]) | (sel_signal_bot[4] & mem_wb_tm1_data_bot[6]);
	assign mem_data[7] = (sel_signal_bot[0] & ex_mem_data_bot[7]) | (sel_signal_bot[1] & mem_wb_data_top[7]) | (sel_signal_bot[2] & mem_wb_data_bot[7]) | (sel_signal_bot[3] & mem_wb_tm1_data_top[7]) | (sel_signal_bot[4] & mem_wb_tm1_data_bot[7]);

	assign mem_data[8] = (sel_signal_top[0] & ex_mem_data_top[0]) | (sel_signal_top[1] & mem_wb_data_top[0]) | (sel_signal_top[2] & mem_wb_data_bot[0]) | (sel_signal_top[3] & mem_wb_tm1_data_top[0]) | (sel_signal_top[4] & mem_wb_tm1_data_bot[0]);
	assign mem_data[9] = (sel_signal_top[0] & ex_mem_data_top[1]) | (sel_signal_top[1] & mem_wb_data_top[1]) | (sel_signal_top[2] & mem_wb_data_bot[1]) | (sel_signal_top[3] & mem_wb_tm1_data_top[1]) | (sel_signal_top[4] & mem_wb_tm1_data_bot[1]);
	assign mem_data[10] = (sel_signal_top[0] & ex_mem_data_top[2]) | (sel_signal_top[1] & mem_wb_data_top[2]) | (sel_signal_top[2] & mem_wb_data_bot[2]) | (sel_signal_top[3] & mem_wb_tm1_data_top[2]) | (sel_signal_top[4] & mem_wb_tm1_data_bot[2]);
	assign mem_data[11] = (sel_signal_top[0] & ex_mem_data_top[3]) | (sel_signal_top[1] & mem_wb_data_top[3]) | (sel_signal_top[2] & mem_wb_data_bot[3]) | (sel_signal_top[3] & mem_wb_tm1_data_top[3]) | (sel_signal_top[4] & mem_wb_tm1_data_bot[3]);

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("mem_str_data_sel_mux.vcd");
  $dumpvars (0, mem_str_data_sel_mux);
  #1;
end
`endif
*/
endmodule
