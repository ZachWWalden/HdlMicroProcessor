// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Sun Apr 17 00:21:45 2022
// Host        : uberbertha running 64-bit Arch Linux
// Command     : write_verilog -force -mode synth_stub
//               /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/clk_gen/clk_gen_stub.v
// Design      : clk_gen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_gen(core_clk, mem_clk, ila_clk, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="core_clk,mem_clk,ila_clk,clk_in1" */;
  output core_clk;
  output mem_clk;
  output ila_clk;
  input clk_in1;
endmodule
