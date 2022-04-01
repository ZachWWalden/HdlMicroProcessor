/*
Module - EX/MEM Data Input Multiplexor
Author - Zach Walden
Last Changed - 2/17/22
Description - This module multiplexes the register file data values in the ID/EX register and the alu results into the data inputs of the EX/MEM register
Parameters -
*/

module alu_input_mux(
	//input clock,
	input [4:0] alu_input_sel_top,
	input [4:0] alu_input_sel_bot,
	input [7:0] id_ex_data_top,
	input [7:0] id_ex_data_bot,
	input [7:0] ex_mem_top,
	input [7:0] ex_mem_bot,
	input [7:0] mem_wb_top,
	input [7:0] mem_wb_bot,
	output reg [7:0] alu_data_input_top,
	output reg [7:0] alu_data_input_bot
);

	always @ (*)
	begin
		if(alu_input_sel_top == 5'b00001)
		begin
			alu_data_input_top <= id_ex_data_top;
		end
		else if(alu_input_sel_top == 5'b00010)
		begin
			alu_data_input_top <= ex_mem_top;
		end
		else if(alu_input_sel_top == 5'b00100)
		begin
			alu_data_input_top <= ex_mem_bot;
		end
		else if(alu_input_sel_top == 5'b01000)
		begin
			alu_data_input_top <= mem_wb_top;
		end
		else if(alu_input_sel_top == 5'b10000)
		begin
			alu_data_input_top <= mem_wb_bot;
		end
		else
		begin
			alu_data_input_top <= 8'h00;
		end
	end

	always @ (*)
	begin
		if(alu_data_input_top == 5'b00001)
		begin
			alu_data_input_bot <= id_ex_data_bot;
		end
		else if(alu_input_sel_bot == 5'b00010)
		begin
			alu_data_input_bot <= ex_mem_top;
		end
		else if(alu_input_sel_bot == 5'b00100)
		begin
			alu_data_input_bot <= ex_mem_bot;
		end
		else if(alu_input_sel_bot == 5'b01000)
		begin
			alu_data_input_bot <= mem_wb_top;
		end
		else if(alu_input_sel_bot == 5'b10000)
		begin
			alu_data_input_bot <= mem_wb_bot;
		end
		else
		begin
			alu_data_input_bot <= 8'h00;
		end
	end

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("alu_input_mux.vcd");
  $dumpvars (0, alu_input_mux);
  #1;
end
`endif
*/
endmodule
