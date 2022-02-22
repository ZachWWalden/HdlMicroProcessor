/*
Module - EX/MEM Data Input Multiplexor
Author - Zach Walden
Last Changed - 2/17/22
Description - This module multiplexes the register file data values in the ID/EX register and the alu results into the data inputs of the EX/MEM register
Parameters -
*/

module ex_mem_data_input_mux(
	input clock,
	input [1:0] sel_signals,
	input [7:0] reg_file_top,
	input [7:0] reg_file_bot,
	input [7:0] alu_res_top,
	input [7:0] alu_res_bot,
	output [7:0] ex_data_out_top,
	output [7:0] ex_data_out_bot
);

	assign ex_data_out_top[0] = (~sel_signals[0] & reg_file_top[0]) | (sel_signals[0] & alu_res_top[0]);
	assign ex_data_out_top[1] = (~sel_signals[0] & reg_file_top[1]) | (sel_signals[0] & alu_res_top[1]);
	assign ex_data_out_top[2] = (~sel_signals[0] & reg_file_top[2]) | (sel_signals[0] & alu_res_top[2]);
	assign ex_data_out_top[3] = (~sel_signals[0] & reg_file_top[3]) | (sel_signals[0] & alu_res_top[3]);
	assign ex_data_out_top[4] = (~sel_signals[0] & reg_file_top[4]) | (sel_signals[0] & alu_res_top[4]);
	assign ex_data_out_top[5] = (~sel_signals[0] & reg_file_top[5]) | (sel_signals[0] & alu_res_top[5]);
	assign ex_data_out_top[6] = (~sel_signals[0] & reg_file_top[6]) | (sel_signals[0] & alu_res_top[6]);
	assign ex_data_out_top[7] = (~sel_signals[0] & reg_file_top[7]) | (sel_signals[0] & alu_res_top[7]);

	assign ex_data_out_bot[0] = (~sel_signals[1] & reg_file_bot[0]) | (sel_signals[1] & alu_res_bot[0]);
	assign ex_data_out_bot[1] = (~sel_signals[1] & reg_file_bot[1]) | (sel_signals[1] & alu_res_bot[1]);
	assign ex_data_out_bot[2] = (~sel_signals[1] & reg_file_bot[2]) | (sel_signals[1] & alu_res_bot[2]);
	assign ex_data_out_bot[3] = (~sel_signals[1] & reg_file_bot[3]) | (sel_signals[1] & alu_res_bot[3]);
	assign ex_data_out_bot[4] = (~sel_signals[1] & reg_file_bot[4]) | (sel_signals[1] & alu_res_bot[4]);
	assign ex_data_out_bot[5] = (~sel_signals[1] & reg_file_bot[5]) | (sel_signals[1] & alu_res_bot[5]);
	assign ex_data_out_bot[6] = (~sel_signals[1] & reg_file_bot[6]) | (sel_signals[1] & alu_res_bot[6]);
	assign ex_data_out_bot[7] = (~sel_signals[1] & reg_file_bot[7]) | (sel_signals[1] & alu_res_bot[7]);

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("ex_mem_data_input_mux.vcd");
  $dumpvars (0, ex_mem_data_input_mux);
  #1;
end
`endif
endmodule
