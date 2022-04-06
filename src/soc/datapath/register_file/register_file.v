/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module register_file(
	input clock,
	input nreset,
	input [1:0] wr_en,
	input [1:0] rd_en,
	input [9:0] wr_addr,
	input [9:0] rd_addr,
	input [15:0] data_in,
	output [15:0] data_out
);
	integer i;

	reg [7:0] reg_file [0:31];

	initial
	begin
		for(i=0;i<32;i=i+1)
		begin
			reg_file[i] = 0;
		end
	end

	reg [15:0] read_data = 0;
	reg [1:0] rd_en_int = 0;

	always @ (negedge clock)
	begin
		rd_en_int <= rd_en;
		//handle writes
		if(nreset == 1'b0)
		begin
			for(i=0;i<32;i=i+1)
			begin
				reg_file[i] <= 0;
			end
		end
		else
		begin
			if(wr_en[0] == 1'b1)
			begin
				reg_file[wr_addr[4:0]] = data_in[7:0];
			end
			else
			begin
				reg_file[wr_addr[4:0]] = reg_file[wr_addr[4:0]];
			end
			if(wr_en[1] == 1'b1)
			begin
				reg_file[wr_addr[9:5]] = data_in[15:8];
			end
			else
			begin
				reg_file[wr_addr[9:5]] = reg_file[wr_addr[9:5]];
			end
		end
	end
/*
	always @ (negedge clock)
	begin
		//handle reads
		if(rd_en[0] == 1'b1)
		begin
			read_data[7:0] = reg_file[rd_addr[4:0]];
		end
		else
		begin
			read_data[7:0] <= 8'h00;
		end
		if(rd_en[1] == 1'b1)
		begin
			read_data[15:8] = reg_file[rd_addr[9:5]];
		end
		else
		begin
			read_data[15:8] <= 8'h00;
		end
	end
*/
	assign data_out[7:0] = rd_en_int[0] ? reg_file[rd_addr[4:0]] : 8'h00;
	assign data_out[15:8] = rd_en_int[1] ? reg_file[rd_addr[9:5]] : 8'h00;

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("register_file.vcd");
  $dumpvars (0, register_file);
  #1;
end
`endif
*/
endmodule
