TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/sfr_file.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/sfr_file.vhdl
endif

MODULE = sfr_file_tb
TOPLEVEL = sfr_file
include $(shell cocotb-config --makefiles)/Makefile.sim
