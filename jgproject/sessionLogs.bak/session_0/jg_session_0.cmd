#----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2015.09
# platform  : Linux 2.6.32-573.12.1.el6.x86_64
# version   : 2015.09 FCS 64 bits
# build date: 2015.09.29 22:07:32 PDT
#----------------------------------------
# started Mon Mar 28 16:13:37 CDT 2016
# hostname  : wario
# pid       : 16499
# arguments : '-label' 'session_0' '-console' 'wario:49294' '-style' 'windows' '-proj' '/home/ecelrc/students/dsantamaria/Verification_EE382V/lab3/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/ecelrc/students/dsantamaria/Verification_EE382V/lab3/jgproject/.tmp/.initCmds.tcl'
include /home/ecelrc/students/dsantamaria/Verification_EE382V/lab3/wishbone_try1.tcl
prove -bg -all
visualize -violation -property <embedded>::a25_wishbone.wrp.WB_IDLE_TimeOut -new_window
