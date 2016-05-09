# ----------------------------------------
#  Copyright (C) 2014 Jasper Design Automation, Inc. All Rights
#  Reserved.  Unpublished -- rights reserved under the copyright 
#  laws of the United States.
# ----------------------------------------

# Analyze design under verification files
set ROOT_PATH ../designs/reference_design/verilog_sva
set RTL_PATH ${ROOT_PATH}/source/design
set PROP_PATH ${ROOT_PATH}/source/properties

# Initializing the Coverage App before elaboration
check_cov -init -model {statement branch} -enable_proof_core

analyze -verilog \
  ${RTL_PATH}/arbiter.v \
  ${RTL_PATH}/port_select.v \
  ${RTL_PATH}/bridge.v \
  ${RTL_PATH}/egress.v \
  ${RTL_PATH}/ingress.v \
  ${RTL_PATH}/top.v

# Analyze property files
analyze -sva \
  ${PROP_PATH}/bindings.sva \
  ${PROP_PATH}/v_arbiter.sva \
  ${PROP_PATH}/v_bridge.sva \
  ${PROP_PATH}/v_ingress.sva \
  ${PROP_PATH}/v_egress.sva \
  ${PROP_PATH}/v_port_select.sva

# Elaborate design and properties
elaborate -top top

# Set up Clocks and Resets
clock clk
reset ~rstN

# Setup Coverage Database and assertion targets
check_cov -setup -model {branch statement} -add_assert *

# Specify coverage targets
check_cov -add_assert [assert -list -silent]

# Generate coverage items
check_cov -type task -no_prove

# Prove propertie
set_max_trace_length 10
prove -time_limit 20 -all

# Examples showing some of the available coverage reports
check_cov -report -type unreachable -task <embedded> -exclude reset 

check_cov -report -type bounded

#check_cov -report -type outcoi -task <embedded>  -exclude reset
