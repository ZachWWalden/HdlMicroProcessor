TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/vert_cntr.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/vert_cntr.vhdl
endif

MODULE = vert_cntr_tb
TOPLEVEL = vert_cntr
include $(shell cocotb-config --makefiles)/Makefile.sim
