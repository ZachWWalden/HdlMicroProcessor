/* DONE
Module - MEM/WB Data Input Multiplexor
Author - Zach Walden
Last Changed - 2/18/22, 3/16/22, 3/24/22
Description - This module multiplexes the data values in the EX/MEM register and the LD results into the data inputs of the MEM/WB register
Parameters -
*/

module mem_wb_data_input_mux(
	//input clock,
	input [3:0] sel_signals_top,
	input [6:0] sel_signals_bot,
	input [7:0] sfr_data, 			//SFR data out will always go to MEM/WB data top is it is selected.
	input [7:0] ex_mem_data_top,
	input [7:0] ex_mem_data_bot,
	input [3:0] ld_res_top,
	input [7:0] ld_res_bot,
	input [7:0] mem_wb_top,
	input [7:0] mem_wb_bot,
	input [7:0] mem_wb_tm1_top,
	input [7:0] mem_wb_tm1_bot,
	output reg [7:0] mem_data_out_top,
	output reg [7:0] mem_data_out_bot
);

	always @ (*)
	begin
		if(sel_signals_top == 4'b0001)
		begin
			mem_data_out_top <= ex_mem_data_top;
		end
		else if(sel_signals_top == 4'b0010)
		begin
			mem_data_out_top[3:0] <= ld_res_top;
			mem_data_out_top[7:4] <= 4'h0;
		end
		else if(sel_signals_top == 4'b0100)
		begin
			mem_data_out_top <= mem_wb_tm1_top;
		end
		else if(sel_signals_top == 4'b1000)
		begin
			mem_data_out_top <= mem_wb_tm1_bot;
		end
		else
		begin
			mem_data_out_top <= 8'h00;
		end
	end

	always @ (*)
	begin
		if(sel_signals_bot == 7'b0000001)
		begin
			mem_data_out_bot <= sfr_data;
		end
		else if(sel_signals_bot == 7'b0000010)
		begin
			mem_data_out_bot <= ex_mem_data_bot;
		end
		else if(sel_signals_bot == 7'b0000100)
		begin
			mem_data_out_bot <= ld_res_bot;
		end
		else if(sel_signals_bot == 7'b0001000)
		begin
			mem_data_out_bot <= mem_wb_top;
		end
		else if(sel_signals_bot == 7'b0010000)
		begin
			mem_data_out_bot <= mem_wb_bot;
		end
		else if(sel_signals_bot == 7'b0100000)
		begin
			mem_data_out_bot <= mem_wb_tm1_top;
		end
		else if(sel_signals_bot == 7'b1000000)
		begin
			mem_data_out_bot <= mem_wb_tm1_bot;
		end
		else
		begin
			mem_data_out_bot <= 8'h00;
		end
	end

	// <0> data_bot = sfr_data, <1> data_bot = ex/mem bottom , <2> data_bot = ld_res_bot , <3> data_bot = mem_wb_top , <4> data_bot = mem_wb_bot, <5> data_bot = mem_wb_tm1_top, <6> data_bot = mem_wb_tm1_bot

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
