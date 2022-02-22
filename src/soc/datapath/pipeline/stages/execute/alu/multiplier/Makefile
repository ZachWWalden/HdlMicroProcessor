TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/multiplier.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/multiplier.vhdl
endif

MODULE = multiplier_tb
TOPLEVEL = multiplier

include $(shell cocotb-config --makefiles)/Makefile.sim
