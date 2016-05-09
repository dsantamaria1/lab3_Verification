# ----------------------------------------
#  Copyright (C) 2014 Jasper Design Automation, Inc. All Rights
#  Reserved.  Unpublished -- rights reserved under the copyright 
#  laws of the United States.
# ----------------------------------------

# Analyze design under verification files
set ROOT_PATH ../designs/reference_design/vhdl_sva
set RTL_PATH ${ROOT_PATH}/source/design
set PROP_PATH ${ROOT_PATH}/source/properties
# Initializing the Coverage App before elaboration
check_cov -init -model {statement branch} -enable_proof_core

analyze -vhdl \
  ${RTL_PATH}/arbiter.vhd \
  ${RTL_PATH}/port_select.vhd \
  ${RTL_PATH}/bridge.vhd \
  ${RTL_PATH}/egress.vhd \
  ${RTL_PATH}/ingress.vhd \
  ${RTL_PATH}/top.vhd

# Analyze property files
analyze -sva \
  ${PROP_PATH}/bindings.sva \
  ${PROP_PATH}/v_arbiter.sva \
  ${PROP_PATH}/v_bridge.sva \
  ${PROP_PATH}/v_ingress.sva \
  ${PROP_PATH}/v_egress.sva \
  ${PROP_PATH}/v_port_select.sva


# Elaborate design and properties
elaborate -vhdl -top top(rtl)

# Set up Clocks and Resets
clock clk
reset {rstN = "0"}

# Setup Coverage Database and assertion targets
check_cov -setup -model {branch statement} -add_assert *

# Specify coverage targets
check_cov -add_assert [assert -list -silent]

# Generate coverage items
check_cov -type task -no_prove

# Prove properties
set_max_trace_length 10
prove -all -time_limit 20

# Examples showing some of the available coverage reports
check_cov -report -type unreachable -task <embedded> -exclude reset

check_cov -report -type bounded

#check_cov -report -type outcoi -task <embedded>  -exclude reset
