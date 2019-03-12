#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2018.2.2 (64-bit)
#
# Filename    : compile.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for compiling the simulation design source files
#
# Generated by Vivado on Tue Mar 12 18:24:42 -03 2019
# SW Build 2348494 on Mon Oct  1 18:25:39 MDT 2018
#
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
#
# usage: compile.sh
#
# ****************************************************************************
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
echo "xvlog --incr --relax -prj rx_control_ic_vlog.prj"
ExecStep xvlog --incr --relax -prj rx_control_ic_vlog.prj 2>&1 | tee compile.log
