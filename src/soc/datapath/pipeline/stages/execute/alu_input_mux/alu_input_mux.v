/*
Module - EX/MEM Data Input Multiplexor
Author - Zach Walden
Last Changed - 2/17/22
Description - This module multiplexes the register file data values in the ID/EX register and the alu results into the data inputs of the EX/MEM register
Parameters -
*/

module alu_input_mux(
	input clock,
	input [4:0] alu_input_sel_top,
	input [4:0] alu_input_sel_bot,
	input [7:0] id_ex_data_top,
	input [7:0] id_ex_data_bot,
	input [7:0] ex_mem_top,
	input [7:0] ex_mem_bot,
	input [7:0] mem_wb_top,
	input [7:0] mem_wb_bot,
	output [7:0] alu_data_input_top,
	output [7:0] alu_data_input_bot
);

	assign alu_data_input_top[0] = (alu_input_sel_top[0] & id_ex_data_top[0]) | (alu_input_sel_top[1] & ex_mem_top[0]) | (alu_input_sel_top[2] & ex_mem_bot[0]) | (alu_input_sel_top[3] & mem_wb_top[0]) | (alu_input_sel_top[4] & mem_wb_bot[0]);
	assign alu_data_input_top[1] = (alu_input_sel_top[0] & id_ex_data_top[1]) | (alu_input_sel_top[1] & ex_mem_top[1]) | (alu_input_sel_top[2] & ex_mem_bot[1]) | (alu_input_sel_top[3] & mem_wb_top[1]) | (alu_input_sel_top[4] & mem_wb_bot[1]);
	assign alu_data_input_top[2] = (alu_input_sel_top[0] & id_ex_data_top[2]) | (alu_input_sel_top[1] & ex_mem_top[2]) | (alu_input_sel_top[2] & ex_mem_bot[2]) | (alu_input_sel_top[3] & mem_wb_top[2]) | (alu_input_sel_top[4] & mem_wb_bot[2]);
	assign alu_data_input_top[3] = (alu_input_sel_top[0] & id_ex_data_top[3]) | (alu_input_sel_top[1] & ex_mem_top[3]) | (alu_input_sel_top[2] & ex_mem_bot[3]) | (alu_input_sel_top[3] & mem_wb_top[3]) | (alu_input_sel_top[4] & mem_wb_bot[3]);
	assign alu_data_input_top[4] = (alu_input_sel_top[0] & id_ex_data_top[4]) | (alu_input_sel_top[1] & ex_mem_top[4]) | (alu_input_sel_top[2] & ex_mem_bot[4]) | (alu_input_sel_top[3] & mem_wb_top[4]) | (alu_input_sel_top[4] & mem_wb_bot[4]);
	assign alu_data_input_top[5] = (alu_input_sel_top[0] & id_ex_data_top[5]) | (alu_input_sel_top[1] & ex_mem_top[5]) | (alu_input_sel_top[2] & ex_mem_bot[5]) | (alu_input_sel_top[3] & mem_wb_top[5]) | (alu_input_sel_top[4] & mem_wb_bot[5]);
	assign alu_data_input_top[6] = (alu_input_sel_top[0] & id_ex_data_top[6]) | (alu_input_sel_top[1] & ex_mem_top[6]) | (alu_input_sel_top[2] & ex_mem_bot[6]) | (alu_input_sel_top[3] & mem_wb_top[6]) | (alu_input_sel_top[4] & mem_wb_bot[6]);
	assign alu_data_input_top[7] = (alu_input_sel_top[0] & id_ex_data_top[7]) | (alu_input_sel_top[1] & ex_mem_top[7]) | (alu_input_sel_top[2] & ex_mem_bot[7]) | (alu_input_sel_top[3] & mem_wb_top[7]) | (alu_input_sel_top[4] & mem_wb_bot[7]);

	assign alu_data_input_bot[0] = (alu_input_sel_bot[0] & id_ex_data_bot[0]) | (alu_input_sel_bot[1] & ex_mem_top[0]) | (alu_input_sel_bot[2] & ex_mem_bot[0]) | (alu_input_sel_bot[3] & mem_wb_top[0]) | (alu_input_sel_bot[4] & mem_wb_bot[0]);
	assign alu_data_input_bot[1] = (alu_input_sel_bot[0] & id_ex_data_bot[1]) | (alu_input_sel_bot[1] & ex_mem_top[1]) | (alu_input_sel_bot[2] & ex_mem_bot[1]) | (alu_input_sel_bot[3] & mem_wb_top[1]) | (alu_input_sel_bot[4] & mem_wb_bot[1]);
	assign alu_data_input_bot[2] = (alu_input_sel_bot[0] & id_ex_data_bot[2]) | (alu_input_sel_bot[1] & ex_mem_top[2]) | (alu_input_sel_bot[2] & ex_mem_bot[2]) | (alu_input_sel_bot[3] & mem_wb_top[2]) | (alu_input_sel_bot[4] & mem_wb_bot[2]);
	assign alu_data_input_bot[3] = (alu_input_sel_bot[0] & id_ex_data_bot[3]) | (alu_input_sel_bot[1] & ex_mem_top[3]) | (alu_input_sel_bot[2] & ex_mem_bot[3]) | (alu_input_sel_bot[3] & mem_wb_top[3]) | (alu_input_sel_bot[4] & mem_wb_bot[3]);
	assign alu_data_input_bot[4] = (alu_input_sel_bot[0] & id_ex_data_bot[4]) | (alu_input_sel_bot[1] & ex_mem_top[4]) | (alu_input_sel_bot[2] & ex_mem_bot[4]) | (alu_input_sel_bot[3] & mem_wb_top[4]) | (alu_input_sel_bot[4] & mem_wb_bot[4]);
	assign alu_data_input_bot[5] = (alu_input_sel_bot[0] & id_ex_data_bot[5]) | (alu_input_sel_bot[1] & ex_mem_top[5]) | (alu_input_sel_bot[2] & ex_mem_bot[5]) | (alu_input_sel_bot[3] & mem_wb_top[5]) | (alu_input_sel_bot[4] & mem_wb_bot[5]);
	assign alu_data_input_bot[6] = (alu_input_sel_bot[0] & id_ex_data_bot[6]) | (alu_input_sel_bot[1] & ex_mem_top[6]) | (alu_input_sel_bot[2] & ex_mem_bot[6]) | (alu_input_sel_bot[3] & mem_wb_top[6]) | (alu_input_sel_bot[4] & mem_wb_bot[6]);
	assign alu_data_input_bot[7] = (alu_input_sel_bot[0] & id_ex_data_bot[7]) | (alu_input_sel_bot[1] & ex_mem_top[7]) | (alu_input_sel_bot[2] & ex_mem_bot[7]) | (alu_input_sel_bot[3] & mem_wb_top[7]) | (alu_input_sel_bot[4] & mem_wb_bot[7]);

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("alu_input_mux.vcd");
  $dumpvars (0, alu_input_mux);
  #1;
end
`endif
endmodule
