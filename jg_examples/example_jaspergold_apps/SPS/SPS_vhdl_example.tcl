# ----------------------------------------
# Copyright (C) 2014 Jasper Design Automation, Inc. All Rights Reserved.
# Unpublished -- rights reserved under the copyright laws of the United States.
# ----------------------------------------

# Initialize check_sps App
check_sps -init

# Read in HDL files
set RTL_PATH ../designs/reference_design/vhdl_sva/source/design

analyze -clear
analyze -vhdl \
  ${RTL_PATH}/arbiter.vhd \
  ${RTL_PATH}/port_select.vhd \
  ${RTL_PATH}/bridge.vhd \
  ${RTL_PATH}/egress.vhd \
  ${RTL_PATH}/ingress.vhd \
  ${RTL_PATH}/top.vhd


# Elaborate design 
elaborate -vhdl -top top(rtl) -bbox_a 1024

# Setup clocks and reset
clock clk
reset {rstN = 0}

# Extract RTL Points of Interest (POIs) for static checks
check_sps -extract

# prove extracted properties (using FPV app)
check_sps -export -class unclassified 
set_max_trace_length 50
autoprove -task {<SPS_*}
