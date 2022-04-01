/* //DONE
Module - Special Function Register File Input Selection Multiplexer
Author - Zach Walden
Last Changed - 2/23/22
Description - This multi
Parameters -
*/

module sfr_sel_mux(
	//input clock,
	input [4:0] sel_signals,
	input [7:0] ex_mem_data_bot,
	input [7:0] mem_wb_data_top,
	input [7:0] mem_wb_data_bot,
	input [7:0] mem_wb_tm1_data_top,
	input [7:0] mem_wb_tm1_data_bot,
	output reg [7:0] sfr_data_input
);

	always @ (*)
	begin
		if(sel_signals == 5'b00001)
		begin
			sfr_data_input <= ex_mem_data_bot;
		end
		else if(sel_signals == 5'b00010)
		begin
			sfr_data_input <= mem_wb_data_top;
		end
		else if(sel_signals == 5'b00100)
		begin
			sfr_data_input <= mem_wb_data_bot;
		end
		else if(sel_signals == 5'b01000)
		begin
			sfr_data_input <= mem_wb_tm1_data_top;
		end
		else if(sel_signals == 5'b10000)
		begin
			sfr_data_input <= mem_wb_tm1_data_bot;
		end
		else
		begin
			sfr_data_input <= 8'h00;
		end
	end

	//sel_signals[0] -> sfr_data_input ex_mem_data_bot, sel_signals[1] -> sfr_data_input = mem_wb_data_top, sel_signals[2] -> sfr_data_input = mem_wb_data_bot

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("sfr_sel_mux.vcd");
  $dumpvars (0, sfr_sel_mux);
  #1;
end
`endif
*/
endmodule
