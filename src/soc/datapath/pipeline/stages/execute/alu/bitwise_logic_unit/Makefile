TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/bitwise_logic_unit.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/bitwise_logic_unit.vhdl
endif

MODULE = bitwise_logic_unit_tb
TOPLEVEL = bitwise_logic_unit

include $(shell cocotb-config --makefiles)/Makefile.sim
