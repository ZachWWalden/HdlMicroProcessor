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
	output reg [11:0] mem_data
);

	always @ (*)
	begin
		if(sel_signal_top == 5'b00001)
		begin
			mem_data[11:8] <= ex_mem_data_top[3:0];
		end
		else if(sel_signal_top == 5'b00010)
		begin
			mem_data[11:8] <= mem_wb_data_top[3:0];
		end
		else if(sel_signal_top == 5'b00100)
		begin
			mem_data[11:8] <= mem_wb_data_bot[3:0];
		end
		else if(sel_signal_top == 5'b01000)
		begin
			mem_data[11:8] <= mem_wb_tm1_data_top[3:0];
		end
		else if(sel_signal_top == 5'b10000)
		begin
			mem_data[11:8] <= mem_wb_tm1_data_bot[3:0];
		end
		else
		begin
			mem_data[11:8] <= 0;
		end
	end

	always @ (*)
	begin
		if(sel_signal_bot == 5'b00001)
		begin
			mem_data[7:0] <= ex_mem_data_bot;
		end
		else if(sel_signal_bot == 5'b00010)
		begin
			mem_data[7:0] <= mem_wb_data_top;
		end
		else if(sel_signal_bot == 5'b00100)
		begin
			mem_data[7:0] <= mem_wb_data_bot;
		end
		else if(sel_signal_bot == 5'b01000)
		begin
			mem_data[7:0] <= mem_wb_tm1_data_top;
		end
		else if(sel_signal_bot == 5'b10000)
		begin
			mem_data[7:0] <= mem_wb_tm1_data_bot;
		end
		else
		begin
			mem_data[7:0] <= 0;
		end
	end

	//sel_signal_bot[0] -> mem_data[7:0] = ex_mem_data_bot, sel_signal_bot[1] -> mem_data[7:0] -> mem_wb_data_top, sel_signal_bot[2] -> mem_wb_data_bot, sel_signal_bot[3] -> mem_data[11:8] -> mem_wb_data_top[3:0], sel_signal_bot[4] -> mem_data[11:8] = mem_wb_data_bot[3:0]
	//sel_signal_top[0] -> mem_data[11:8] = ex_mem_data_top[3:0], sel_signal_top[1] -> mem_data[11:8] -> mem_wb_data_top[3:0], sel_signal_top[2] -> mem_data[11:8] = mem_wb_data_bot[3:0], sel_signal_top[3] -> mem_data[11:8] -> mem_wb_tm1_data_top[3:0], sel_signal_top[4] -> mem_data[11:8] = mem_wb__tm1data_bot[3:0]

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
