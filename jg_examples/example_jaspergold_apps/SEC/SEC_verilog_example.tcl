# ----------------------------------------
#  Copyright (C) 2014 Jasper Design Automation, Inc. All Rights
#  Reserved.  Unpublished -- rights reserved under the copyright 
#  laws of the United States.
# ----------------------------------------
clear -all

# Analyze design under verification files
set SPEC_RTL_PATH ../designs/uart_design/verilog_sva/source/design
set IMP_RTL_PATH ../designs/uart_design/verilog_sva/source/imp_design
set IMP_FIXED_RTL_PATH ../designs/uart_design/verilog_sva/source/imp_fixed_design

session -set_name SEC

check_sec -setup -spec uart_top \
            -imp uart_top \
            -spec_analyze "-sv -f ${SPEC_RTL_PATH}/sec_spec.vfile" \
            -imp_analyze  "-sv -f ${IMP_RTL_PATH}/sec_imp.vfile" \
            -spec_elaborate_opts "-x_handling -bbox_m uart_tfifo" \
            -imp_elaborate_opts "-x_handling -bbox_m uart_tfifo" \
            -setup_file SEC_setup.tcl 

# SEC App automatically generates mapping pairs and provides flexibility to
# allows users to manipulate mapping relationships explicitly.
check_sec -map -spec {wb_adr_i[4:0]} -imp {uart_top_imp.wb_address_i[4:0]}

check_sec -set_proof_settings -time_limit 30s
check_sec -gen
check_sec -prove

#See CEX in Property Table.  Debug and then fix bug.
#To see solution, uncomment the following
#source SEC_verilog_fixed.tcl
