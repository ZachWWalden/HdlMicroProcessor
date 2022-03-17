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
		input [31:0] ex_mem_instruction,
		input [31:0] id_ex_instruction,
		output [4:0] alu_top_sel,
		output [4:0] alu_bot_sel,
		output stall_decode
);

	wire [4:0] dec_addr_low = instruction_word[12:8]; 	//Destination Address
	wire [4:0] dec_addr_high = instruction_word[17:13]; 	//Source Address

	always @ (*)
	begin
		case(instruction_word[7:0])
			//Add Immeadiate, Increment, Decrement, Sub Immeadiate, Complement, Invert, Compare Immeadiate
			8'hBC :
			begin
				//Check for a potential dependent Load
				//LD, LDFB
				if(ex_mem_instruction[7:0] == 8'h42)
				begin
					//Check if a LDFB or not.
					if(ex_mem_instruction[20] == 1'b1)
					begin
						//Normal Load
						if(instruction[12:8] == ex_mem_instruction[12:8])
						begin
							//forawrd the load result bot to the alu top
						end
						else
						begin
							//No forward necessary
						end
					end
					else
					begin
						//Load Frame Buffer
						if(instruction[12:8] == ex_mem_instruction[12:8])
						begin
							//Forward load result bottom to the alu top
						end
						else if(instruction[12:8] == ex_mem_instruction[17:13])
						begin
							//forward load result top to the alu top
						end
						else
						begin
							//No forward necessary
						end
					end
				end
				//Load Immeadiate, This could never cause a stall
				else if(ex_mem_instruction[7:0] == 8'hF8)
				begin
					if(instruction[12:8] == ex_mem_instruction[12:8])
					begin
						//Forward ex/mem data bottom on to alu top
					end
					else
					begin
						//No forward necessary
					end
				end
				//Load Program Memory
				else if(ex_mem_instruction[7:0] == 8'hF9)
				begin
					if(instruction[12:8] == ex_mem_instruction[12:8])
					begin
						//forward load result top to the alu top
					end
					else
					begin
						//No forward necessary
					end
				end
				//Out
				else if(ex_mem_instruction[7:0] == 8'h9C && ex_mem_instruction[18] == 1'b1)
				begin
					if(instruction[12:8] == ex_mem_instruction[12:8])
					begin
						//forward load result top to the alu top
					end
					else
					begin
						//No forward necessary
					end
				end
				//Check for dependent load that requires a stall.
				//LD, LDFB
				if(ex_mem_instruction[7:0] == 8'h42)
				begin
					//Check if a LDFB or not.
					if(ex_mem_instruction[20] == 1'b1)
					begin
						//Normal Load
						if(instruction[12:8] == ex_mem_instruction[12:8])
						begin
							//forawrd the load result bot to the alu top, and STALL
						end
						else
						begin
							//No forward necessary
						end
					end
					else
					begin
						//Load Frame Buffer
						if(instruction[12:8] == ex_mem_instruction[12:8])
						begin
							//Forward load result bottom to the alu top, STALL
						end
						else if(instruction[12:8] == ex_mem_instruction[17:13])
						begin
							//forward load result top to the alu top, STALL
						end
						else
						begin
							//No forward necessary
						end
					end
				end
				//Load Program Memory
				else if(ex_mem_instruction[7:0] == 8'hF9)
				begin
					if(instruction[12:8] == ex_mem_instruction[12:8])
					begin
						//forward load result top to the alu top, ,STALL
					end
					else
					begin
						//No forward necessary
					end
				end
				//Out
				else if(ex_mem_instruction[7:0] == 8'h9C && ex_mem_instruction[18] == 1'b1)
				begin
					if(instruction[12:8] == ex_mem_instruction[12:8])
					begin
						//forward load result top to the alu top, STALL
					end
					else
					begin
						//No forward necessary
					end
				end
				//Check For a potential dependent arithmetic instruction.
				//ADDI, SUBI, CPI, COM, INV
				else if(id_ex_instruction[7:0] == 8'hBC && id_ex_instruction[21] == 1'b1)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
					end
					else
					begin
						//No forwarding necessary
					end
				end
				//ADD, SUB, CP
				else if(id_ex_instruction[7:0] == 8'h80 && id_ex_instruction[21] == 1'b1)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
					end
					else
					begin
						//No forwarding necessary
					end
				end
				//MUL
				//MULI
				//AND, OR
				else if(id_ex_instruction[7:0] == 8'h80)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
					end
					else
					begin
						//No forwarding necessary
					end
				end
				//ANDI, ORI
				else if(id_ex_instruction[7:0] == 8'h80)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
					end
					else
					begin
						//No forwarding necessary
					end
				end
				//SHR, SHL
				else if(id_ex_instruction[7:0] == 8'h80)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
					end
					else
					begin
						//No forwarding necessary
					end
				end
				//No Hazards
				else
				begin

				end

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
