/*
Module - ID/EX Data Input Multiplexer
Author - Zach Walden
Last Changed - 2/26/22
Description - This multiplexer switches the bottom data output of the decode stage between the top data of the register file, and the immeadiate data stored in the instruction word.
Parameters -
*/

module id_ex_data_input_mux(
		input sel_signal,
		input [7:0] immeadiate_data,
		input [7:0] reg_file_top,
		input [7:0] reg_file_bot,
		output [7:0] id_ex_data_input_top,
		output [7:0] id_ex_data_input_bot
);

	assign id_ex_data_input_bot[0] = (~sel_signal & reg_file_top[0]) | (sel_signal & immeadiate_data[0]);
	assign id_ex_data_input_bot[1] = (~sel_signal & reg_file_top[1]) | (sel_signal & immeadiate_data[1]);
	assign id_ex_data_input_bot[2] = (~sel_signal & reg_file_top[2]) | (sel_signal & immeadiate_data[2]);
	assign id_ex_data_input_bot[3] = (~sel_signal & reg_file_top[3]) | (sel_signal & immeadiate_data[3]);
	assign id_ex_data_input_bot[4] = (~sel_signal & reg_file_top[4]) | (sel_signal & immeadiate_data[4]);
	assign id_ex_data_input_bot[5] = (~sel_signal & reg_file_top[5]) | (sel_signal & immeadiate_data[5]);
	assign id_ex_data_input_bot[6] = (~sel_signal & reg_file_top[6]) | (sel_signal & immeadiate_data[6]);
	assign id_ex_data_input_bot[7] = (~sel_signal & reg_file_top[7]) | (sel_signal & immeadiate_data[7]);

	assign id_ex_data_input_top = reg_file_bot;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("id_ex_data_input_mux.vcd");
  $dumpvars (0, id_ex_data_input_mux);
  #1;
end
`endif
endmodule
