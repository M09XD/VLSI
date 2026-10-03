set_attr lib_search_path ../lib/
set_attr hdl_search_path ../rtl/
set_attr library slow.lib

read_hdl -v2001 cntr4bit.v
elaborate cntr4bit
read_sdc ../constraints/cntr4bit.g

synthesize -to_mapped -effort medium

report timing
report power

write_hdl > cntr4bit_netlist.v
write_sdc > cntr4bit.sdc
