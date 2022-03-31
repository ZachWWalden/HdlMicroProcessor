vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../HdlMicroProcessor.gen/sources_1/ip/vga_pix_clk_gen" "+incdir+../../../../HdlMicroProcessor.gen/sources_1/ip/clk_gen" \
"/tools/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/tools/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../HdlMicroProcessor.gen/sources_1/ip/vga_pix_clk_gen" "+incdir+../../../../HdlMicroProcessor.gen/sources_1/ip/clk_gen" \
"../../../../HdlMicroProcessor.gen/sources_1/ip/clk_gen/clk_gen_clk_wiz.v" \
"../../../../HdlMicroProcessor.gen/sources_1/ip/clk_gen/clk_gen.v" \

vlog -work xil_defaultlib \
"glbl.v"

