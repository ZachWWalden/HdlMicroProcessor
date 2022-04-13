/*
Module - CPU Simulation Top File (System On Chip)
Author - Zach Walden
Last Changed - 3/28/22, 4/11/22
Description - This Module is the Top Module for the entire System On chip.
Parameters -
*/

module cpu(
	input clock,
	input nreset,
	//Memory Interface.
	output [11:0] data_in,
	output [15:0] addr_in,
	//Call Stack
	output call_stk_wen,
	output [7:0] call_stk_addr,
    	output [13:0] call_stk_din,
   	input [13:0] call_stk_dout,
	//main memory
    	output main_mem_wen,
    	input [7:0] main_mem_dout,
	//program memory
	output [13:0] prog_mem_addra,
	input [31:0] prog_mem_douta,
	input [7:0] prog_mem_doutb,
	//framebuffer
	output fb_wena,
	input [11:0] fb_douta
);

	wire call_stk_en;
	wire main_mem_en;
	wire fb_en;
	wire prog_mem_en;
	wire mem_wen;
	//wire [13:0] call_stk_data_in;
	wire [11:0] data_out;
	//Instantiate Memory I/O Buffer
	memory_io mem_buffer(
		//BEGIN interface with memory pipeline stage.
		.call_stk_en(call_stk_en),
		.main_mem_en(main_mem_en),
		.prog_mem_en(prog_mem_en),
		.fb_en(fb_en),
		.mem_wen(mem_wen),
		.data_out(data_out),
		//BEGIN Interface with the call stack.
		.call_stk_wen(call_stk_wen),
		//BEGIN interface with main memory
		.main_mem_wen(main_mem_wen),
		.main_mem_dout(main_mem_dout),
		//BEGIN interface with program memory.
		.prog_mem_doutb(prog_mem_doutb),
		//BEGIN interface with the framebuffer.
		.frame_buf_wena(fb_wena),
		.frame_buf_douta(fb_douta)
	);

	wire [31:0] sfr_input;
	wire [143:0] sfr_output;

	wire interrupt;
	wire [13:0] interrupt_vector_address ;

	wire [3:0] hazard_control_unit_state;
	wire illegal_opcode_exception;
	wire vblank_int;
	//Instantiate Interrupt Controller
	interrupt_controller int_controller(
		.clock(clock),
		.nreset(nreset),
		//BEIGN Interupt Signals
		.vblank_int(vblank_int),
		.illegal_opcode_exception(illegal_opcode_exception),
		//BEIGN Interface with Hazard Control Unit
		.hazard_unit_state(hazard_control_unit_state),
		.interrupt(interrupt),
		.int_vec_addr(interrupt_vector_address),
		//BEGIN Interface with SFR Conntrol Registers
		.sfr_output(sfr_output)
	);

	wire ret;
	wire halt;
	wire fetch_stl_req;
	wire dec_stl_req;
	wire take_branch_target;

	wire stall_fetch;
	wire stall_decode;
	wire [3:0] prog_cntr_load_sel;
	wire inst_word_sel;
	wire [31:0] hazard_instruction;
	wire [13:0] hazard_int_addr;

	//Instantiate Hazard Control Unit
	hazard_control_unit hazard_unit(
		.clock(clock),
		.nreset(nreset),
		//Inputs
		.ret(ret),
		.halt(halt),
		.fetch_stl_req(fetch_stl_req),
		.dec_stl_req(dec_stl_req),
		.take_branch_target(take_branch_target),
		.interrupt(interrupt),
		.interrupt_vector_address(interrupt_vector_address),
		//Outputs
		.stall_fetch(stall_fetch),
		.stall_decode(stall_decode),
		.prog_cntr_load_sel(prog_cntr_load_sel),
		.inst_word_sel(inst_word_sel),
		.new_inst_word(hazard_instruction),
		.prog_cntr_int_addr(hazard_int_addr),
		//State
		.control_state(hazard_control_unit_state)
	);

	//Instantiate Data Path
	datapath pipeline(
		.clock(clock),
		.nreset(nreset),
		//Memory Interface
		.prog_cntr_val(prog_mem_addra),
		.mem_fetch_instruction(prog_mem_douta),
		.main_mem_en(main_mem_en),
		.prog_mem_en(prog_mem_en),
		.fb_en(fb_en),
		.call_stk_en(call_stk_en),
		.mem_wen(mem_wen),
		.mem_addr(addr_in),
		.call_stk_addr(call_stk_addr),
		.write_data(data_in),
		.read_data(data_out),
		.call_stk_write_data(call_stk_din),
		.call_stk_read_data(call_stk_dout),
		//Hazard Unit Interface
		.stall_fetch(stall_fetch),
		.stall_decode(stall_decode),
		.hazard_prog_cntr_sel(prog_cntr_load_sel),
		.inst_word_sel(inst_word_sel),
		.hazard_inst_word(hazard_instruction),
		.prog_cntr_int_addr(hazard_int_addr),
		.stall_fetch_req(fetch_stl_req),
		.stall_decode_req(dec_stl_req),
		.halt(halt),
		.take_branch_target(take_branch_target),
		.illegal_opcode_exception(illegal_opcode_exception),  			//To Interrupt Controller
		.return_in_pipeline(ret),
		//SFR I/O Interface
		.sfr_file_in(sfr_input),
		.sfr_file_out(sfr_output)
	);


// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("cpu.vcd");
  $dumpvars (0, cpu);
  #1;
end
`endif

endmodule
