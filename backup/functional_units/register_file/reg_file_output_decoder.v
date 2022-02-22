/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

`timescale 1 ns / 1 ps

module reg_file_output_decoder(
	input clock,
	input [9:0] rd_addr,
	input [1:0] rd_en,
	output [31:0] ren,
	input [255:0] data_in,
	output [15:0] data_out
);

    	integer i = 0;

    	reg [15:0] data_out_int = 0;

	reg [1:0] ren_int [0:15];
	wire [15:0] data_in_int [0:15];

    	initial
    	begin
        	for (i=0;i<16;i=i+1)
        	begin
        		ren_int[i] = 0;
        	end
    	end

	wire [1:0] rd_low;
	wire [1:0] rd_high;

	always @ (posedge clock)
	begin
		//this is needed to cover an edge case when trying to read from both halves of a register pair. Without it, only the high byte read enable signal would make its way into the register file.
		if(rd_addr[3:0] == rd_addr[8:5] && rd_en == 2'b11)
		begin
			ren_int[rd_addr[3:0]] = 2'b11;
			for(i=0;i<16;i=i+1)
			begin
				if(i != rd_addr[8:5])
				begin
					ren_int[i] <= 2'b00;
				end
				else
				begin
					ren_int[i] <= ren_int[i];
				end
			end
		end
		else
		begin
			//set the read enable signals. This can be done here as downstream modules will not affect this signal, thus, it will stay valid the entire clock cycle.
			if(rd_en[0] == 1'b1)
			begin
				//Set the proper registers wen signals.
				ren_int[rd_addr[3:0]] = rd_low;
				for(i=0;i<16;i=i+1)
				begin
					if(i != rd_addr[8:5] && i != rd_addr[3:0])
					begin
						ren_int[i] <= 2'b00;
					end
					else
					begin
						ren_int[i] <= ren_int[i];
					end
				end
			end
			else
			begin
				for(i=0;i<16;i=i+1)
				begin
					if(i != rd_addr[8:5])
					begin
						ren_int[i] <= 2'b00;
					end
					else
					begin
						ren_int[i] <= ren_int[i];
					end
				end
			end
			if(rd_en[1] == 1'b1)
			begin
				//Set the proper registers wen signals.
				ren_int[rd_addr[8:5]] = rd_high;
				for(i=0;i<16;i=i+1)
				begin
					if(i != rd_addr[8:5] && i != rd_addr[3:0])
					begin
						ren_int[i] <= 2'b00;
					end
					else
					begin
						ren_int[i] <= ren_int[i];
					end
				end
			end
			else
			begin
				for(i=0;i<16;i=i+1)
				begin
					if(i != rd_addr[3:0])
					begin
						ren_int[i] <= 2'b00;
					end
					else
					begin
						ren_int[i] <= ren_int[i];
					end
				end
			end
		end
	end

	always @ (negedge clock)
	begin
//		#1
		//set data since it will not be valid until the negative edge of the clock.
		if(rd_en[0] == 1'b1)
		begin
			//check rd_low, which will be an independent value relative to rd_high
			if(rd_low[0] == 1'b1)
			begin
				data_out_int[7:0] = data_in_int[rd_addr[3:0]][7:0];
			end
			else /*if(rd_low[1] == 1'b1)*/
			begin
				data_out_int[7:0] = data_in_int[rd_addr[3:0]][15:8];
			end
		end
		else
		begin
			data_out_int[7:0] <= 8'h00;
		end
		if(rd_en[1] == 1'b1)
		begin
			if(rd_high[0] == 1'b1)
			begin
				data_out_int[15:8] = data_in_int[rd_addr[8:5]][7:0];
			end
			else /*if(rd_high[1] == 1'b1)*/
			begin
				data_out_int[15:8] = data_in_int[rd_addr[8:5]][15:8];
			end
		end
		else
		begin
			data_out_int[15:8] <= 8'h00;
		end
	end

    	//Why can I not figure out how to do this with a for loop...
    	//pair address 0x0
	assign data_in_int[0] = data_in[15:0];
	assign ren[1:0] = ren_int[0];
	//pair address 0x1
	assign data_in_int[1] = data_in[31:16];
	assign ren[3:2] = ren_int[1];
	//pair address 0x2
	assign data_in_int[2] = data_in[47:32];
	assign ren[5:4] = ren_int[2];
	//pair address 0x3
	assign data_in_int[3] = data_in[63:48];
	assign ren[7:6] = ren_int[3];
	//pair address 0x4
	assign data_in_int[4] = data_in[79:64];
	assign ren[9:8] = ren_int[4];
	//pair address 0x5
	assign data_in_int[5] = data_in[95:80];
	assign ren[11:10] = ren_int[5];
	//pair address 0x6
	assign data_in_int[6] = data_in[111:96];
	assign ren[13:12] = ren_int[6];
	//pair address 0x7
	assign data_in_int[7] = data_in[127:112];
	assign ren[15:14] = ren_int[7];
	//pair address 0x8
	assign data_in_int[8] = data_in[143:128];
	assign ren[17:16] = ren_int[8];
	//pair address 0x9
	assign data_in_int[9] = data_in[159:144];
	assign ren[19:18] = ren_int[9];
	//pair address 0xa
	assign data_in_int[10] = data_in[175:160];
	assign ren[21:20] = ren_int[10];
	//pair address 0xb
	assign data_in_int[11] = data_in[191:176];
	assign ren[23:22] = ren_int[11];
	//pair address 0xc
	assign data_in_int[12] = data_in[207:192];
	assign ren[25:24] = ren_int[12];
	//pair address 0xd
	assign data_in_int[13] = data_in[223:208];
	assign ren[27:26] = ren_int[13];
	//pair address 0xe
	assign data_in_int[14] = data_in[239:224];
	assign ren[29:28] = ren_int[14];
	//pair address 0xf
	assign data_in_int[15] = data_in[255:240];
	assign ren[31:30] = ren_int[15];

	assign data_out = data_out_int;

	assign rd_low[0] = ~rd_addr[4];
	assign rd_low[1] = rd_addr[4];
	assign rd_high[0] = ~rd_addr[9];
	assign rd_high[1] = rd_addr[9];

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("reg_file_output_decoder.vcd");
  $dumpvars (0, reg_file_output_decoder);
  #1;
end
`endif
*/
endmodule
