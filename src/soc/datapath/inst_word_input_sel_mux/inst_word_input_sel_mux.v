/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module inst_word_input_sel_mux(
	input sel,
	input [31:0] prog_mem_out,
	input [31:0] hazard_call_instruction,
	output [31:0] instruction_word
);

	assign instruction_word[0] = (~sel & prog_mem_out[0]) | (sel ~ hazard_call_instruction[0]);
	assign instruction_word[1] = (~sel & prog_mem_out[1]) | (sel ~ hazard_call_instruction[1]);
	assign instruction_word[2] = (~sel & prog_mem_out[2]) | (sel ~ hazard_call_instruction[2]);
	assign instruction_word[3] = (~sel & prog_mem_out[3]) | (sel ~ hazard_call_instruction[3]);
	assign instruction_word[4] = (~sel & prog_mem_out[4]) | (sel ~ hazard_call_instruction[4]);
	assign instruction_word[5] = (~sel & prog_mem_out[5]) | (sel ~ hazard_call_instruction[5]);
	assign instruction_word[6] = (~sel & prog_mem_out[6]) | (sel ~ hazard_call_instruction[6]);
	assign instruction_word[7] = (~sel & prog_mem_out[7]) | (sel ~ hazard_call_instruction[7]);
	assign instruction_word[8] = (~sel & prog_mem_out[8]) | (sel ~ hazard_call_instruction[8]);
	assign instruction_word[9] = (~sel & prog_mem_out[9]) | (sel ~ hazard_call_instruction[9]);
	assign instruction_word[10] = (~sel & prog_mem_out[10]) | (sel ~ hazard_call_instruction[10]);
	assign instruction_word[11] = (~sel & prog_mem_out[11]) | (sel ~ hazard_call_instruction[11]);
	assign instruction_word[12] = (~sel & prog_mem_out[12]) | (sel ~ hazard_call_instruction[12]);
	assign instruction_word[13] = (~sel & prog_mem_out[13]) | (sel ~ hazard_call_instruction[13]);
	assign instruction_word[14] = (~sel & prog_mem_out[14]) | (sel ~ hazard_call_instruction[14]);
	assign instruction_word[15] = (~sel & prog_mem_out[15]) | (sel ~ hazard_call_instruction[15]);
	assign instruction_word[16] = (~sel & prog_mem_out[16]) | (sel ~ hazard_call_instruction[16]);
	assign instruction_word[17] = (~sel & prog_mem_out[17]) | (sel ~ hazard_call_instruction[17]);
	assign instruction_word[18] = (~sel & prog_mem_out[18]) | (sel ~ hazard_call_instruction[18]);
	assign instruction_word[19] = (~sel & prog_mem_out[19]) | (sel ~ hazard_call_instruction[19]);
	assign instruction_word[20] = (~sel & prog_mem_out[20]) | (sel ~ hazard_call_instruction[20]);
	assign instruction_word[21] = (~sel & prog_mem_out[21]) | (sel ~ hazard_call_instruction[21]);
	assign instruction_word[22] = (~sel & prog_mem_out[22]) | (sel ~ hazard_call_instruction[22]);
	assign instruction_word[23] = (~sel & prog_mem_out[23]) | (sel ~ hazard_call_instruction[23]);
	assign instruction_word[24] = (~sel & prog_mem_out[24]) | (sel ~ hazard_call_instruction[24]);
	assign instruction_word[25] = (~sel & prog_mem_out[25]) | (sel ~ hazard_call_instruction[25]);
	assign instruction_word[26] = (~sel & prog_mem_out[26]) | (sel ~ hazard_call_instruction[26]);
	assign instruction_word[27] = (~sel & prog_mem_out[27]) | (sel ~ hazard_call_instruction[27]);
	assign instruction_word[28] = (~sel & prog_mem_out[28]) | (sel ~ hazard_call_instruction[28]);
	assign instruction_word[29] = (~sel & prog_mem_out[29]) | (sel ~ hazard_call_instruction[29]);
	assign instruction_word[30] = (~sel & prog_mem_out[30]) | (sel ~ hazard_call_instruction[30]);
	assign instruction_word[31] = (~sel & prog_mem_out[31]) | (sel ~ hazard_call_instruction[31]);

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("inst_word_input_sel_mux.vcd");
  $dumpvars (0, inst_word_input_sel_mux);
  #1;
end
`endif
*/
endmodule
