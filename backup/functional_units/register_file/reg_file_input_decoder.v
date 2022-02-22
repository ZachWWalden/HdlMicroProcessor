/*
Module - Register File Input Decoder.
Author - Zach Walden
Last Changed -
Description - Takes the register file input data and write addresses, and with that data, switches the data inputs to the appropriate registers and generates the appropriate wen signals.
Parameters -
*/

module reg_file_input_decoder(
	input clock,
	input [1:0] wr_en,
	input [15:0] data_in,
	input [9:0] wr_addr,
	output [31:0] wen,
	output [255:0] data_out
);
	integer i = 0;

	reg [1:0] wen_int [0:15];
	reg [15:0] data_out_int [0:15];

    	initial
    	begin
        	for (i=0;i<16;i=i+1)
        	begin
        		wen_int[i] = 0;
        		data_out_int[i] = 0;
        	end
    	end

	wire [1:0] wr_low;
	wire [1:0] wr_high;

	always @ (posedge clock)
	begin
		if(wr_addr[3:0] == wr_addr[8:5] && wr_en == 2'b11)
		begin
			wen_int[wr_addr[3:0]] = 2'b11;
			data_out_int[wr_addr[3:0]][7:0] = data_in[7:0];
			data_out_int[wr_addr[3:0]][15:8] = data_in[15:8];
			for(i=0;i<16;i=i+1)
			begin
				if(i != wr_addr[8:5])
				begin
					wen_int[i] <= 2'b00;
					data_out_int[1] <= 16'h0000;
				end
				else
				begin
					wen_int[i] <= wen_int[i];
				end
			end
		end
		else
		begin
			//wr_addr[3:0] is the first write address
			if(wr_en[0] == 1'b1)
			begin
				//Set the proper registers wen signals.
				wen_int[wr_addr[3:0]] = wr_low;
				//check whether the target byte is the high or low byte.
				if(wr_low[0] == 1'b1)
				begin
					data_out_int[wr_addr[3:0]][7:0] = data_in[7:0];
					data_out_int[wr_addr[3:0]][15:8] = 8'h00;
				end
				else
				begin
					data_out_int[wr_addr[3:0]][15:8] = data_in[7:0];
					data_out_int[wr_addr[3:0]][7:0] = 8'h00;
				end
				for(i=0;i<16;i=i+1)
				begin
					if(i != wr_addr[8:5] && i != wr_addr[3:0])
					begin
						wen_int[i] <= 2'b00;
						data_out_int[i] <= 16'h0000;
					end
					else
					begin
						wen_int[i] <= wen_int[i];
					end
				end
			end
			else
			begin
				for(i=0;i<16;i=i+1)
				begin
					if(i != wr_addr[8:5])
					begin
						wen_int[i] <= 2'b00;
						data_out_int[i] <= 16'h0000;
					end
					else
					begin
						wen_int[i] <= wen_int[i];
					end
				end
			end
			if(wr_en[1] == 1'b1)
			begin
				//Set the proper registers wen signals.
				wen_int[wr_addr[8:5]] = wr_high;
				//check whether the target byte is the high or low byte. if()
				if(wr_high[0] == 1'b1)
				begin
					data_out_int[wr_addr[3:0]][7:0] = data_in[15:8];
					data_out_int[wr_addr[3:0]][15:8] = 8'h00;
				end
				else
				begin
					data_out_int[wr_addr[3:0]][15:8] = data_in[15:8];
					data_out_int[wr_addr[3:0]][7:0] = 8'h00;
				end
				for(i=0;i<16;i=i+1)
				begin
					if(i != wr_addr[8:5] && i != wr_addr[3:0])
					begin
						wen_int[i] <= 2'b00;
						data_out_int[i] <= 16'h0000;
					end
					else
					begin
						wen_int[i] <= wen_int[i];
					end
				end
			end
			else
			begin
				for(i=0;i<16;i=i+1)
				begin
					if(i != wr_addr[3:0])
					begin
						wen_int[i] <= 2'b00;
						data_out_int[i] <= 16'h0000;
					end
					else
					begin
						wen_int[i] <= wen_int[i];
					end
				end
			end
		end
	end

	assign wr_low[0] = ~wr_addr[4];
	assign wr_low[1] = wr_addr[4];
	assign wr_high[0] = ~wr_addr[9];
	assign wr_high[1] = wr_addr[9];

	//Why can I not figure out how to do this with a for loop...
	assign data_out[15:0] = data_out_int[0];
	assign wen[1:0] = wen_int[0];

	assign data_out[31:16] = data_out_int[1];
	assign wen[3:2] = wen_int[1];

	assign data_out[47:32] = data_out_int[2];
	assign wen[5:4] = wen_int[2];

	assign data_out[63:48] = data_out_int[3];
	assign wen[7:6] = wen_int[3];

	assign data_out[79:64] = data_out_int[4];
	assign wen[9:8] = wen_int[4];

	assign data_out[95:80] = data_out_int[5];
	assign wen[11:10] = wen_int[5];

	assign data_out[111:96] = data_out_int[6];
	assign wen[13:12] = wen_int[6];

	assign data_out[127:112] = data_out_int[7];
	assign wen[15:14] = wen_int[7];

	assign data_out[143:128] = data_out_int[8];
	assign wen[17:16] = wen_int[8];

	assign data_out[159:144] = data_out_int[9];
	assign wen[19:18] = wen_int[9];

	assign data_out[175:160] = data_out_int[10];
	assign wen[21:20] = wen_int[10];

	assign data_out[191:176] = data_out_int[11];
	assign wen[23:22] = wen_int[11];

	assign data_out[207:192] = data_out_int[12];
	assign wen[25:24] = wen_int[12];

	assign data_out[223:208] = data_out_int[13];
	assign wen[27:26] = wen_int[13];

	assign data_out[239:224] = data_out_int[14];
	assign wen[29:28] = wen_int[14];

	assign data_out[255:240] = data_out_int[15];
	assign wen[31:30] = wen_int[15];
/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("reg_file_input_decoder.vcd");
  $dumpvars (0, reg_file_input_decoder);
  #1;
end
`endif
*/
endmodule
