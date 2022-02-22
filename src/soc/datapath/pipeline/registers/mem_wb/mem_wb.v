/*
Module - Execution/Memory Pipeline Register
Author - Zach Walden
Last Changed - 2/12/22
Description - This register holds the necessary data to ensure that the correct results exit the memory pipeline stage.
*/

module mem_wb(
	input clock, 				//System Clock
	input nreset, 				//System Reset Signal
	input stall,  				//Stall signal from hazard unit.
	input [7:0] data_top_in, 		//I/O for the top register file operand read.
	output [7:0] data_top_out,
	input [7:0] data_bot_in, 		//I/O for the bottom register file operand read.
	output [7:0] data_bot_out,
	input [31:0] instruction_in, 		//I/O for the instruction word.
	output [31:0] instruction_out
	input [1:0] reg_file_wen_in,
	output [1:0] reg_file_wen_out,
	input [13:0] ret_addr_in,
	output [13:0] ret_addr_out,
);

	reg [7:0] data_top = 0;
	reg [7:0] data_bot = 0;

	reg [31:0] instruction = 0;

	reg [1:0] reg_file_wen = 2'b00;

	reg [13:0] ret_addr = 0;

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin
			data_top <= 0;
			data_bot <= 0;

			instruction <= 0;

			reg_file_wen <= 0;

			ret_addr <= 0;
		end
		else if(stall == 1'b1)
		begin
			data_top <= data_top;
			data_bot <= data_bot;

			instruction <= instruction;

			reg_file_wen <= reg_file_wen;

			ret_addr <= ret_addr;
		end
		else
		begin
			data_top <= data_top_in;
			data_bot <= data_bot_in;

			instruction <= instruction_in;

			reg_file_wen <= reg_file_wen_in;

			ret_addr <= ret_addr_in;
		end
	end

	assign data_top_out = stall ? 8'h00 : data_top;
	assign data_bot_out = stall ? 8'h00 : data_bot;

	assign instruction_out = stall ? 32'h00000000 : instruction;

	assign reg_file_wen_out = stall ? 2'b00 : reg_file_wen;

	assign ret_addr_out = stall ? 14'b00000000000000 : ret_addr;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("mem_wb.vcd");
  $dumpvars (0, mem_wb);
  #1;
end
`endif
endmodule
