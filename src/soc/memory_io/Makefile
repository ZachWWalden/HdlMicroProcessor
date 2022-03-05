TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/memory_io.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/memory_io.vhdl
endif

MODULE = memory_io_tb
TOPLEVEL = memory_io
include $(shell cocotb-config --makefiles)/Makefile.sim
