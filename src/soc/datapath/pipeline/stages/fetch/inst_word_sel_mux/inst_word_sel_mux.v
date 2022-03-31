/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module inst_word_sel_mux(
	input sel,
	input [31:0] mem_inst_word,
	input [31:0] hazard_unit_inst_word,
	output [31:0] inst_word_out
);

	assign inst_word_out[0] = (~sel & mem_inst_word[0]) | (sel & hazard_unit_inst_word[0]);
	assign inst_word_out[1] = (~sel & mem_inst_word[1]) | (sel & hazard_unit_inst_word[1]);
	assign inst_word_out[2] = (~sel & mem_inst_word[2]) | (sel & hazard_unit_inst_word[2]);
	assign inst_word_out[3] = (~sel & mem_inst_word[3]) | (sel & hazard_unit_inst_word[3]);
	assign inst_word_out[4] = (~sel & mem_inst_word[4]) | (sel & hazard_unit_inst_word[4]);
	assign inst_word_out[5] = (~sel & mem_inst_word[5]) | (sel & hazard_unit_inst_word[5]);
	assign inst_word_out[6] = (~sel & mem_inst_word[6]) | (sel & hazard_unit_inst_word[6]);
	assign inst_word_out[7] = (~sel & mem_inst_word[7]) | (sel & hazard_unit_inst_word[7]);
	assign inst_word_out[8] = (~sel & mem_inst_word[8]) | (sel & hazard_unit_inst_word[8]);
	assign inst_word_out[9] = (~sel & mem_inst_word[9]) | (sel & hazard_unit_inst_word[9]);
	assign inst_word_out[10] = (~sel & mem_inst_word[10]) | (sel & hazard_unit_inst_word[10]);
	assign inst_word_out[11] = (~sel & mem_inst_word[11]) | (sel & hazard_unit_inst_word[11]);
	assign inst_word_out[12] = (~sel & mem_inst_word[12]) | (sel & hazard_unit_inst_word[12]);
	assign inst_word_out[13] = (~sel & mem_inst_word[13]) | (sel & hazard_unit_inst_word[13]);
	assign inst_word_out[14] = (~sel & mem_inst_word[14]) | (sel & hazard_unit_inst_word[14]);
	assign inst_word_out[15] = (~sel & mem_inst_word[15]) | (sel & hazard_unit_inst_word[15]);
	assign inst_word_out[16] = (~sel & mem_inst_word[16]) | (sel & hazard_unit_inst_word[16]);
	assign inst_word_out[17] = (~sel & mem_inst_word[17]) | (sel & hazard_unit_inst_word[17]);
	assign inst_word_out[18] = (~sel & mem_inst_word[18]) | (sel & hazard_unit_inst_word[18]);
	assign inst_word_out[19] = (~sel & mem_inst_word[19]) | (sel & hazard_unit_inst_word[19]);
	assign inst_word_out[20] = (~sel & mem_inst_word[20]) | (sel & hazard_unit_inst_word[20]);
	assign inst_word_out[21] = (~sel & mem_inst_word[21]) | (sel & hazard_unit_inst_word[21]);
	assign inst_word_out[22] = (~sel & mem_inst_word[22]) | (sel & hazard_unit_inst_word[22]);
	assign inst_word_out[23] = (~sel & mem_inst_word[23]) | (sel & hazard_unit_inst_word[23]);
	assign inst_word_out[24] = (~sel & mem_inst_word[24]) | (sel & hazard_unit_inst_word[24]);
	assign inst_word_out[25] = (~sel & mem_inst_word[25]) | (sel & hazard_unit_inst_word[25]);
	assign inst_word_out[26] = (~sel & mem_inst_word[26]) | (sel & hazard_unit_inst_word[26]);
	assign inst_word_out[27] = (~sel & mem_inst_word[27]) | (sel & hazard_unit_inst_word[27]);
	assign inst_word_out[28] = (~sel & mem_inst_word[28]) | (sel & hazard_unit_inst_word[28]);
	assign inst_word_out[29] = (~sel & mem_inst_word[29]) | (sel & hazard_unit_inst_word[29]);
	assign inst_word_out[30] = (~sel & mem_inst_word[30]) | (sel & hazard_unit_inst_word[30]);
	assign inst_word_out[31] = (~sel & mem_inst_word[31]) | (sel & hazard_unit_inst_word[31]);

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
