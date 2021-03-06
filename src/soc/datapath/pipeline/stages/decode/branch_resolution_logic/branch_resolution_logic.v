/*
Module - Branch Resolution Logic
Author - Zach Walden
Last Changed - 4/1/22
Description - This Logic Resolves Whether a Branch Target Address should be taken or not.
Parameters -
*/

module branch_resolution_logic(
	//input clock,
	input [31:0] operation,
	input [2:0] flags,
	output reg take_branch_target = 0
);

	always @ (*)
	begin
		if(operation[7:0] == 8'b00111000)
		begin
			//Carry Branches flags[2]
			if(operation[9:8] == 2'b01)
			begin
				if(flags[2] == 1'b1 && operation[10] == 1'b1)
				begin
					take_branch_target <= 1;
				end
				else if(flags[2] == 1'b0 && operation[10] == 1'b0)
				begin
					take_branch_target <= 1;
				end
				else
				begin
					take_branch_target <= 0;
				end
			end
			//Zero Branches flags[0]
			else if(operation[9:8] == 2'b10)
			begin
				if(flags[0] == 1'b1 && operation[10] == 1'b1)
				begin
					take_branch_target <= 1;
				end
				else if(flags[0] == 1'b0 && operation[10] == 1'b0)
				begin
					take_branch_target <= 1;
				end
				else
				begin
					take_branch_target <= 0;
				end
			end
			//Negative Branches flags[1]
			else if(operation[9:8] == 2'b11)
			begin
				if(flags[1] == 1'b1 && operation[10] == 1'b1)
				begin
					take_branch_target <= 1;
				end
				else if(flags[1] == 1'b0 && operation[10] == 1'b0)
				begin
					take_branch_target <= 1;
				end
				else
				begin
					take_branch_target <= 0;
				end
			end
			else
			begin
				take_branch_target <= 1;
			end
		end
		//If a Call Instruction
		else if(operation[7:0] == 8'h42)
		begin
			take_branch_target <= 1;
		end
		else
		begin
			take_branch_target <= 0;
		end
	end

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("branch_resolution_logic.vcd");
  $dumpvars (0, branch_resolution_logic);
  #1;
end
`endif
*/
endmodule
