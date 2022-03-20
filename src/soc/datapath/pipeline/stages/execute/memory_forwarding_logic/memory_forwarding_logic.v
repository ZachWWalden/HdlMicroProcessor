/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module memory_forwarding_logic(
	input clock,
	input [31:0] instruction,
	input [7:0] ex_mem_instruction,
	input [7:0] mem_wb_instruction,
	output sfr_input_sel,
	output [3:0] mem_write_data_sel_top,
	output [3:0] mem_write_data_sel_bot
);

	always @ (*)
	begin
		case(instruction[7:0])
			//Load, Load Framebuffer, Pop
			8'hFB :
			begin
			end
			//Store, Store Framebuffer, Push
			8'hC4 :
			begin

			end
			//Move Register, In, Out
			8'h9C :
			begin

			end
			//Load From Program Memory
			8'hF9 :
			begin
			end
			//Default Case
			default
			begin
				//Illegal Opcode Exception. This is very useful for security. All other control signals are NOP'd
			end
		endcase
	end

	assign sfr_input_sel = 1'b0;
	assign mem_write_data_sel_top = 4'b0001;
	assign mem_write_data_sel_bot = 4'b0001;


/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("memory_forwarding_logic.vcd");
  $dumpvars (0,memory_forwarding_logic);
  #1;
end
`endif
*/
endmodule
