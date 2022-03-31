vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -mfcu -sv "+incdir+../../../../HdlMicroProcessor.gen/sources_1/ip/vga_pix_clk_gen" "+incdir+../../../../HdlMicroProcessor.gen/sources_1/ip/clk_gen" \
"/tools/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/tools/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../HdlMicroProcessor.gen/sources_1/ip/vga_pix_clk_gen" "+incdir+../../../../HdlMicroProcessor.gen/sources_1/ip/clk_gen" \
"../../../../HdlMicroProcessor.gen/sources_1/ip/clk_gen/clk_gen_clk_wiz.v" \
"../../../../HdlMicroProcessor.gen/sources_1/ip/clk_gen/clk_gen.v" \

vlog -work xil_defaultlib \
"glbl.v"

