/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module branch_resolution_logic(
	input clock,
	input [7:0] operation,
	input [2:0] flags,
	output reg take_branch_target
);

	always @ (*)
	begin
		if(operation[7:3] == 5'b00111)
		begin
			//Carry Branches flags[2]
			if(operation[1:0] == 2'b01)
			begin
				if(flags[2] == 1'b1 && operation[2] == 1'b1)
				begin
					take_branch_target = 1;
				end
				else if(flags[2] == 1'b0 && operation[2] == 1'b0)
				begin
					take_branch_target = 1;
				end
				else
				begin
					take_branch_target = 0;
				end
			end
			//Zero Branches flags[0]
			else if(operation[1:0] == 2'b10)
			begin
				if(flags[0] == 1'b1 && operation[2] == 1'b1)
				begin
					take_branch_target = 1;
				end
				else if(flags[0] == 1'b0 && operation[2] == 1'b0)
				begin
					take_branch_target = 1;
				end
				else
				begin
					take_branch_target = 0;
				end
			end
			//Negative Branches flags[1]
			else if(operation[1:0] == 2'b11)
			begin
				if(flags[1] == 1'b1 && operation[2] == 1'b1)
				begin
					take_branch_target = 1;
				end
				else if(flags[1] == 1'b0 && operation[2] == 1'b0)
				begin
					take_branch_target = 1;
				end
				else
				begin
					take_branch_target = 0;
				end
			end
			else
			begin
				take_branch_target = 1;
			end
		end
		else
		begin
			take_branch_target = 0;
		end
	end

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("branch_resolution_logic.vcd");
  $dumpvars (0, branch_resolution_logic);
  #1;
end
`endif
endmodule
