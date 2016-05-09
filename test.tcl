clock -add i_clk -initial 0
force quick_n_reset 0
run 200
init -load -current
init -show
constraint -add -pin quick_n_reset 1
assertion -add *
prove
