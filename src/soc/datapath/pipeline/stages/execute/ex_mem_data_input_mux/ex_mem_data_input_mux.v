/*
Module - EX/MEM Data Input Multiplexor
Author - Zach Walden
Last Changed - 2/17/22
Description - This module multiplexes the register file data values in the ID/EX register and the alu results into the data inputs of the EX/MEM register
Parameters -
*/

module ex_mem_data_input_mux(
	//input clock,
	input [1:0] sel_signals, 		//4 bits the low bit selects between the alu result and ID/EX data top values,
	input [7:0] id_ex_top,
	input [7:0] id_ex_bot,
	input [7:0] alu_res_top,
	input [7:0] alu_res_bot,
	output [7:0] ex_data_out_top,
	output [7:0] ex_data_out_bot
);

	always @ (*)
	begin
		if(sel_signals[0] == 1'b1)
		begin
			ex_data_out_top <= alu_res_top;
		end
		else
		begin
			ex_data_out_top <= id_ex_top;
		end
	end

	always @ (*)
	begin
		if(sel_signals[1] == 1'b1)
		begin
			ex_data_out_bot <= alu_res_bot;
		end
		else
		begin
			ex_data_out_bot <= id_ex_bot;
		end
	end

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
