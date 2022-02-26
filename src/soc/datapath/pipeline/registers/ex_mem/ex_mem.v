/*
Module - Execution/Memory Pipeline Register
Author - Zach Walden
Last Changed - 2/12/22
Description - This register holds the necessary data to ensure that the correct results exit the memory pipeline stage.
*/

module ex_mem(
	input clock, 				//System Clock
	input nreset, 				//System Reset Signal
	input stall,  				//Stall signal from hazard unit.
	input [7:0] mem_wb_operation_in, 	//passthrough for the operation stored in the MEM/WB pipeline register.
	output [7:0] mem_wb_operation_out,
	input [4:0] mem_wb_addr_low_in,  	//passthrough for the low address stored in the MEM/WB pipeline register.
	output [4:0] mem_wb_addr_low_out,
	input [4:0] mem_wb_addr_high_in, 	//passthrough for the high address stored in the MEM/WB Pipeline register.
	output [4:0] mem_wb_addr_high_out,
	input [7:0] data_top_in, 		//I/O for the top register file operand read.
	output [7:0] data_top_out,
	input [7:0] data_bot_in, 		//I/O for the bottom register file operand read.
	output [7:0] data_bot_out,
	input [31:0] instruction_in, 		//I/O for the instruction word.
	output [31:0] instruction_out
	input [1:0] mem_wren_in,
	output [1:0] mem_wren_out,
	input main_memory_enable_in, 		//BEGIN These Signals Are to be sent to the memory i/o unit rather than the memory stage.
	output main_memory_enable_out,
	input frame_buffer_enable_in,
	output frame_buffer_enable_out,
	input call_stack_enable_in,
	output call_stack_enable_out,  		//END MEM/IO Signals
	input [1:0] mem_wb_data_input_sel_in,
	output [1:0] mem_wb_data_input_sel_out,
	input sfr_file_input_sel_in,
	output sfr_file_input_sel_out,
	input [3:0] mem_str_data_select_top_in,  	//this will only be used when writing to the frame buffer.
	output [3:0] mem_str_data_select_top_out,
	input [3:0] mem_str_data_select_bot_in, 	//Memory data in multiplexor selection signals, as well as the comemnt above.
	output [3:0] mem_str_data_select_bot_out,
	input [1:0] reg_file_wen_in,
	output [1:0] reg_file_wen_out,
	input [1:0] sfr_file_wren_in,
	output [1:0] sfr_file_wren_out,
	input [13:0] ret_addr_in, 		//This Signal goes directly to the call stack.
	output [13:0] ret_addr_out
);

	reg [1:0] mem_wb_data_input_sel = 0;
	reg sfr_file_input_sel = 0;

	reg [2:0] mem_data_select = 0;

	reg [7:0] data_top = 0;
	reg [7:0] data_bot = 0;

	reg [31:0] instruction = 0;

	reg [1:0] mem_wren = 0;

	reg main_memory_enable = 0;

	reg frame_buffer_enable = 0;

	reg call_stack_enable = 0;

	reg [1:0] reg_file_wen = 2'b00;

	reg [1:0] sfr_file_wren = 2'b00;

	reg [13:0] ret_addr = 0;

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin
			mem_wb_data_input_sel <= 0;
			sfr_file_input_sel <= 0;

			mem_data_select <= 0;

			data_top <= 0;
			data_bot <= 0;

			instruction <= 0;

			mem_wren <= 0;

			main_memory_enable <= 0;

			frame_buffer_enable <= 0;

			call_stack_enable <= 0;

			reg_file_wen <= 0;

			sfr_file_wren <= 0;

			ret_addr <= 0;
		end
		else if(stall == 1'b1)
		begin
			mem_wb_data_input_sel <= mem_wb_data_input_sel;
			sfr_file_input_sel <= sfr_file_input_sel;

			mem_data_select <= mem_data_select;

			data_top <= data_top;
			data_bot <= data_bot;

			instruction <= instruction;

			mem_wren <= mem_wren;

			main_memory_enable <= main_memory_enable;

			frame_buffer_enable <= frame_buffer_enable;

			call_stack_enable <= call_stack_enable;

			reg_file_wen <= reg_file_wen;

			sfr_file_wren <= sfr_file_wren;

			ret_addr <= ret_addr;
		end
		else
		begin
			mem_wb_data_input_sel <= mem_wb_data_input_sel_in;
			sfr_file_input_sel <= sfr_file_input_sel_in;

			mem_data_select <= mem_data_select_in;

			data_top <= data_top_in;
			data_bot <= data_bot_in;

			instruction <= instruction_in;

			mem_wren <= mem_wren_in;

			main_memory_enable <= main_memory_enable_in;

			frame_buffer_enable <= frame_buffer_enable_in;

			call_stack_enable <= call_stack_enable_in;

			reg_file_wen <= reg_file_wen_in;

			sfr_file_wren <= sfr_file_wren_in;

			ret_addr <= ret_addr_in;
		end
	end

	assign mem_wb_data_input_sel_out = stall ? 0 : mem_wb_data_input_sel;
	assign sfr_file_input_sel_out = stall ? 1'b0 : sfr_file_input_sel;

	assign mem_data_select_out = stall ? 0 : mem_data_select;

	assign data_top_out = stall ? 8'h00 : data_top;
	assign data_bot_out = stall ? 8'h00 : data_bot;

	assign instruction_out = stall ? 32'h00000000 : instruction;

	assign mem_wren_out = stall ? 2'b00 : mem_wren;

	assign main_memory_enable_out = stall ? 1'b0 : main_memory_enable;

	assign frame_buffer_enable_out = stall ? 1'b0 : frame_buffer_enable;

	assign call_stack_enable_out = stall ? 1'b0 : call_stack_enable;

	assign reg_file_wen_out = stall ? 2'b00 : reg_file_wen;

	assign sfr_file_wren_out = stall ? 2'b00 : sfr_file_wren;

	assign ret_addr_out = stall ? 14'b00000000000000 : ret_addr;

	assign mem_wb_operation_out = mem_wb_operation_in;
	assign mem_wb_addr_low_out = mem_wb_addr_low_in;
	assign mem_wb_addr_high_out = mem_wb_addr_high_in;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("ex_mem.vcd");
  $dumpvars (0, ex_mem);
  #1;
end
`endif
endmodule
