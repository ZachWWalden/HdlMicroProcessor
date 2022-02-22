TOPLEVEL_LANG ?= verilog

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/register_byte.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/register_byte.vhdl
endif

MODULE = register_byte_tb
TOPLEVEL = register_byte

include $(shell cocotb-config --makefiles)/Makefile.sim
