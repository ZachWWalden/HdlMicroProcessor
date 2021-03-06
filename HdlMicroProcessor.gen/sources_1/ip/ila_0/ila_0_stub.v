// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Tue Apr 19 22:58:53 2022
// Host        : uberbertha running 64-bit Arch Linux
// Command     : write_verilog -force -mode synth_stub
//               /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2021.1" *)
module ila_0(clk, trig_in, trig_in_ack, probe0, probe1, probe2, 
  probe3, probe4, probe5, probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14)
/* synthesis syn_black_box black_box_pad_pin="clk,trig_in,trig_in_ack,probe0[13:0],probe1[31:0],probe2[0:0],probe3[0:0],probe4[0:0],probe5[0:0],probe6[0:0],probe7[15:0],probe8[11:0],probe9[7:0],probe10[15:0],probe11[1:0],probe12[7:0],probe13[0:0],probe14[0:0]" */;
  input clk;
  input trig_in;
  output trig_in_ack;
  input [13:0]probe0;
  input [31:0]probe1;
  input [0:0]probe2;
  input [0:0]probe3;
  input [0:0]probe4;
  input [0:0]probe5;
  input [0:0]probe6;
  input [15:0]probe7;
  input [11:0]probe8;
  input [7:0]probe9;
  input [15:0]probe10;
  input [1:0]probe11;
  input [7:0]probe12;
  input [0:0]probe13;
  input [0:0]probe14;
endmodule
