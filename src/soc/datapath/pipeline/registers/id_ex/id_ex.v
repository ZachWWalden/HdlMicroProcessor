/*
Module - Instruction Decode/Execution Pipeline Register
Author - Zach Walden
Last Changed - 2/12/22
Description - This register holds the necessary data to ensure that the correct results exit the ALU
*/

module id_ex(
	input clock, 				//System Clock
	input nreset, 				//System Reset Signal
	input stall,  				//Stall signal from hazard unit.
	input [7:0] ex_mem_operation_in, 	//Passtrough for the opcode in the EX/MEM pipeline register
	output [7:0] ex_mem_operation_out,
	input [4:0] ex_mem_addr_low_in, 	//passthrough for the low address stored in the EX/MEM pipeline register
	output [4:0] ex_mem_addr_low_out,
	input [4:0] ex_mem_addr_high_in, 	//passthrough for the high address stored in the EX/MEM pipeline register
	output [4:0] ex_mem_addr_high_out,
	input [7:0] mem_wb_operation_in, 	//passthrough for the operation stored in the MEM/WB pipeline register.
	output [7:0] mem_wb_operation_out,
	input [4:0] mem_wb_addr_low_in,  	//passthrough for the low address stored in the MEM/WB pipeline register.
	output [4:0] mem_wb_addr_low_out,
	input [4:0] mem_wb_addr_high_in, 	//passthrough for the high address stored in the MEM/WB Pipeline register.
	output [4:0] mem_wb_addr_high_out,
	input [5:0] alu_top_select_in,  	//I/O for the alu top input multiplexor selection signals.
	output [5:0] alu_top_select_out,
	input [6:0] alu_bot_select_in, 		//I/O for the alu bottom input multiplexor selection signals.
	output [6:0] alu_bot_select_out,
	input [7:0] reg_file_top_in, 		//I/O for the top register file operand read.
	output [7:0] reg_file_top_out,
	input [7:0] reg_file_bot_in, 		//I/O for the bottom register file operand read.
	output [7:0] reg_file_bot_out,
	input [31:0] instruction_in, 		//I/O for the instruction word.
	output [31:0] instruction_out
	input alu_enable_in, 			//I/O for functionaly unit control signals.
	output alu_enable_out,
	input [1:0] mem_wren_in,
	output [1:0] mem_wren_out,
	input main_memory_enable_in,
	output main_memory_enable_out,
	input frame_buffer_enable_in,
	output frame_buffer_enable_out,
	input call_stack_enable_in,
	output call_stack_enable_out,
	input [1:0] ex_mem_data_input_sel_in,
	output [1:0] ex_mem_data_input_sel_out,
	input [1:0] mem_wb_data_input_sel_in,
	output [1:0] mem_wb_data_input_sel_out,
	input [1:0] reg_file_wen_in,
	output [1:0] reg_file_wen_out,
	input [1:0] sfr_file_wren_in,
	output [1:0] sfr_file_wren_out,
	input [13:0] ret_addr_in,
	output [13:0] ret_addr_out
);

	reg [1:0] ex_mem_data_input_sel = 0;
	reg [1:0] mem_wb_data_input_sel = 0;
	reg sfr_file_input_sel = 0;

	reg [5:0] alu_top_select = 0;
	reg [6:0] alu_bot_select = 0;

	reg [7:0] register_file_top = 0;
	reg [7:0] register_file_bot = 0;

	reg [31:0] instruction = 0;

	reg alu_enable = 0;

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
			ex_mem_data_input_sel <= 0;
			mem_wb_data_input_sel <= 0;
			sfr_file_input_sel <= 0;

			alu_top_select <= 0;
			alu_bot_select <= 0;

			register_file_top <= 0;
			register_file_bot <= 0;

			instruction <= 0;

			alu_enable <= 0;

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
			ex_mem_data_input_sel <= ex_mem_data_input_sel;
			mem_wb_data_input_sel <= mem_wb_data_input_sel;
			sfr_file_input_sel <= sfr_file_input_sel;

			alu_top_select <= alu_top_select;
			alu_bot_select <= alu_bot_select;

			register_file_top <= reg_file_top;
			register_file_bot <= reg_file_bot;

			instruction <= instruction;

			alu_enable <= alu_enable;

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
			ex_mem_data_input_sel <= ex_mem_data_input_sel_in;
			mem_wb_data_input_sel <= mem_wb_data_input_sel_in;
			sfr_file_input_sel <= sfr_file_input_sel_in;

			alu_top_select <= alu_top_select_in;
			alu_bot_select <= alu_bot_select_in;

			register_file_top <= reg_file_top_in;
			register_file_bot <= reg_file_bot_in;

			instruction <= instruction_in;

			alu_enable <= alu_enable_in;

			mem_wren <= mem_wren_in;

			main_memory_enable <= main_memory_enable_in;

			frame_buffer_enable <= frame_buffer_enable_in;

			call_stack_enable <= call_stack_enable_in;

			reg_file_wen <= reg_file_wen_in;

			sfr_file_wren <= sfr_file_wren_in;

			ret_addr <= ret_addr_in;
		end
	end

	assign ex_mem_data_input_sel_out = stall ? 2'b00 : ex_mem_data_input_sel;
	assign mem_wb_data_input_sel_out = stall ? 2'b00 : mem_wb_data_input_sel;
	assign sfr_file_input_sel_out = stall ? 1'b0 : sfr_file_input_sel;

	assign alu_top_select_out = stall ? 6'b000000 : alu_bot_select;
	assign alu_bot_select_out = stall ? 7'b0000000 : alu_bot_select;

	assign register_file_top_out = stall ? 8'h00 : reg_file_top;
	assign reg_file_bot_out = stall ? 8'h00 : reg_file_bot;

	assign instruction_out = stall ? 32'h00000000 : instruction;

	assign alu_enable_out = stall ? 1'b0 : alu_enable;

	assign mem_wren_out = stall ? 2'b00 : mem_wren;

	assign main_memory_enable_out = stall ? 1'b0 : main_memory_enable;

	assign frame_buffer_enable_out = stall ? 1'b0 : frame_buffer_enable;

	assign call_stack_enable_out = stall ? 1'b0 : call_stack_enable;

	assign reg_file_wen_out = stall ? 2'b00 : reg_file_wen;

	assign sfr_file_wren_out = stall ? 2'b00 : sfr_file_wren;

	assign ret_addr_out = stall ? 14'b00000000000000 : ret_addr;

	assign ex_mem_operation_out = ex_mem_operation_in;
	assign ex_mem_addr_low_out = ex_mem_addr_low_in;
	assign ex_mem_addr_high_out = ex_mem_addr_high_in;

	assign mem_wb_operation_out = mem_wb_operation_in;
	assign mem_wb_addr_low_out = mem_wb_addr_low_in;
	assign mem_wb_addr_high_out = mem_wb_addr_high_in;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("id_ex.vcd");
  $dumpvars (0, id_ex);
  #1;
end
`endif
endmodule
