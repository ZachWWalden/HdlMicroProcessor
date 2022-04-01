/*
Module - Instruction Word Sel Mux
Author - Zach Walden
Last Changed - 3/31/22
Description - This mux allows the hazard_control_unit to insert either a nop or call instruction into the pipeline when stalling the instruction fetch stage.
Parameters -
*/

module inst_word_sel_mux(
	input sel,
	input [31:0] mem_inst_word,
	input [31:0] hazard_unit_inst_word,
	output reg [31:0] inst_word_out
);

	always @ (*)
	begin
		if(sel == 1'b1)
		begin
			inst_word_out <= hazard_unit_inst_word;
		end
		else
		begin
			inst_word_out <= mem_inst_word;
		end
	end

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("inst_word_sel_mux.vcd");
  $dumpvars (0, inst_word_sel_mux);
  #1;
end
`endif
*/
endmodule
