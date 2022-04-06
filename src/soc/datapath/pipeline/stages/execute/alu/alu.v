

module alu(
	input clock,
	input nreset,
	input alu_operation_select,
	input [1:0] alu_operation,
	input [7:0] top_operand,
	input [7:0] bottom_operand,
	output [2:0] alu_flags,
	output [15:0] alu_out
	);

	wire [3:0] fu_oe;

	//Instantiate Adder, Multiplier, Shifter, & Bit Manipulator.
	adder add_unit(
		.clock(clock),
		.nreset(nreset),
		.add_sub(alu_operation_select),
		.oe(fu_oe[0]),
		.primary_operand(top_operand),
		.secondary_operand(bottom_operand),
		.flags(alu_flags),
		.result(alu_out[7:0])
		);

	multiplier multiply_unit(
		.clock(clock),
		.nreset(nreset),
		.oe(fu_oe[1]),
		.primary_operand(top_operand),
		.secondary_operand(bottom_operand),
		.flags(alu_flags),
		.mult_out(alu_out)
		);

	bit_shifter shifter(
		.clock(clock),
		.nreset(nreset),
		.oe(fu_oe[2]),
		.right_left(alu_operation_select),
		.primary_operand(top_operand),
		.flags(alu_flags),
		.result(alu_out[7:0])
		);

	bitwise_logic_unit bitwise(
		.clock(clock),
		.nreset(nreset),
		.oe(fu_oe[3]),
		.and_or(alu_operation_select),
		.primary_operand(top_operand),
		.secondary_operand(bottom_operand),
		.flags(alu_flags),
		.result(alu_out[7:0])
		);

	always @ (posedge clock)
	begin
		if(nreset == 1'b1)
		begin

		end
	end

	//adder oe.
	assign fu_oe[0] = ~alu_operation[0] & ~alu_operation[1];
	//multiplier oe
	assign fu_oe[1] = alu_operation[0] & ~alu_operation[1];
	//bit shifter oe
	assign fu_oe[2] = ~alu_operation[0] & alu_operation[1];
	//bitwise logic oe
	assign fu_oe[3] = alu_operation[0] & alu_operation[1];

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("alu.vcd");
  $dumpvars (0, alu);
  #1;
end
`endif
*/
endmodule
