/*
Module - Execution/Memory Pipeline Register
Author - Zach Walden
Last Changed - 2/12/22, 3/27/22
Description - This register holds the necessary data to ensure that the correct results exit the memory pipeline stage.
*/

module mem_wb(
	input clock, 				//System Clock
	input nreset, 				//System Reset Signal
	input [7:0] data_top_in, 		//I/O for the top register file operand read.
	output reg [7:0] data_top_out,
	input [7:0] data_bot_in, 		//I/O for the bottom register file operand read.
	output reg [7:0] data_bot_out,
	output reg [7:0] data_tm1_top,
	output reg [7:0] data_tm1_bot,
	input [31:0] instruction_in, 		//I/O for the instruction word.
	output reg [31:0] instruction_out,
	input [1:0] reg_file_wen_in, 			//To the register file write port.
	output reg [1:0] reg_file_wen_out,
	input [13:0] ret_addr_in, 			//Comes from the memory i/o buffer
	output reg [13:0] ret_addr_out
);

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin

			data_top_out <= 0;
			data_bot_out <= 0;

			instruction_out <= 0;

			reg_file_wen_out <= 0;

			ret_addr_out <= 0;

			data_tm1_top <= 0;
			data_tm1_bot <= 0;
		end
		else
		begin
			data_top_out <= data_top_in;
			data_bot_out <= data_bot_in;

			instruction_out <= instruction_in;

			reg_file_wen_out <= reg_file_wen_in;

			ret_addr_out <= ret_addr_in;

			data_tm1_top <= data_top_out;
			data_tm1_bot <= data_bot_out;
		end
	end



/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("mem_wb.vcd");
  $dumpvars (0, mem_wb);
  #1;
end
`endif
*/
endmodule
