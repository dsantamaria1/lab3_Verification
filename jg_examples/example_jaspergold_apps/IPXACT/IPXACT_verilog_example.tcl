# Customizable parameter for this demo
set setup_file "[get_proj_dir]/generated_setup.tcl"

# RTL location
set rtl_dir "../designs/ipxact_design"

# User-provided analyze options: provided through tcl or
# via hand-modifiation of the generated setup file
set analyze_options " +incdir+include +incdir+${rtl_dir}"

# User-provided elaboration options: provided through tcl or
# via hand-modifiation of the generated setup file
set elaborate_options " -bbox_m ram_wb_b3"

# Demo setup
set demo_dir [pwd]

# Load the IP-XACT Definition
ipxact -load ipxact/top.xml -lib_dir ipxact -rtl_dir $rtl_dir

# Generate Jaspergold Setup from the IP-XACT definition
ipxact -generate_setup_script -design orpsoc_top -file $setup_file -force -elaborate_opts $elaborate_options

# The Jaspergold CSR bind file is not part of the IP-XACT defintion, so we analyze it separately
analyze -sv jasper_bind_csr.sv

# The following line makes it possible to run this demo from a different directory
cd $rtl_dir

# Run the Jaspergold Setup
include $setup_file

# Now we can validate the IP-XACT Definition
# For this version of the material, it detected that IPXACT mentioned instance wb
# but the RTL does not instantiated this instance.
ipxact -validate orpsoc_top -top

# The IP-XACT Definition can also be used to setup the Jaspergold Connectivity App
ipxact -generate_connectivity_map [get_proj_dir]/conn.csv orpsoc_top
check_conn -load [get_proj_dir]/conn.csv

# The IP-XACT Definition can be read directly into the Connectivity App
#check_conn -load_ipxact orpsoc_top

# The IP-XACT Definition can also be used to setup the Jaspergold CSR App
ipxact -generate_csr_map [get_proj_dir]/csr.csv -component or1200_top -instance or1200_top0.jasper_csr_checker0
check_csr -load [get_proj_dir]/csr.csv -instance or1200_top0.jasper_csr_checker0

# The IP-XACT Definition can be read directly into the CSR App.  See commented line below for example.
#check_csr -load_ipxact -component or1200_top -load_to_instance or1200_top0.jasper_csr_checker0

# Auto-detection of clocks and resets
clock -analyze
reset -analyze

# Set up clock and reset
clock clk_pad_i
reset ~rst_n_pad_i 

# Run proofs on properties from various apps
check_conn -prove
check_csr -prove
prove -all
