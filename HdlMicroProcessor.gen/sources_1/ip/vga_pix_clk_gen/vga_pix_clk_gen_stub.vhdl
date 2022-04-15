-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
-- Date        : Thu Apr 14 00:39:49 2022
-- Host        : uberbertha running 64-bit Arch Linux
-- Command     : write_vhdl -force -mode synth_stub
--               /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/vga_pix_clk_gen/vga_pix_clk_gen_stub.vhdl
-- Design      : vga_pix_clk_gen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s50csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga_pix_clk_gen is
  Port ( 
    vga_clk : out STD_LOGIC;
    vga_mem_clk : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end vga_pix_clk_gen;

architecture stub of vga_pix_clk_gen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "vga_clk,vga_mem_clk,clk_in1";
begin
end;
