// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Sat Apr  2 19:24:43 2022
// Host        : uberbertha running 64-bit Arch Linux
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clk_gen_stub.v
// Design      : clk_gen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(core_clk, mem_clk, ila_clk, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="core_clk,mem_clk,ila_clk,clk_in1" */;
  output core_clk;
  output mem_clk;
  output ila_clk;
  input clk_in1;
endmodule