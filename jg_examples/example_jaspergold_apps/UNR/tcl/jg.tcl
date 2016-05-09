check_unr -setup 

clock -none
reset -none

check_unr -prove -sil 
check_unr -list -type unreachable
check_unr -covgen -force

report -summary

exit 







