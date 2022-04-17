/* DONE
Module - Special Function Register File
Author - Zach Walden
Last Changed - 2/23/21, 4/16/22
Description - 32 x 8 special purpose register file. This module has a single read and write port. What differentiates this module from the general purpose register file is that every single register is exposed to the entire peripheral system for reading at any time.This will be use for memory addressing, interupt control, and peripheral control. These functions, besides memory addressing, need not be defined during the design of the main CPU.

Note -
*/

module sfr_file(
	input clock,
	input nreset,
	input [6:0] mem_ptr_ctl_signals,  	//<6> Z inc, <5> Y inc, <4> X inc, <3> call stack ptr inc,<2> call stack ptr dec ,<1> stack_ptr inc,<0> stack_ptr dec
	input call_stk_addr_sel,
	input stk_addr_sel,
	input [1:0] wren,
	input [4:0] wr_addr,
	input [7:0] write_data,
	input [4:0] rd_addr,
	output [7:0] read_data,
	output [15:0] stack_ptr,
	output [15:0] x_ptr,
	output [15:0] y_ptr,
	output [15:0] z_ptr,
	output [7:0] call_stk_ptr,
	input [71:0] sfr_file_in,
	output [111:0] sfr_file_out
);

	integer i;

	reg [7:0] sfr_array [0:31];
	reg [7:0] out_data = 0;

	wire [15:0] x_intermediate;
	assign x_intermediate[15:8] = sfr_array[3];
	assign x_intermediate[7:0] = sfr_array[2];
	wire [15:0] x_inc;

	wire [15:0] y_intermediate;
	assign y_intermediate[15:8] = sfr_array[5];
	assign y_intermediate[7:0] = sfr_array[4];
	wire [15:0] y_inc;

	wire [15:0] z_intermediate;
	assign z_intermediate[15:8] = sfr_array[7];
	assign z_intermediate[7:0] = sfr_array[6];
	wire [15:0] z_inc;

	wire [15:0] stk_ptr_intermediate;
	assign stk_ptr_intermediate[15:8] = sfr_array[1];
	assign stk_ptr_intermediate[7:0] = sfr_array[0];
	wire [15:0] stk_ptr_dec;
	wire [15:0] stk_ptr_inc;

	wire [7:0] call_stk_inc;
	wire [7:0] call_stk_dec;

	initial
	begin
		for(i=0;i<32;i=i+1)
		begin
			sfr_array[i] <= 0;
		end
	end


	always @ (negedge clock)
	begin
		if(nreset == 1'b0)
		begin
			for(i=0;i<32;i=i+1)
			begin
				sfr_array[i] <= 0;
			end
		end
		else
		begin
			//wren[0] is write enable
			if(wren[0] == 1'b1)
			begin
				sfr_array[wr_addr] <= write_data;
			end
			else
			begin
				if(mem_ptr_ctl_signals == 7'b0000010 && wren[0] == 1'b0)
				begin
					sfr_array[0] <= stk_ptr_inc[7:0];
					sfr_array[1] <= stk_ptr_inc[15:8];
				end
				else if(mem_ptr_ctl_signals == 7'b0000001 && wren[0] == 1'b0)
				begin
					sfr_array[0] <= stk_ptr_dec[7:0];
					sfr_array[1] <= stk_ptr_dec[15:8];
				end
				else if(mem_ptr_ctl_signals == 7'b0000100 && wren[0] == 1'b0)
				begin
					sfr_array[9] <= call_stk_dec;
				end
				else if(mem_ptr_ctl_signals == 7'b0001000 && wren[0] == 1'b0)
				begin
					sfr_array[9] <= call_stk_inc;
				end
				else if(mem_ptr_ctl_signals == 7'b0010000 && wren[0] == 1'b0)
				begin
					sfr_array[2] <= x_inc[7:0];
					sfr_array[3] <= x_inc[15:8];
				end
				else if(mem_ptr_ctl_signals == 7'b0100000 && wren[0] == 1'b0)
				begin
					sfr_array[4] <= y_inc[7:0];
					sfr_array[5] <= y_inc[15:8];
				end
				else if(mem_ptr_ctl_signals == 7'b1000000 && wren[0] == 1'b0)
				begin
					sfr_array[6] <= z_inc[7:0];
					sfr_array[7] <= z_inc[15:8];
				end

				//read in input values.
				sfr_array[23] <= sfr_file_in[7:0]; 	//Input Port A
				sfr_array[24] <= sfr_file_in[15:8]; 	//Timer Byte 0
				sfr_array[25] <= sfr_file_in[23:16]; 	//Timer Byte 1
				sfr_array[26] <= sfr_file_in[31:24]; 	//Timer Byte 2
				sfr_array[27] <= sfr_file_in[39:32]; 	//Timer Byte 3
				sfr_array[28] <= sfr_file_in[47:40]; 	//Timer Byte 4
				sfr_array[29] <= sfr_file_in[55:48]; 	//Timer Byte 5
				sfr_array[30] <= sfr_file_in[63:56]; 	//Timer Byte 6
				sfr_array[31] <= sfr_file_in[71:64]; 	//Timer Byte 7


			end
			if(wren[1] == 1'b1)
			begin
				out_data <= sfr_array[rd_addr];
			end
			else
			begin
				out_data <= 8'h00;
			end
		end
	end

	//Memory Pointers
	assign stack_ptr[7:0] = stk_addr_sel ? stk_ptr_inc : sfr_array[0];
	assign stack_ptr[15:8] = stk_addr_sel ? stk_ptr_inc : sfr_array[1];
	assign x_ptr[7:0] = sfr_array[2];
	assign x_ptr[15:8] = sfr_array[3];
	assign y_ptr[7:0] = sfr_array[4];
	assign y_ptr[15:8] = sfr_array[5];
	assign z_ptr[7:0] = sfr_array[6];
	assign z_ptr[15:8] = sfr_array[7];

	assign x_inc = x_intermediate + 1;
	assign y_inc = y_intermediate + 1;
	assign z_inc = z_intermediate + 1;

	assign stk_ptr_inc = stk_ptr_intermediate + 1;
	assign stk_ptr_dec = stk_ptr_intermediate - 1;

	assign call_stk_inc = sfr_array[9] + 1;
	assign call_stk_dec = sfr_array[9] - 1;

	assign call_stk_ptr = call_stk_addr_sel ? call_stk_dec : sfr_array[9];

	assign sfr_file_out[7:0] = sfr_array[10]; 	//External LED Register
	//Interrupt Conntroller Control Register <0> Int Enable Flag
	assign sfr_file_out[15:8] = sfr_array[11];
	//GICR <2> Timer Compare Match Interrupt Mask, <1> illegal_opcode_exception mask, <0> vblank_int mask
	assign sfr_file_out[23:16] = sfr_array[12];
	//Timer Compare Match Value Registers.
	assign sfr_file_out[31:24] = sfr_array[13]; 	//Timer Compare Byte 0
	assign sfr_file_out[40:32] = sfr_array[14]; 	//Timer Compare Byte 1
	assign sfr_file_out[48:41] = sfr_array[15]; 	//Timer Compare Byte 2
	assign sfr_file_out[56:49] = sfr_array[16]; 	//Timer Compare Byte 3
	assign sfr_file_out[63:57] = sfr_array[17]; 	//Timer Compare Byte 4
	assign sfr_file_out[71:64] = sfr_array[18]; 	//Timer Compare Byte 5
	assign sfr_file_out[79:72] = sfr_array[19]; 	//Timer Compare Byte 6
	assign sfr_file_out[87:80] = sfr_array[20]; 	//Timer Compare Byte 7
	//General Purpose I/O Port B
	assign sfr_file_out[95:88] = sfr_array[21];
	//General Purpuse I/O Port A
	assign sfr_file_out[103:96] = sfr_array[22]; 	//output
	assign sfr_file_out[111:104] = sfr_array[8]; 	//Timer Control Register

	assign read_data = out_data;

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("sfr_file.vcd");
  $dumpvars (0, sfr_file);
  #1;
end
`endif
*/
endmodule
