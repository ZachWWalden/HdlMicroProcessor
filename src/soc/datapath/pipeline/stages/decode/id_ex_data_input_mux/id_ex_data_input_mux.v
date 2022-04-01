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
		output reg [7:0] id_ex_data_input_bot
);

	always @ (*)
	begin
		if(sel_signal == 1'b1)
		begin
			id_ex_data_input_bot <= immeadiate_data;
		end
		else
		begin
			id_ex_data_input_bot <= reg_file_top;
		end
	end

	assign id_ex_data_input_top = reg_file_bot;

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("id_ex_data_input_mux.vcd");
  $dumpvars (0, id_ex_data_input_mux);
  #1;
end
`endif
*/
endmodule
