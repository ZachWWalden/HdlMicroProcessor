onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib call_stack_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {call_stack.udo}

run -all

quit -force
