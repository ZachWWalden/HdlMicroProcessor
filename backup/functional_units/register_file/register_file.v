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

	//decare input decoder
	wire [31:0] wen;
	wire [255:0] write_data;

	reg_file_input_decoder in_dec(
		.clock(clock),
		.wr_en(wr_en),
		.data_in(data_in),
		.wr_addr(wr_addr),
		.wen(wen),
		.data_out(write_data)
	);

	//declare output decoder
	wire [31:0] ren;
	wire [255:0] read_data;

	reg_file_output_decoder out_dec(
		.clock(clock),
		.rd_addr(rd_addr),
		.rd_en(rd_en),
		.ren(ren),
		.data_in(read_data),
		.data_out(data_out)
	);

	//declare registers.
	generate
	   genvar i;
	   for(i=0;i<16;i=i+1)
	   begin
	       register_short regs(
		          .clock(clock),
		          .nreset(nreset),
		          .wen(wen[2*i+1:2*i]),
		          .ren(ren[2*i+1:2*i]),
		          .data_in(write_data[16*i+15:16*i]),
		          .data_out(read_data[16*i+15:16*i])
	           );
	   end
	endgenerate
	//for loop

	always @ (posedge clock)
	begin

	end

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("register_file.vcd");
  $dumpvars (0,register_file);
  #1;
end
`endif
endmodule
