/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module alu_forwarding_logic(
		input clock,
		input [31:0] instruction_word,
		input [7:0] mem_wb_operation,
		input [4:0] mem_wb_addr_low,
		input [4:0] mem_wb_addr_high,
		input [7:0] ex_mem_operation,
		input [4:0] ex_mem_addr_low,
		input [4:0] ex_mem_addr_high,
		input [7:0] id_ex_operation,
		input [4:0] id_ex_addr_low,
		input [4:0] id_ex_addr_high,
		output [4:0] alu_top_sel,
		output [5:0] alu_bot_sel,
		output stall_req
);

	wire [4:0] dec_addr_low = instruction_word[12:8]; 	//Destination Address
	wire [4:0] dec_addr_high = instruction_word[17:13]; 	//Source Address

	always @ (*)
	begin
		case(instruction_word[7:0])
			//Add Immeadiate, Increment, Decrement, Sub Immeadiate, Complement, Invert, Compare Immeadiate
			8'hBC :
			begin
			end
			//Add, Subtract, Compare
			8'h80 :
			begin
			end
			//Multiply
			8'h8E :
			begin
			end
			//Mulitply Immeadiate
			8'h9E :
			begin
			end
			//And, Or
			8'h97 :
			begin
			end
			//And Immeadiate, Or Immeadiate
			8'h9B :
			begin
			end
			//Shift Right, Shift Left
			8'hA5 :
			begin
			end
			//Default Case
			default
			begin
				//Illegal Opcode Exception. This is very useful for security. All other control signals are NOP'd
			end
		endcase
	end

	assign alu_bot_sel = 1;
	assign alu_top_sel = 1;
	assign stall_req = 0;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("alu_forwarding_logic.vcd");
  $dumpvars (0, alu_forwarding_logic);
  #1;
end
`endif
endmodule
