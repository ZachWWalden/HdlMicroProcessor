/* DONE
Module - MEM/WB Data Input Multiplexor
Author - Zach Walden
Last Changed - 2/18/22
Description - This module multiplexes the data values in the EX/MEM register and the LD results into the data inputs of the MEM/WB register
Parameters -
*/

module mem_wb_data_input_mux(
	input clock,
	input [3:0] sel_signals,
	input [7:0] sfr_data, 			//SFR data out will always go to MEM/WB data top is it is selected.
	input [7:0] ex_mem_data_top,
	input [7:0] ex_mem_data_bot,
	input [7:0] ld_res_top,
	input [7:0] ld_res_bot,
	output [7:0] mem_data_out_top,
	output [7:0] mem_data_out_bot
);

	assign mem_data_out_bot[0] = (~sel_signals[0] & ex_mem_data_bot[0]) | (sel_signals[0] & ld_res_bot[0]);
	assign mem_data_out_bot[1] = (~sel_signals[0] & ex_mem_data_bot[1]) | (sel_signals[0] & ld_res_bot[1]);
	assign mem_data_out_bot[2] = (~sel_signals[0] & ex_mem_data_bot[2]) | (sel_signals[0] & ld_res_bot[2]);
	assign mem_data_out_bot[3] = (~sel_signals[0] & ex_mem_data_bot[3]) | (sel_signals[0] & ld_res_bot[3]);
	assign mem_data_out_bot[4] = (~sel_signals[0] & ex_mem_data_bot[4]) | (sel_signals[0] & ld_res_bot[4]);
	assign mem_data_out_bot[5] = (~sel_signals[0] & ex_mem_data_bot[5]) | (sel_signals[0] & ld_res_bot[5]);
	assign mem_data_out_bot[6] = (~sel_signals[0] & ex_mem_data_bot[6]) | (sel_signals[0] & ld_res_bot[6]);
	assign mem_data_out_bot[7] = (~sel_signals[0] & ex_mem_data_bot[7]) | (sel_signals[0] & ld_res_bot[7]);

	assign mem_data_out_top[0] = (sel_signals[1] & sfr_data[0]) | (sel_signals[2] & ex_mem_data_top[0]) | (sel_signals[3] & ld_res_top[0]);
	assign mem_data_out_top[1] = (sel_signals[1] & sfr_data[1]) | (sel_signals[2] & ex_mem_data_top[1]) | (sel_signals[3] & ld_res_top[1]);
	assign mem_data_out_top[2] = (sel_signals[1] & sfr_data[2]) | (sel_signals[2] & ex_mem_data_top[2]) | (sel_signals[3] & ld_res_top[2]);
	assign mem_data_out_top[3] = (sel_signals[1] & sfr_data[3]) | (sel_signals[2] & ex_mem_data_top[3]) | (sel_signals[3] & ld_res_top[3]);
	assign mem_data_out_top[4] = (sel_signals[1] & sfr_data[4]) | (sel_signals[2] & ex_mem_data_top[4]) | (sel_signals[3] & ld_res_top[4]);
	assign mem_data_out_top[5] = (sel_signals[1] & sfr_data[5]) | (sel_signals[2] & ex_mem_data_top[5]) | (sel_signals[3] & ld_res_top[5]);
	assign mem_data_out_top[6] = (sel_signals[1] & sfr_data[6]) | (sel_signals[2] & ex_mem_data_top[6]) | (sel_signals[3] & ld_res_top[6]);
	assign mem_data_out_top[7] = (sel_signals[1] & sfr_data[7]) | (sel_signals[2] & ex_mem_data_top[7]) | (sel_signals[3] & ld_res_top[7]);

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("ex_mem_data_input_mux.vcd");
  $dumpvars (0, ex_mem_data_input_mux);
  #1;
end
`endif
*/
endmodule
