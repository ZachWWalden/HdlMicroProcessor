// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Sun Jan 16 14:21:18 2022
// Host        : uberbertha running 64-bit Arch Linux
// Command     : write_verilog -force -mode synth_stub
//               /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/call_stack/call_stack_stub.v
// Design      : call_stack
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *)
module call_stack(clka, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[7:0],dina[13:0],douta[13:0]" */;
  input clka;
  input [0:0]wea;
  input [7:0]addra;
  input [13:0]dina;
  output [13:0]douta;
endmodule
