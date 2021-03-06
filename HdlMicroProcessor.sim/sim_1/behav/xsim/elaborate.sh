#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2021.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Sat Jan 22 14:49:40 CST 2022
# SW Build 3247384 on Thu Jun 10 19:36:07 MDT 2021
#
# IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto 29c1887fbb8c4e1c8fb9b39c2e5e3c8d --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot register_byte_testbench_behav xil_defaultlib.register_byte_testbench xil_defaultlib.glbl -log elaborate.log"
xelab -wto 29c1887fbb8c4e1c8fb9b39c2e5e3c8d --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot register_byte_testbench_behav xil_defaultlib.register_byte_testbench xil_defaultlib.glbl -log elaborate.log

