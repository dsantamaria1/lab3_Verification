# Define clocks 
clock wb_clk_i
clock -rate wb_cyc_i  wb_clk_i
clock -rate wb_stb_i  wb_clk_i
clock -rate wb_dat_i  wb_clk_i
clock -rate wb_we_i   wb_clk_i
clock -rate wb_sel_i  wb_clk_i
clock -rate wb_adr_i  wb_clk_i

# Define reset
reset wb_rst_i -non_resettable_regs 0

# Define assumptions 
