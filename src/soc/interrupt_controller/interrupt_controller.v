/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module interrupt_controller(
	input clock,
	input nreset,
	//BEIGN Interupt Signals
	input vblank_int,
	input illegal_opcode_exception,
	input timer_compare_match,
	//BEIGN Interface with Hazard Control Unit
	input [3:0] hazard_unit_state,
	output reg interrupt = 0,
	output reg [13:0] int_vec_addr = 0,
	//BEGIN Interface with SFR Conntrol Registers
	input [7:0] control_reg,
	input [7:0] mask_reg
);

	reg vblankint_t = 0;
	reg vblankint_tm1 = 0;

	reg ioeint_t = 0;
	reg ioeint_tm1 = 0;

	reg tcmint_t = 0;
	reg tcmint_tm1 = 0;

	reg state = 0;

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin
			//Zero out edge detect registers
			ioeint_tm1 <= 0;
			ioeint_t <= 0;

			vblankint_tm1 <= 0;
			vblankint_t <= 0;

			tcmint_t <= 0;
			tcmint_tm1 <= 0;

			interrupt <= 0;
			int_vec_addr <= 0;
		end
		else
		begin
			ioeint_tm1 = ioeint_t;
			ioeint_t = illegal_opcode_exception;

			vblankint_tm1 = vblankint_t;
			vblankint_t = vblank_int;

			if(control_reg[0] == 1'b1 && state == 1'b0)
			begin
				//Do interrupts.
				//Always Rising Edge
				if(vblankint_t == 1'b1 && vblankint_tm1 == 1'b0 && mask_reg[0] == 1'b1)
				begin
					//Vblank Interrut
					state <= 1;
					interrupt <= 1;
					int_vec_addr <= 14'h0001;
				end
				//Always Rising Edge
				else if(ioeint_t == 1'b1 && ioeint_tm1 == 1'b0 && mask_reg[1] == 1'b1)
				begin
					//Illegal Opcode Exception
					state <= 1;
					interrupt <= 1;
					int_vec_addr <= 14'h0002;
				end
				//Always Rising Edge
				else if(tcmint_t == 1'b1 && tcmint_t == 1'b0 && mask_reg[2] == 1'b1)
				begin
					//Illegal Opcode Exception
					state <= 1;
					interrupt <= 1;
					int_vec_addr <= 14'h0003;
				end
				else
				begin
					//No Interrupts
					state <= 0;
					interrupt <= 0;
					int_vec_addr <= 14'h0000;
				end
			end
			else if(control_reg[0] == 1'b1 && state == 1'b1 && hazard_unit_state != 4'b0010)
			begin
				//Keep signals the same.
				state <= state;
				interrupt <= interrupt;
				int_vec_addr <= int_vec_addr;
			end
			else
			begin
				//No do Interrupts.
				state <= 0;
				interrupt <= 0;
				int_vec_addr <= 14'h0000;
			end
		end
	end


/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("interrupt_controller.vcd");
  $dumpvars (0, interrupt_controller);
  #1;
end
`endif
*/
endmodule
