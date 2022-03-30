TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/interrupt_controller.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/interrupt_controller.vhdl
endif

MODULE = interrupt_controller_tb
TOPLEVEL = interrupt_controller
include $(shell cocotb-config --makefiles)/Makefile.sim
