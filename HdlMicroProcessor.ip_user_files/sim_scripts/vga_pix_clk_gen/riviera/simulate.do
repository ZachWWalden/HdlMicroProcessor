onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+vga_pix_clk_gen -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.vga_pix_clk_gen xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {vga_pix_clk_gen.udo}

run -all

endsim

quit -force
