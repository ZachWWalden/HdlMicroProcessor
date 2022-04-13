/*
Module - Memory Forwarding Logic
Author - Zach Walden
Last Changed - 3/21/22
Description - Checks for pipline hazards relating to stores in either the memory banks or in the sfr.
Parameters -
*/

module memory_forwarding_logic(
	//input clock,
	input [31:0] instruction,
	input [31:0] ex_mem_instruction,
	input [31:0] mem_wb_instruction,
	output reg [4:0] sfr_input_sel,
	output reg [3:0] mem_wb_data_sel_top,
	output reg [6:0] mem_wb_data_sel_bot,
	output reg [4:0] mem_write_data_sel_top,
	output reg [4:0] mem_write_data_sel_bot
);

	always @ (*)
	begin
		case(instruction[7:0])
			//Load, Load Framebuffer, Pop
			8'hFB :
			begin
				sfr_input_sel <= 5'b00001;
				mem_write_data_sel_top <= 5'b00001;
				mem_write_data_sel_bot <= 5'b00100;
				mem_wb_data_sel_top <= 4'b0010;  		//Select both load results for simplicity.
				mem_wb_data_sel_bot <= 7'b0000100;
			end
			//Load Program Memory
			8'hF9 :
			begin
				sfr_input_sel <= 5'b00001;
				mem_write_data_sel_top <= 5'b00001;
				mem_write_data_sel_bot <= 5'b00100;
				mem_wb_data_sel_top <= 4'b0001;  		//Select load bottom result
				mem_wb_data_sel_bot <= 7'b0000100;
			end
			//Store, Store Framebuffer, Push
			8'hC6 :
			begin
				//Check if store or store framebuffer?
				if(instruction[20] == 1'b1)
				begin
					//Normal Store SINGLE WRITE
					//EX/MEM
					//SINGLE WRITE INSTRUCTIONS, INC, DEC, ADD, ADDI, SUB, SUBI, CP, CPI, AND, ANDI, OR, ORI, SHR, SHL, COM, INV, LD, POP, LPM, MOVR, OUT
					if((ex_mem_instruction[7:0] == 8'hBC) || (ex_mem_instruction[7:0] == 8'h80) || (ex_mem_instruction[7:0] == 8'h97) || (ex_mem_instruction[7:0] == 8'h9B) || (ex_mem_instruction[7:0] == 8'hA5) || (ex_mem_instruction[7:0] == 8'hFB && ex_mem_instruction[20] == 1'b1) || (ex_mem_instruction[7:0] == 8'hF9) || (ex_mem_instruction[7:0] == 8'hF8) || (ex_mem_instruction[7:0] == 8'h9C && ex_mem_instruction[19:18] == 2'b00) || (ex_mem_instruction[7:0] == 8'h9C && ex_mem_instruction[19:18] == 2'b01))
					begin
						if(instruction[17:13] == ex_mem_instruction[12:8])
						begin
							//Forward MEM/WB data bottom to mem str data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00100;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//DOUBLE WRITE INSTRUCTIONS LDFB, MUL, MULI
					else if((ex_mem_instruction[7:0] == 8'hFB && ex_mem_instruction[20] == 1'b0) || (ex_mem_instruction[7:0] ==  8'h8E) || (ex_mem_instruction[7:0] == 8'h9E))
					begin
						if(instruction[17:13] == ex_mem_instruction[12:8])
						begin
							//Forward mem_wb data bot to mem str data bottom
  							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00100;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else if(instruction[17:13] == ex_mem_instruction[17:13])
						begin
							//Forward mem_wb data top to mem str data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00010;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//MEM/WB
					else if((mem_wb_instruction[7:0] == 8'hBC) || (mem_wb_instruction[7:0] == 8'h80) || (mem_wb_instruction[7:0] == 8'h97) || (mem_wb_instruction[7:0] == 8'h9B) || (mem_wb_instruction[7:0] == 8'hA5) || (mem_wb_instruction[7:0] == 8'hFB && mem_wb_instruction[20] == 1'b1) || (mem_wb_instruction[7:0] == 8'hF9) || (mem_wb_instruction[7:0] == 8'hF8) || (mem_wb_instruction[7:0] == 8'h9C && mem_wb_instruction[19:18] == 2'b00) || (mem_wb_instruction[7:0] == 8'h9C && mem_wb_instruction[19:18] == 2'b01))
					begin
						if(instruction[17:13] == mem_wb_instruction[12:8])
						begin
							//Forward MEM/WB tm1 data bottom to mem str data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b10000;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//DOUBLE WRITE INSTRUCTIONS LDFB, MUL, MULI
					else if((mem_wb_instruction[7:0] == 8'hFB && mem_wb_instruction[20] == 1'b0) || (mem_wb_instruction[7:0] ==  8'h8E) || (mem_wb_instruction[7:0] == 8'h9E))
					begin
						if(instruction[17:13] == mem_wb_instruction[12:8])
						begin
							//Forward mem_wb tm1 data bot to mem str data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b10000;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else if(instruction[17:13] == mem_wb_instruction[17:13])
						begin
							//Forward mem_wb tm1 data top to mem str data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b01000;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					else
					begin
						//No forward necessary
						sfr_input_sel <= 5'b00001;
						mem_write_data_sel_top <= 5'b00001;
						mem_write_data_sel_bot <= 5'b00001;
						mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
						mem_wb_data_sel_bot <= 7'b0000010;
					end
				end
				else
				begin
					//Store Framebuffer DOUBLE WRITE
					//EX/MEM
					//SINGLE WRITE INSTRUCTIONS, INC, DEC, ADD, ADDI, SUB, SUBI, CP, CPI, AND, ANDI, OR, ORI, SHR, SHL, COM, INV, LD, POP, LPM, MOVR, OUT
					if((ex_mem_instruction[7:0] == 8'hBC) || (ex_mem_instruction[7:0] == 8'h80) || (ex_mem_instruction[7:0] == 8'h97) || (ex_mem_instruction[7:0] == 8'h9B) || (ex_mem_instruction[7:0] == 8'hA5) || (ex_mem_instruction[7:0] == 8'hFB && ex_mem_instruction[20] == 1'b1) || (ex_mem_instruction[7:0] == 8'hF9) || (ex_mem_instruction[7:0] == 8'hF8) || (ex_mem_instruction[7:0] == 8'h9C && ex_mem_instruction[19:18] == 2'b00) || (ex_mem_instruction[7:0] == 8'h9C && ex_mem_instruction[19:18] == 2'b01))
					begin
						if(instruction[12:8] == ex_mem_instruction[12:8])
						begin
							//Forward MEM/WB bottom to mem str data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00100;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else if(instruction[17:13] == ex_mem_instruction[12:8])
						begin
							//Forward MEM/WB bottom to mem str data top
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00100;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forwarding necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//DOUBLE WRITE INSTRUCTIONS LDFB, MUL, MULI
					else if((ex_mem_instruction[7:0] == 8'hFB && ex_mem_instruction[20] == 1'b0) || (ex_mem_instruction[7:0] ==  8'h8E) || (ex_mem_instruction[7:0] == 8'h9E))
					begin
						if(instruction[12:8] == ex_mem_instruction[12:8])
						begin
							if(instruction[17:13] == ex_mem_instruction[17:13])
							begin
								//Forward MEM/WB data top & bot to mem_str data top & bot
								sfr_input_sel <= 5'b00001;
								mem_write_data_sel_top <= 5'b00010;
								mem_write_data_sel_bot <= 5'b00100;
								mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
								mem_wb_data_sel_bot <= 7'b0000010;
							end
							else
							begin
								//Forward MEM/WB bot to mem_str data bot
								sfr_input_sel <= 5'b00001;
								mem_write_data_sel_top <= 5'b00001;
								mem_write_data_sel_bot <= 5'b00100;
								mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
								mem_wb_data_sel_bot <= 7'b0000010;
							end
						end
						else if(instruction[12:8] == ex_mem_instruction[17:13])
						begin
							if(instruction[17:13] == ex_mem_instruction[12:8])
							begin
								//Forward MEM/WB data top & bot to mem_str data bot & top
								sfr_input_sel <= 5'b00001;
								mem_write_data_sel_top <= 5'b00100;
								mem_write_data_sel_bot <= 5'b00010;
								mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
								mem_wb_data_sel_bot <= 7'b0000010;
							end
							else
							begin
								//Forward MEM/WB top to mem_str data bot
								sfr_input_sel <= 5'b00001;
								mem_write_data_sel_top <= 5'b00001;
								mem_write_data_sel_bot <= 5'b00010;
								mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
								mem_wb_data_sel_bot <= 7'b0000010;
							end
						end
						else if(instruction[17:13] == ex_mem_instruction[12:8])
						begin
							//Forward MEM/WB data bot to mem_str data top
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00100;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else if(instruction[17:13] == ex_mem_instruction[17:13])
						begin
							//Forward MEM/WB data top to mem_str data top
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00010;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//MEM/WB
					else if((mem_wb_instruction[7:0] == 8'hBC) || (mem_wb_instruction[7:0] == 8'h80) || (mem_wb_instruction[7:0] == 8'h97) || (mem_wb_instruction[7:0] == 8'h9B) || (mem_wb_instruction[7:0] == 8'hA5) || (mem_wb_instruction[7:0] == 8'hFB && mem_wb_instruction[20] == 1'b1) || (mem_wb_instruction[7:0] == 8'hF9) || (mem_wb_instruction[7:0] == 8'hF8) || (mem_wb_instruction[7:0] == 8'h9C && mem_wb_instruction[19:18] == 2'b00) || (mem_wb_instruction[7:0] == 8'h9C && mem_wb_instruction[19:18] == 2'b01))
					begin
					    if(instruction[12:8] == mem_wb_instruction[12:8])
						begin
							//Forward MEM/WB tm1 bottom to mem str data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b10000;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;

						end
						else if(instruction[17:13] == mem_wb_instruction[12:8])
						begin
							//Forward MEM/WB tm1 bottom to mem str data top
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b10000;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forwarding necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//DOUBLE WRITE INSTRUCTIONS LDFB, MUL, MULI
					else if((mem_wb_instruction[7:0] == 8'hFB && mem_wb_instruction[20] == 1'b0) || (mem_wb_instruction[7:0] ==  8'h8E) || (mem_wb_instruction[7:0] == 8'h9E))
					begin
						if(instruction[12:8] == mem_wb_instruction[12:8])
						begin
							if(instruction[17:13] == mem_wb_instruction[17:13])
							begin
								//Forward MEM/WB tm1 data top & bot to mem_str data top & bot
								sfr_input_sel <= 5'b00001;
								mem_write_data_sel_top <= 5'b01000;
								mem_write_data_sel_bot <= 5'b10000;
								mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
								mem_wb_data_sel_bot <= 7'b0000010;
							end
							else
							begin
								//Forward MEM/WB tm1 bot to mem_str data bot
								sfr_input_sel <= 5'b00001;
								mem_write_data_sel_top <= 5'b00001;
								mem_write_data_sel_bot <= 5'b10000;
								mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
								mem_wb_data_sel_bot <= 7'b0000010;
							end
						end
						else if(instruction[12:8] == mem_wb_instruction[17:13])
						begin
							if(instruction[17:13] == mem_wb_instruction[12:8])
							begin
								//Forward MEM/WB tm1 data top & bot to mem_str data bot & top
								sfr_input_sel <= 5'b00001;
								mem_write_data_sel_top <= 5'b10001;
								mem_write_data_sel_bot <= 5'b01000;
								mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
								mem_wb_data_sel_bot <= 7'b0000010;
							end
							else
							begin
								//Forward MEM/WB tm1 top to mem_str data bot
								sfr_input_sel <= 5'b00001;
								mem_write_data_sel_top <= 5'b00001;
								mem_write_data_sel_bot <= 5'b01000;
								mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
								mem_wb_data_sel_bot <= 7'b0000010;
							end
						end
						else if(instruction[17:13] == mem_wb_instruction[12:8])
						begin
							//Forward MEM/WB tm1 data bot to mem_str data top
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b10000;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else if(instruction[17:13] == mem_wb_instruction[17:13])
						begin
							//Forward MEM/WB tm1  data top to mem_str data top
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b10000;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					else
					begin
						//No forward necessary
						sfr_input_sel <= 5'b00001;
						mem_write_data_sel_top <= 5'b00001;
						mem_write_data_sel_bot <= 5'b00001;
						mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
						mem_wb_data_sel_bot <= 7'b0000010;
					end
				end
			end
			//MOVR, OUT, IN
			8'h9C :
			begin
				//In
				if(instruction[19:18] == 2'b10)
				begin
					//No forward necessary
					sfr_input_sel <= 5'b00001;
					mem_write_data_sel_top <= 5'b00001;
					mem_write_data_sel_bot <= 5'b00001;
					mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
					mem_wb_data_sel_bot <= 7'b0000001; 		//Select SFR read data
				end
				//Out
				else if(instruction[19:18] == 2'b01)
				begin
					//EX/MEM
					//SINGLE WRITE INSTRUCTIONS, INC, DEC, ADD, ADDI, SUB, SUBI, CP, CPI, AND, ANDI, OR, ORI, SHR, SHL, COM, INV, LD, POP, LPM, MOVR, OUT
					if((ex_mem_instruction[7:0] == 8'hBC) || (ex_mem_instruction[7:0] == 8'h80) || (ex_mem_instruction[7:0] == 8'h97) || (ex_mem_instruction[7:0] == 8'h9B) || (ex_mem_instruction[7:0] == 8'hA5) || (ex_mem_instruction[7:0] == 8'hFB && ex_mem_instruction[20] == 1'b1) || (ex_mem_instruction[7:0] == 8'hF9) || (ex_mem_instruction[7:0] == 8'hF8) || (ex_mem_instruction[7:0] == 8'h9C && ex_mem_instruction[19:18] == 2'b00) || (ex_mem_instruction[7:0] == 8'h9C && ex_mem_instruction[19:18] == 2'b01))
					begin
						if(instruction[17:13] == ex_mem_instruction[12:8])
						begin
							//Forward MEM/WB data bottom to sfr input
							sfr_input_sel <= 5'b00100;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//DOUBLE WRITE INSTRUCTIONS LDFB, MUL, MULI
					else if((ex_mem_instruction[7:0] == 8'hFB && ex_mem_instruction[20] == 1'b0) || (ex_mem_instruction[7:0] ==  8'h8E) || (ex_mem_instruction[7:0] == 8'h9E))
					begin
						if(instruction[17:13] == ex_mem_instruction[12:8])
						begin
							//Forward mem_wb data bot to sfr input
							sfr_input_sel <= 5'b00100;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else if(instruction[17:13] == ex_mem_instruction[17:13])
						begin
							//Forward mem_wb data top to sfr input
							sfr_input_sel <= 5'b00010;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//MEM/WB
					else if((mem_wb_instruction[7:0] == 8'hBC) || (mem_wb_instruction[7:0] == 8'h80) || (mem_wb_instruction[7:0] == 8'h97) || (mem_wb_instruction[7:0] == 8'h9B) || (mem_wb_instruction[7:0] == 8'hA5) || (mem_wb_instruction[7:0] == 8'hFB && mem_wb_instruction[20] == 1'b1) || (mem_wb_instruction[7:0] == 8'hF9) || (mem_wb_instruction[7:0] == 8'hF8) || (mem_wb_instruction[7:0] == 8'h9C && mem_wb_instruction[19:18] == 2'b00) || (mem_wb_instruction[7:0] == 8'h9C && mem_wb_instruction[19:18] == 2'b01))
					begin
						if(instruction[17:13] == mem_wb_instruction[12:8])
						begin
							//Forward MEM/WB tm1 data bottom to sfr input
							sfr_input_sel <= 5'b10000;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//DOUBLE WRITE INSTRUCTIONS LDFB, MUL, MULI
					else if((mem_wb_instruction[7:0] == 8'hFB && mem_wb_instruction[20] == 1'b0) || (mem_wb_instruction[7:0] ==  8'h8E) || (mem_wb_instruction[7:0] == 8'h9E))
					begin
						if(instruction[17:13] == mem_wb_instruction[12:8])
						begin
							//Forward mem_wb tm1 data bot to sfr input
							sfr_input_sel <= 5'b10000;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else if(instruction[17:13] == mem_wb_instruction[17:13])
						begin
							//Forward mem_wb tm1 data top to sfr input
							sfr_input_sel <= 5'b01000;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					else
					begin
						//No forward necessary
						sfr_input_sel <= 5'b00001;
						mem_write_data_sel_top <= 5'b00001;
						mem_write_data_sel_bot <= 5'b00001;
						mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
						mem_wb_data_sel_bot <= 7'b0000010;
					end
				end
				//TODO This module needs to handle the creation of the signal that controls the mem/wb data input mux. to do this, a control signal will be added to this bus along with cases to handle the creation of the signal for anny memory loads, and sfr reads. On top of that, the mem/wb data input mux will need to be rewritten to handsle the mem/wb time minus 1 (tm1) values
				//MOVR
				else if(instruction[19:18] == 2'b00)
				begin
					//EX/MEM
					//SINGLE WRITE INSTRUCTIONS, INC, DEC, ADD, ADDI, SUB, SUBI, CP, CPI, AND, ANDI, OR, ORI, SHR, SHL, COM, INV, LD, LDI, POP, LPM, MOVR, OUT
					if((ex_mem_instruction[7:0] == 8'hBC) || (ex_mem_instruction[7:0] == 8'h80) || (ex_mem_instruction[7:0] == 8'h97) || (ex_mem_instruction[7:0] == 8'h9B) || (ex_mem_instruction[7:0] == 8'hA5) || (ex_mem_instruction[7:0] == 8'hFB && ex_mem_instruction[20] == 1'b1) || (ex_mem_instruction[7:0] == 8'hF9) || (ex_mem_instruction[7:0] == 8'hF8) || (ex_mem_instruction[7:0] == 8'h9C && ex_mem_instruction[19:18] == 2'b00) || (ex_mem_instruction[7:0] == 8'h9C && ex_mem_instruction[19:18] == 2'b01))
					begin
						if(instruction[17:13] == ex_mem_instruction[12:8])
						begin
							//Forward MEM/WB data bottom to mem str data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0010000;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//DOUBLE WRITE INSTRUCTIONS LDFB, MUL, MULI
					else if((ex_mem_instruction[7:0] == 8'hFB && ex_mem_instruction[20] == 1'b0) || (ex_mem_instruction[7:0] ==  8'h8E) || (ex_mem_instruction[7:0] == 8'h9E))
					begin
						if(instruction[17:13] == ex_mem_instruction[12:8])
						begin
							//Forward mem_wb data bot to mem/wb data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0010000;
						end
						else if(instruction[17:13] == ex_mem_instruction[17:13])
						begin
							//Forward mem_wb data top to mem str data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0001000;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//MEM/WB
					else if((mem_wb_instruction[7:0] == 8'hBC) || (mem_wb_instruction[7:0] == 8'h80) || (mem_wb_instruction[7:0] == 8'h97) || (mem_wb_instruction[7:0] == 8'h9B) || (mem_wb_instruction[7:0] == 8'hA5) || (mem_wb_instruction[7:0] == 8'hFB && mem_wb_instruction[20] == 1'b1) || (mem_wb_instruction[7:0] == 8'hF9) || (mem_wb_instruction[7:0] == 8'hF8) || (mem_wb_instruction[7:0] == 8'h9C && mem_wb_instruction[19:18] == 2'b00) || (mem_wb_instruction[7:0] == 8'h9C && mem_wb_instruction[19:18] == 2'b01))
					begin
						if(instruction[17:13] == mem_wb_instruction[12:8])
						begin
							//Forward MEM/WB tm1 data bottom to mem/wb data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b1000000;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					//DOUBLE WRITE INSTRUCTIONS LDFB, MUL, MULI
					else if((mem_wb_instruction[7:0] == 8'hFB && mem_wb_instruction[20] == 1'b0) || (mem_wb_instruction[7:0] ==  8'h8E) || (mem_wb_instruction[7:0] == 8'h9E))
					begin
						if(instruction[17:13] == mem_wb_instruction[12:8])
						begin
							//Forward mem_wb tm1 data bot to mem/wb data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b1000000;
						end
						else if(instruction[17:13] == mem_wb_instruction[17:13])
						begin
							//Forward mem_wb tm1 data top to mem/wb data bottom
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0100000;
						end
						else
						begin
							//No forward necessary
							sfr_input_sel <= 5'b00001;
							mem_write_data_sel_top <= 5'b00001;
							mem_write_data_sel_bot <= 5'b00001;
							mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
							mem_wb_data_sel_bot <= 7'b0000010;
						end
					end
					else
					begin
						//No forward necessary
						sfr_input_sel <= 5'b00001;
						mem_write_data_sel_top <= 5'b00001;
						mem_write_data_sel_bot <= 5'b00001;
						mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
						mem_wb_data_sel_bot <= 7'b0000010;
					end
				end
				else
				begin
					//No forward needed
					sfr_input_sel <= 5'b00001;
					mem_write_data_sel_top <= 5'b00001;
					mem_write_data_sel_bot <= 5'b00001;
					mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
					mem_wb_data_sel_bot <= 7'b0000010;
				end
			end
			//Default Case
			default
			begin
				//No forward needed
				sfr_input_sel <= 5'b00001;
				mem_write_data_sel_top <= 5'b00001;
				mem_write_data_sel_bot <= 5'b00001;
				mem_wb_data_sel_top <= 4'b0001;  		//Simply pass EX/MEM through
				mem_wb_data_sel_bot <= 7'b0000010;
			end
		endcase
	end


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
