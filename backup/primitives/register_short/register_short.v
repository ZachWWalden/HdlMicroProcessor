/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module register_short(
	input clock,
	input nreset,
	input [1:0] wen,
	input [1:0] ren,
	input [15:0] data_in,
	output [15:0] data_out
);
	wire [15:0] data;
	reg [1:0] read_en = 0;

	//Instantiate two 8-bit registers.
	register_byte reg0(
		.clock(clock), //clock input signal
		.nreset(nreset), //active low reset signal
		.write_enable(wen[0]), //write_enable
		.data_in(data_in[7:0]), //input data
		.data_out(data[7:0]) //output data
	);
	register_byte reg1(
		.clock(clock), //clock input signal
		.nreset(nreset), //active low reset signal
		.write_enable(wen[1]), //write_enable
		.data_in(data_in[15:8]), //input data
		.data_out(data[15:8]) //output data
	);

	always @ (posedge clock)
	begin
		read_en <= 0;
	end

	always @ (negedge clock)
	begin
		read_en <= ren;
	end

	assign data_out[7:0] = read_en[0] ? data[7:0] : 8'hZZ;
	assign data_out[15:8] = read_en[1] ? data[15:8] : 8'hZZ;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("register_short.vcd");
  $dumpvars (0, register_short);
  #1;
end
`endif
endmodule
