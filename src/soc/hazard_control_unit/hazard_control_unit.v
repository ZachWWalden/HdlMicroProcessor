/*
Module - Hazard Control Unit.
Author - Zach Walden
Last Changed - 3/28/22
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
	output reg [3:0] state = 0
);

	always @ (negedge clock)
	begin
		case(state)
		begin
			//Normal 4'b0000
			4'h0 :
			begin
				if(return == 1'b1)
				begin
					state <= 4'b0101;
					stall_fetch <= 1'b1;
					stall_decode <= 1'b0;
					prog_cntr_load_sel <= 3'b000;
					inst_word_sel <= 1'b0;
					new_inst_word <= 32'h00000000;
					prog_cntr_int_addr <= 14'h0000;
				end
				else if(halt == 1'b1)
				begin
					state <= 4'b0001;
					stall_fetch <= 1'b1;
					stall_decode <= 1'b1;
					prog_cntr_load_sel <= 3'b001;
					inst_word_sel <= 1'b1;
					new_inst_word <= 32'h00000000;
					prog_cntr_int_addr <= 14'h0000;
				end
				else if(fetch_stl_req == 1'b1)
				begin
					state <= 4'b0011;
					stall_fetch <= 1'b1;
					stall_decode <= 1'b0;
					prog_cntr_load_sel <= 3'b001;
					inst_word_sel <= 1'b1;
					new_inst_word <= 32'h00000000;
					prog_cntr_int_addr <= 14'h0000;
				end
				else if(dec_stl_req == 1'b1)
				begin
					state <= 4'b0100;
					stall_fetch <= 1'b1;
					stall_decode <= 1'b0;
					prog_cntr_load_sel <= 3'b000;
					inst_word_sel <= 1'b1;
					new_inst_word <= 32'h00000000;
					prog_cntr_int_addr <= 14'h0000;
				end
				else if(interrupt == 1'b1)
				begin
					state <= 4'b0010;
					stall_fetch <= 1'b1;
					stall_decode <= 1'b0;
					prog_cntr_load_sel <= 3'b000;
					inst_word_sel <= 1'b1;
					new_inst_word <= 32'h00000042 | (interrupt_vector_address << 18);
					prog_cntr_int_addr <= interrupt_vector_address;
				end
				else
				begin
					state <= 4'b0000;
					stall_fetch <= 1'b0;
					stall_decode <= 1'b0;
					prog_cntr_load_sel <= 3'b001;
					inst_word_sel <= 1'b0;
					new_inst_word <= 32'h00000000;
					prog_cntr_int_addr <= 14'h0000;
				end
			end
			//Halt 4'b0001
			4'h1 :
			begin
				if(interrupt == 1'b1)
				begin
					state <= 4'b0010;
					stall_fetch <= 1'b1;
					stall_decode <= 1'b0;
					prog_cntr_load_sel <= 3'b010;
					inst_word_sel <= 1'b1;
					new_inst_word <= 32'h00000042 | (interrupt_vector_address << 18);
					prog_cntr_int_addr <= interrupt_vector_address;
				end
				else
				begin
					state <= 4'b0001;
					stall_fetch <= 1'b1;
					stall_decode <= 1'b1;
					prog_cntr_load_sel <= 3'b001;
					inst_word_sel <= 1'b1;
					new_inst_word <= 32'h00000000;
					prog_cntr_int_addr <= 14'h0000;
				end
			end
			//Interrupt 4'b0010
			4'h2 :
			begin
				state <= 4'b0000;
				stall_fetch <= 1'b0;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b0;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
			end
			//Stall Fetch 4'b0011
			4'h3 :
			begin
				if(interrupt == 1'b1)
				begin
					state <= 4'b0010;
					stall_fetch <= 1'b1;
					stall_decode <= 1'b0;
					prog_cntr_load_sel <= 3'b010;
					inst_word_sel <= 1'b1;
					new_inst_word <= 32'h00000042 | (interrupt_vector_address << 18);
					prog_cntr_int_addr <= interrupt_vector_address;
				end
				else
				begin
					state <= 4'b0000;
					stall_fetch <= 1'b0;
					stall_decode <= 1'b0;
					prog_cntr_load_sel <= 3'b001;
					inst_word_sel <= 1'b0;
					new_inst_word <= 32'h00000000;
					prog_cntr_int_addr <= 14'h0000;
				end
			end
			//Stall Decode 4'b0100
			4'h4 :
			begin
				if(interrupt == 1'b1)
				begin
					state <= 4'b0010;
					stall_fetch <= 1'b1;
					stall_decode <= 1'b0;
					prog_cntr_load_sel <= 3'b010;
					inst_word_sel <= 1'b1;
					new_inst_word <= 32'h00000042 | (interrupt_vector_address << 18);
					prog_cntr_int_addr <= interrupt_vector_address;
				end
				else
				begin
					state <= 4'b0000;
					stall_fetch <= 1'b0;
					stall_decode <= 1'b0;
					prog_cntr_load_sel <= 3'b001;
					inst_word_sel <= 1'b0;
					new_inst_word <= 32'h00000000;
					prog_cntr_int_addr <= 14'h0000;
				end
			end
			//Return 1 4'b0101
			4'h5 :
			begin
				//To return 2
				state <= 4'b0110;
				stall_fetch <= 1'b1;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b1;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
			end
			//Return 2 4'b0110
			4'h6 :
			begin
				state <= 4'b0111;
				stall_fetch <= 1'b1;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b1;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
			end
			//Return 3 4'b0111
			4'h7 :
			begin
				state <= 4'b1000;
				stall_fetch <= 1'b1;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b1;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
			end
			//Return 4 4'b1000
			4'h8 :
			begin
				state <= 4'b0000;
				stall_fetch <= 1'b0;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b0;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
			end
			//Default -> Go to normal operation.
			default
			begin
				state <= 4'b0000;
				stall_fetch <= 1'b0;
				stall_decode <= 1'b0;
				prog_cntr_load_sel <= 3'b001;
				inst_word_sel <= 1'b0;
				new_inst_word <= 32'h00000000;
				prog_cntr_int_addr <= 14'h0000;
			end
		end
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
