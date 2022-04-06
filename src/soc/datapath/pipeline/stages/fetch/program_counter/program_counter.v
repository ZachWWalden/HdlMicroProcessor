/*
Module - Program Counter
Author - Zach Walden
Last Changed - 2/1/22, 4/1/22
Description - Program Counter, If fetch is not being stalled by the hazard controller, it increments the address every cycle "fetching" the next instruction. It is resettable. It also supports a parallel load feature. The parallel load bus will be connected to the output of a multiplexor to that, if a load is required, selects a new input from the decode pipeline stage or from the output of the call stack.
Parameters - input stall - stall signal. This signal will prevent an increment if asserted, thus "stalling" the fetch stage.
	     input take_branch_target - This signal in combination with a 2X14 to 1 multiplexor to select the proper new program counter.
	     input [13:0] branch_target - this is either the branch target for a branch instruction in the adjacent decode pipeline stage or the output of the call stack memory.
	     output [13:0] prog_mem_addr_fetch - This is the address presented to the fetch pipline stages port of the program memory ROM. The outputs of that rom will be latched into the IF/ID pipeline register on the next positive edge of the core clock. Memory has a full cycle of latency before data is valid. Thus the memory will be run at at least a 10% higher frequency clock with respect to the core to ensure that the output of the memory is valid in time to ensure a single cycle for instruction fetch to ensure that the pipeline remains as full as possible. This latency has been tested on hardware using equal clocks which would work for pipelining, but fetch would have to be stretched into a two stage cycle thus increasing the branch penalty a cycle. I tested memory @110% of the core frequency and data seemed to be valid at the next positive edge although the address seemed to be held by the memory itself a little longer than would be desired so more testing must be done to ensure that that would be stable. I have also test the memory at double the frequency of the core and had no issues.
*/

module program_counter(
	input clock,
	input nreset,
	input stall,
	input [13:0] load_value,
	output [13:0] next_prog_cntr,
	output [13:0] prog_mem_addr_fetch
);

	reg [13:0] value = 0;
	wire [13:0] next_value;

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin
			value <= 0;
		end
		else if(stall == 1'b0)
		begin
			value <= load_value;
		end
		else
		begin
			value <= value;
		end
	end

    assign next_value = value + 1;
    assign next_prog_cntr = next_value;
	assign prog_mem_addr_fetch = value;

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("program_counter.vcd");
  $dumpvars (0, program_counter);
  #1;
end
`endif
*/
endmodule
