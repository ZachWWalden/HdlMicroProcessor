/*
Module - Special Function Register File
Author - Zach Walden
Last Changed - 2/18/21
Description - 32 x 8 special purpose register file. This module has a single read and write port. What differentiates this module from the general purpose register file is that every single register is exposed to the entire peripheral system for reading at any time.This will be use for memory addressing, interupt control, and peripheral control. These functions, besides memory addressing, need not be defined during the design of the main CPU.
Parameters -
*/

module sfr_file(
	input clock,
	input nreset,
	input [1:0] wren,
	input [4:0] wr_addr,
	input [7:0] write_data,
	input [4:0] rd_addr,
	output [7:0] read_data,
	output [15:0] w_ptr,
	output [15:0] x_ptr,
	output [15:0] y_ptr,
	output [15:0] z_ptr,
	output fb_segment,
	output [255:0] sfr_file_out
);

	integer i;

	reg [7:0] sfr_array [0:31];
	reg [7:0] out_data = 0;

	initial
	begin
		for(i=0;i<32;i=i+1)
		begin
			sfr_array[i] <= 0;
		end
	end


	always @ (negedge clock)
	begin
		if(nreset == 1'b1)
		begin
			for(i=0;i<32;i=i+1)
			begin
				sfr_array[i] <= 0;
			end
		end
		else
		begin
			//wren[0] is write enable
			if(wren == 2'b01)
			begin
				sfr_array[wr_addr] <= write_data;
			end
			else if(wren == 2'b10)
			begin
				out_data <= sfr_array[rd_addr];
			end
			else
			begin
				out_data <= 8'h00;
			end
		end
	end

	assign sfr_file_out[7:0] = sfr_array[0];
	assign sfr_file_out[15:8] = sfr_array[1];
	assign sfr_file_out[23:16] = sfr_array[2];
	assign sfr_file_out[31:24] = sfr_array[3];
	assign sfr_file_out[40:32] = sfr_array[4];
	assign sfr_file_out[48:41] = sfr_array[5];
	assign sfr_file_out[56:49] = sfr_array[6];
	assign sfr_file_out[63:57] = sfr_array[7];
	assign sfr_file_out[71:64] = sfr_array[8];
	assign sfr_file_out[79:72] = sfr_array[9];
	assign sfr_file_out[87:80] = sfr_array[10];
	assign sfr_file_out[95:88] = sfr_array[11];
	assign sfr_file_out[103:96] = sfr_array[12];
	assign sfr_file_out[111:104] = sfr_array[13];
	assign sfr_file_out[119:112] = sfr_array[14];
	assign sfr_file_out[127:120] = sfr_array[15];
	assign sfr_file_out[135:128] = sfr_array[16];
	assign sfr_file_out[143:136] = sfr_array[17];
	assign sfr_file_out[151:144] = sfr_array[18];
	assign sfr_file_out[159:152] = sfr_array[19];
	assign sfr_file_out[167:160] = sfr_array[20];
	assign sfr_file_out[175:168] = sfr_array[21];
	assign sfr_file_out[183:176] = sfr_array[22];
	assign sfr_file_out[191:184] = sfr_array[23];
	assign sfr_file_out[199:192] = sfr_array[24];
	assign sfr_file_out[207:200] = sfr_array[25];
	assign sfr_file_out[215:208] = sfr_array[26];
	assign sfr_file_out[223:216] = sfr_array[27];
	assign sfr_file_out[231:224] = sfr_array[28];
	assign sfr_file_out[239:232] = sfr_array[29];
	assign sfr_file_out[247:240] = sfr_array[30];
	assign sfr_file_out[255:248] = sfr_array[31];

	assign w_ptr[7:0] = sfr_array[0];
	assign w_ptr[15:8] = sfr_array[1];
	assign x_ptr[7:0] = sfr_array[2];
	assign x_ptr[15:8] = sfr_array[3];
	assign y_ptr[7:0] = sfr_array[4];
	assign y_ptr[15:8] = sfr_array[5];
	assign z_ptr[7:0] = sfr_array[6];
	assign z_ptr[15:8] = sfr_array[7];

	assign fb_segment = sfr_array[8][1];

	assign read_data = out_data;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("sfr_file.vcd");
  $dumpvars (0, sfr_file);
  #1;
end
`endif
endmodule
