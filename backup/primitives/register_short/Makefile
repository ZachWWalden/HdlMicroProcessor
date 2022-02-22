TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/register_short.v /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.srcs/sim/primitives/register_byte/register_byte.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/register_short.vhdl
endif

MODULE = register_short_tb
TOPLEVEL = register_short
include $(shell cocotb-config --makefiles)/Makefile.sim
