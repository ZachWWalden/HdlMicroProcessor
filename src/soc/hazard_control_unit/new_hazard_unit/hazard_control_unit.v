/*
Module - Hazard Control Unit.
Author - Zach Walden
Last Changed - 3/28/22, 4/4/22
Description - This Module is a finite state machine that controls the state of operation of the pipeline.
Parameters -
*/

module hazard_control_unit(
	input clock,
	//Inputs
	input return,
	input halt,
	input fetch_stl_req,
	input dec_stl_req,
	input interrupt,
	input [13:0] interrupt_vector_address,
	//Outputs
	output reg stall_fetch = 0,
	output reg stall_decode = 0,
	output reg [2:0] prog_cntr_load_sel = 0,
	output reg inst_word_sel = 0,
	output reg [31:0] new_inst_word = 0,
	output reg [13:0] prog_cntr_int_addr = 0,
	//State
	output reg [2:0] control_state = 0
);

	reg [2:0] state, next_state;

	always @ (negedge clock)
	begin
		if(nreset == 1'b0)
		begin
			state <= 0;
		end
		else
		begin
			state <= next_state;
		end
	end

	always @ (*)
	begin
		case(state)
			//Normal 4'b0000
			3'h0 :
			begin
				//Outputs
				stall_fetch <= 1'b0;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b0;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
				if(return == 1'b1)
				begin
					next_state <= 3'b101;
				end
				else if(halt == 1'b1)
				begin
					next_state <= 3'b001;
				end
				else if(fetch_stl_req == 1'b1)
				begin
					next_state <= 3'b011;
				end
				else if(dec_stl_req == 1'b1)
				begin
					next_state <= 3'b100;
				end
				else if(interrupt == 1'b1)
				begin
					next_state <= 3'b010;
				end
				else
				begin
					next_state <= 3'b000;
				end
			end
			//Halt 4'b0001
			3'h1 :
			begin
				//Outputs
				stall_fetch <= 1'b1;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b1;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
				if(interrupt == 1'b1)
				begin
					next_state <= 3'b010;
				end
				else
				begin
					next_state <= 3'b001;
				end
			end
			//Interrupt 4'b0010
			3'h2 :
			begin
				//Outputs
				stall_fetch <= 1'b0;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b010;
				inst_word_sel <= 1'b1;
				new_inst_word[31:18] <= interrupt_vector_address;
				new_inst_word[17:0] <= 18'h00042;
				prog_cntr_int_addr <= interrupt_vector_address;
				//Go To Normal
				next_state <= 3'b000;
			end
			//Stall Fetch 4'b0011
			3'h3 :
			begin
				//Outputs
				stall_fetch <= 1'b1;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b1;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;

				if(interrupt == 1'b1)
				begin
					next_state <= 3'b010;
				end
				else
				begin
					next_state <= 3'b000;
				end
			end
			//Stall Decode 4'b0100
			3'h4 :
			begin
				//Outputs
				stall_fetch <= 1'b1;
				stall_decode <= 1'b1;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b1;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
				if(interrupt == 1'b1)
				begin
					next_state <= 3'b010;
				end
				else
				begin
					next_state <= 3'b000;
				end
			end
			//Return 1 4'b0101
			3'h5 :
			begin
				//Outputs
				stall_fetch <= 1'b1;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b1;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
				//To return 2
				next_state <= 3'b110;
			end
			//Return 2 4'b0110
			3'h6 :
			begin
				//Outputs
				stall_fetch <= 1'b1;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b1;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
				//To Return 3
				next_state <= 3'b111;
			end
			//Return 3 4'b111
			3'h7 :
			begin
				//Outputs
				stall_fetch <= 1'b1;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b100;
				inst_word_sel <= 1'b1;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
				//To Normal
				next_state <= 3'b000;
			end
		endcase
	end


// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("hazard_control_unit.vcd");
  $dumpvars (0, hazard_control_unit);
  #1;
end
`endif

endmodule
