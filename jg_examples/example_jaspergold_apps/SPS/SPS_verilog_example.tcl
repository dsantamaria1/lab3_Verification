# ----------------------------------------
# Copyright (C) 2014 Jasper Design Automation, Inc. All Rights Reserved.
# Unpublished -- rights reserved under the copyright laws of the United States.
# ----------------------------------------

# Initialize check_sps App
check_sps -init

# Read in HDL files
set RTL_PATH ../designs/reference_design/verilog_sva/source/design

analyze -clear
analyze -verilog ${RTL_PATH}/arbiter.v
analyze -verilog ${RTL_PATH}/bridge.v
analyze -verilog ${RTL_PATH}/egress.v
analyze -verilog ${RTL_PATH}/ingress.v
analyze -verilog ${RTL_PATH}/port_select.v
analyze -verilog ${RTL_PATH}/top.v

# Elaborate design 
elaborate -bbox_a 1024

# Setup clocks and reset
clock clk
reset {rstN == 1'b0}

# Extract RTL Points of Interest (POIs) for static checks
check_sps -extract

# prove extracted properties (using FPV app)
check_sps -export -class unclassified 
set_max_trace_length 50
autoprove -task {<SPS_*}
