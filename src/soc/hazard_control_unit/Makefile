TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/hazard_control_unit.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/hazard_control_unit.vhdl
endif

MODULE = hazard_control_unit_tb
TOPLEVEL = hazard_control_unit
include $(shell cocotb-config --makefiles)/Makefile.sim
