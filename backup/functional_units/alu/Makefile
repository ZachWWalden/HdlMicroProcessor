TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/alu.v $(shell pwd)/adder.v $(shell pwd)/multiplier.v $(shell pwd)/bit_shifter.v $(shell pwd)/bitwise_logic_unit.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/alu.vhdl
endif

MODULE = alu_tb
TOPLEVEL = alu

include $(shell cocotb-config --makefiles)/Makefile.sim
