# ==============================================================================
# Fixed Synthesis Script for Adder_32bit_8_stage
# ==============================================================================

# Use clear braces to prevent path strings from splintering into "Too many arguments"
set_attribute lib_search_path {../lib/} /
set_attribute hdl_search_path {../rtl/} /
set_attribute library {slow.lib} /

read_hdl -v2001 {Adder_32bit_8_stage.v}
elaborate Adder_32bit_8_stage

# Ensure your constraints folder name doesn't contain spaces
read_sdc {../constraints/Adder_32bit_8_stage.g}

synthesize -to_mapped -effort medium

# Generate structural logs safely
report timing > Adder_32bit_8_stage_timing.rpt
report power  > Adder_32bit_8_stage_power.rpt

# Write outputs
write_hdl > Adder_32bit_8_stage_netlist.v
write_sdc > Adder_32bit_8_stage.sdc

# CRITICAL: This prevents the tool from hanging in interactive mode
puts "SUCCESS: Synthesis completed successfully!"
exit

