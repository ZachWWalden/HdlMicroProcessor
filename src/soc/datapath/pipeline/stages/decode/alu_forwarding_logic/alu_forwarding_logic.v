/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module alu_forwarding_logic(
		//input clock,
		input [31:0] instruction,
		input [31:0] ex_mem_instruction,
		input [31:0] id_ex_instruction,
		output reg [4:0] alu_top_sel,
		output reg [4:0] alu_bot_sel,
		output reg stall_decode
);

	always @ (*)
	begin
		case(instruction[7:0])
			//Add Immeadiate, Increment, Decrement, Sub Immeadiate, Complement, Invert, Compare Immeadiate, Or Immeadiate, And Immeadiate, Mulitply Immeadiate, Shift Right, Shift Left   CASES DONE
			8'hBC, 8'h9E, 8'h9B, 8'hA5 :
			begin
				//Check for dependent load that requires a stall.
				//LD, LDFB
				if(id_ex_instruction[7:0] == 8'hFB)
				begin
					//Check if a LDFB or not.
					if(id_ex_instruction[20] == 1'b1)
					begin
						//Normal Load
						if(instruction[12:8] == id_ex_instruction[12:8])
						begin
							//forawrd the load result bot to the alu top, and STALL
							alu_top_sel <= 5'b10000;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b1;
						end
						else
						begin
							//No forward necessary
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
					end
					else
					begin
						//Load Frame Buffer
						if(instruction[12:8] == id_ex_instruction[12:8])
						begin
							//Forward load result bottom to the alu top, STALL
							alu_top_sel <= 5'b10000;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b1;
						end
						else if(instruction[12:8] == id_ex_instruction[17:13])
						begin
							//forward load result top to the alu top, STALL
							alu_top_sel <= 5'b01000;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b1;
						end
						else
						begin
							//No forward necessary
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
					end
				end
				//Load Immeadiate, This could never cause a stall
				else if(id_ex_instruction[7:0] == 8'hF8)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward ex/mem data bottom on to alu top
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else
					begin
						//No forward necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//Load Program Memory
				else if(id_ex_instruction[7:0] == 8'hF9)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//forward load result bottom to the alu top, ,STALL
						alu_top_sel <= 5'b10000;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else
					begin
						//No forward necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//In, MOVR
				else if( id_ex_instruction[7:0] == 8'h9C && (id_ex_instruction[19:18] == 2'b10 || id_ex_instruction[19:18] == 2'b00))
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//forward load result bottom to the alu top, STALL
						alu_top_sel <= 5'b10000;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else
					begin
						//No forward necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//Check For a potential dependent arithmetic instruction.
				//ADDI, SUBI, CPI, COM, INV
				else if(id_ex_instruction[7:0] == 8'hBC && id_ex_instruction[21] == 1'b1)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else
					begin
						//No forwarding necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//ADD, SUB, CP
				else if(id_ex_instruction[7:0] == 8'h80 && id_ex_instruction[21] == 1'b1)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else
					begin
						//No forwarding necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//MUL, MULI
				else if(id_ex_instruction == 8'h8E || id_ex_instruction == 8'h9E)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top.
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else if(instruction[12:8] == id_ex_instruction[17:13])
					begin
						//Forward EX/MEM data top to alu top
						alu_top_sel <= 5'b00010;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else
					begin
						//No forwarding necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//AND, OR
				else if(id_ex_instruction[7:0] == 8'h97)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else
					begin
						//No forwarding necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//ANDI, ORI
				else if(id_ex_instruction[7:0] == 8'h9B)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else
					begin
						//No forwarding necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//SHR, SHL
				else if(id_ex_instruction[7:0] == 8'hA5)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else
					begin
						//No forwarding necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//Check for a potential dependent Load
				//LD, LDFB
				else if(ex_mem_instruction[7:0] == 8'hFB)
				begin
					//Check if a LDFB or not.
					if(ex_mem_instruction[20] == 1'b1)
					begin
						//Normal Load
						if(instruction[12:8] == ex_mem_instruction[12:8])
						begin
							//forawrd the load result bot to the alu top
							alu_top_sel <= 5'b10000;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
						else
						begin
							//No forward necessary
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
					end
					else
					begin
						//Load Frame Buffer
						if(instruction[12:8] == ex_mem_instruction[12:8])
						begin
							//Forward load result bottom to the alu top
							alu_top_sel <= 5'b10000;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
						else if(instruction[12:8] == ex_mem_instruction[17:13])
						begin
							//forward load result top to the alu top
							alu_top_sel <= 5'b01000;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
						else
						begin
							//No forward necessary
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
					end
				end
				//Load Program Memory
				else if(ex_mem_instruction[7:0] == 8'hF9)
				begin
					if(instruction[12:8] == ex_mem_instruction[12:8])
					begin
						//forward load result bottom to the alu top
						alu_top_sel <= 5'b10000;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
					else
					begin
						//No forward necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//In, Move Register
				else if( id_ex_instruction[7:0] == 8'h9C && (id_ex_instruction[19:18] == 2'b10 || id_ex_instruction[19:18] == 2'b00))
				begin
					if(instruction[12:8] == ex_mem_instruction[12:8])
					begin
						//forward load result bottom to the alu top
						alu_top_sel <= 5'b10000;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
					else
					begin
						//No forward necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//No Hazards
				else
				begin
					alu_top_sel <= 5'b00001;
					alu_bot_sel <= 5'b00001;
					stall_decode <= 1'b0;
				end

			end
			//Add, Subtract, Compare, MUL, AND, OR,
			8'h80, 8'h8E, 8'h97 :
			begin

				//Check for dependent load that requires a stall.
				//LD, LDFB
				if(id_ex_instruction[7:0] == 8'hFB)
				begin
					//Check if a LDFB or not.
					if(id_ex_instruction[20] == 1'b1)
					begin
						//Normal Load
						if(instruction[12:8] == id_ex_instruction[12:8])
						begin
							//forawrd the load result bot to the alu top. STALL
							alu_top_sel <= 5'b10000;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b1;
						end
						else if(instruction[17:13] == id_ex_instruction[12:8])
						begin
							//Forward the load result bottom to the alu bot. STALL
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b10000;
							stall_decode <= 1'b1;
						end
						else
						begin
							//No forward necessary
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
					end
					else
					begin
						//Load Frame Buffer
						if(instruction[12:8] == id_ex_instruction[12:8])
						begin
							if(instruction[17:13] == id_ex_instruction[17:13])
							begin
								//Forward both the top and bottom load results to alu top and bottom STALL
								alu_top_sel <= 5'b10000;
								alu_bot_sel <= 5'b01000;
								stall_decode <= 1'b1;
							end
							else
							begin
								//Forward just the bottom load result to the alu top. STALL
								alu_top_sel <= 5'b10000;
								alu_bot_sel <= 5'b00001;
								stall_decode <= 1'b1;
							end
						end
						else if(instruction[12:8] == id_ex_instruction[17:13])
						begin
							if(instruction[17:13] == id_ex_instruction[12:8])
							begin
								//Forward both the top and bottom load results to alu top and bottom STALL
								alu_top_sel <= 5'b10000;
								alu_bot_sel <= 5'b01000;
								stall_decode <= 1'b1;
							end
							else
							begin
								//Forward just the the top load result to the alu top STALL
								alu_top_sel <= 5'b01000;
								alu_bot_sel <= 5'b00001;
								stall_decode <= 1'b1;
							end
						end
						else if(instruction[17:13] == id_ex_instruction[12:8])
						begin
							//Forward Load result bot to the alu bottom STALL
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b10000;
							stall_decode <= 1'b1;
						end
						else if(instruction[17:13] == id_ex_instruction[17:13])
						begin
							//forward load result top to the alu bottom. STALL
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b01000;
							stall_decode <= 1'b1;
						end
						else
						begin
							//No forward necessary
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
					end
				end
				//Load Immeadiate, This could never cause a stall
				else if(id_ex_instruction[7:0] == 8'hF8)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward ex/mem data bottom on to alu top
						alu_top_sel <= 5'b10000;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
					else if(instruction[17:13] == id_ex_instruction[12:8])
					begin
						//Forward ex/mem data bottom to alu bottom
						alu_top_sel <= 5'b10001;
						alu_bot_sel <= 5'b10000;
						stall_decode <= 1'b0;
					end
					else
					begin
						//No forward necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//Load Program Memory
				else if(id_ex_instruction[7:0] == 8'hF9)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//forward load result bot to the alu top, STALL
						alu_top_sel <= 5'b10000;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else if(instruction[17:13] == id_ex_instruction[12:8])
					begin
						//Forward load result top to alu bot, STALL
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b01000;
						stall_decode <= 1'b1;
					end
					else
					begin
						//No forward necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//In, Move Register
				else if( id_ex_instruction[7:0] == 8'h9C && (id_ex_instruction[19:18] == 2'b10 || id_ex_instruction[19:18] == 2'b00))
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//forward mem/wb data bottom to the alu top, STALL
						alu_top_sel <= 5'b10000;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b1;
					end
					else if (instruction[17:13] == id_ex_instruction[12:8])
					begin
						//Forward mem/wb data bottom to alu bottom, STALL
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b10000;
						stall_decode <= 1'b1;
					end
					else
					begin
						//No forward necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//Check For a potential dependent arithmetic instruction.
				//ADDI, SUBI, CPI, COM, INV
				else if(id_ex_instruction[7:0] == 8'hBC && id_ex_instruction[21] == 1'b1)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
					else if(instruction[17:13] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu bottom.
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00100;
						stall_decode <= 1'b0;
					end
					else
					begin
						//No forwarding necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//ADD, SUB, CP
				else if(id_ex_instruction[7:0] == 8'h80 && id_ex_instruction[21] == 1'b1)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
					else if(instruction[17:13] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu bottom.
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00100;
						stall_decode <= 1'b0;
					end
					else
					begin
						//No forwarding necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//MUL, MULI
				else if(id_ex_instruction == 8'h8E || id_ex_instruction == 8'h9E)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						if(instruction[17:13] == id_ex_instruction[17:13])
						begin
							//Forward both the top and bottom ex/mem data values to alu top and bottom
							alu_top_sel <= 5'b00100;
							alu_bot_sel <= 5'b00010;
							stall_decode <= 1'b0;
						end
						else
						begin
							//Forward just the bottom ex/mem data to the alu top.
							alu_top_sel <= 5'b00100;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
					end
					else if(instruction[12:8] == id_ex_instruction[17:13])
					begin
						if(instruction[17:13] == id_ex_instruction[12:8])
						begin
							//Forward both the top and bottom ex/mem data values to alu top and bottom
							alu_top_sel <= 5'b00010;
							alu_bot_sel <= 5'b00100;
							stall_decode <= 1'b0;
						end
						else
						begin
							//Forward just the the top ex/mem data value to the alu top
							alu_top_sel <= 5'b00010;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
					end
					else if(instruction[17:13] == id_ex_instruction[12:8])
					begin
						//Forward ex/mem data bot to the alu bottom
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
					else if(instruction[17:13] == id_ex_instruction[17:13])
					begin
						//forward ex/mem data top to the alu bottom
					end
					else
					begin
						//No forward necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//AND, OR
				else if(id_ex_instruction[7:0] == 8'h97)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
					else if(instruction[17:13] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu bottom.
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00100;
						stall_decode <= 1'b0;
					end
					else
					begin
						//No forwarding necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//ANDI, ORI
				else if(id_ex_instruction[7:0] == 8'h9B)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
					else if(instruction[17:13] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu bottom.
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00100;
						stall_decode <= 1'b0;
					end
					else
					begin
						//No forwarding necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//SHR, SHL
				else if(id_ex_instruction[7:0] == 8'hA5)
				begin
					if(instruction[12:8] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu top
						alu_top_sel <= 5'b00100;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
					else if(instruction[17:13] == id_ex_instruction[12:8])
					begin
						//Forward EX/MEM data bottom to alu bottom.
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00100;
						stall_decode <= 1'b0;
					end
					else
					begin
						//No forwarding necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//Check for a potential dependent Load
				//LD, LDFB
				else if(ex_mem_instruction[7:0] == 8'hFB)
				begin
					//Check if a LDFB or not.
					if(ex_mem_instruction[20] == 1'b1)
					begin
						//Normal Load
						if(instruction[12:8] == ex_mem_instruction[12:8])
						begin
							//forawrd the load result bot to the alu top.
							alu_top_sel <= 5'b10000;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
						else if(instruction[17:13] == ex_mem_instruction[12:8])
						begin
							//Forward the load result bottom to the alu bot.
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b10000;
							stall_decode <= 1'b0;
						end
						else
						begin
							//No forward necessary
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
					end
					else
					begin
						//Load Frame Buffer
						if(instruction[12:8] == ex_mem_instruction[12:8])
						begin
							if(instruction[17:13] == ex_mem_instruction[17:13])
							begin
								//Forward both the top and bottom load results to alu top and bottom
								alu_top_sel <= 5'b10000;
								alu_bot_sel <= 5'b01000;
								stall_decode <= 1'b0;
							end
							else
							begin
								//Forward just the bottom load result to the alu top.
								alu_top_sel <= 5'b10000;
								alu_bot_sel <= 5'b00001;
								stall_decode <= 1'b0;
							end
						end
						else if(instruction[12:8] == ex_mem_instruction[17:13])
						begin
							if(instruction[17:13] == ex_mem_instruction[12:8])
							begin
								//Forward both the top and bottom load results to alu top and bottom
								alu_top_sel <= 5'b10000;
								alu_bot_sel <= 5'b01000;
								stall_decode <= 1'b0;
							end
							else
							begin
								//Forward just the the top load result to the alu top
								alu_top_sel <= 5'b01000;
								alu_bot_sel <= 5'b00001;
								stall_decode <= 1'b0;
							end
						end
						else if(instruction[17:13] == ex_mem_instruction[12:8])
						begin
							//Forward Load result bot to the alu bottom
 							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b10000;
							stall_decode <= 1'b0;
						end
						else if(instruction[17:13] == ex_mem_instruction[17:13])
						begin
							//forward load result top to the alu bottom.
							alu_top_sel <= 5'b01000;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
						else
						begin
							//No forward necessary
							alu_top_sel <= 5'b00001;
							alu_bot_sel <= 5'b00001;
							stall_decode <= 1'b0;
						end
					end
				end
				//Load Program Memory
				else if(ex_mem_instruction[7:0] == 8'hF9)
				begin
					if(instruction[12:8] == ex_mem_instruction[12:8])
					begin
						//forward load result bottom to the alu top
						alu_top_sel <= 5'b10000;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
					else if(instruction[17:13] == ex_mem_instruction[12:8])
					begin
						//Forward ex/mem data bottom to alu bottom
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00100;
						stall_decode <= 1'b0;
					end
					else
					begin
						//No forward necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//In, Move Register
				else if( id_ex_instruction[7:0] == 8'h9C && (id_ex_instruction[19:18] == 2'b10 || id_ex_instruction[19:18] == 2'b00))
				begin
					if(instruction[12:8] == ex_mem_instruction[12:8])
					begin
						//forward load result top to the alu top
						alu_top_sel <= 5'b01000;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
					else if(instruction[17:13] == ex_mem_instruction[12:8])
					begin
						//Forward ex/mem data bottom to alu bottom
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b10000;
						stall_decode <= 1'b0;
					end
					else
					begin
						//No forward necessary
						alu_top_sel <= 5'b00001;
						alu_bot_sel <= 5'b00001;
						stall_decode <= 1'b0;
					end
				end
				//No Hazards
				else
				begin
					alu_top_sel <= 5'b00001;
					alu_bot_sel <= 5'b00001;
					stall_decode <= 1'b0;
				end
			end
			//Default Case
			default
			begin
				alu_top_sel <= 5'b00001;
				alu_bot_sel <= 5'b00001;
				stall_decode <= 1'b0;
			end
		endcase
	end

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("alu_forwarding_logic.vcd");
  $dumpvars (0, alu_forwarding_logic);
  #1;
end
`endif
*/
endmodule
