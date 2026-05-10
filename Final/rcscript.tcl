# =============================================================================
# rcscript.tcl  —  Cadence Genus RC Synthesis Script for ARM (5-stage pipeline)
# Tool   : Cadence Genus (formerly RC Compiler)
# Target : nangate45  (swap lib paths for your foundry PDK as needed)
# =============================================================================

# -----------------------------------------------------------------------------
# 1. LIBRARY SEARCH PATHS & LIBRARY SELECTION
# -----------------------------------------------------------------------------
set_db init_lib_search_path {
    /home/install/FOUNDRY/digital/90nm/dig/lib
}

# Use the slow (worst-case) corner for setup-critical synthesis
set_db library "slow.lib"

# -----------------------------------------------------------------------------
# 2. DESIGN NAME & SOURCE FILES
# -----------------------------------------------------------------------------
set DESIGN ARM

# Read the single-file RTL (all modules are in ARM.v)
read_hdl "${DESIGN}.v"

# -----------------------------------------------------------------------------
# 3. ELABORATE & CHECK
# -----------------------------------------------------------------------------
elaborate $DESIGN

# Flag any unresolved references before proceeding
check_design -unresolved

# -----------------------------------------------------------------------------
# 4. APPLY TIMING CONSTRAINTS
# -----------------------------------------------------------------------------
read_sdc constraint_top.sdc

# -----------------------------------------------------------------------------
# 5. SYNTHESIS EFFORT
# -----------------------------------------------------------------------------
set_db syn_generic_effort  medium
set_db syn_map_effort      medium
set_db syn_opt_effort      high     ;# push harder on opt — pipeline has tight paths

# -----------------------------------------------------------------------------
# 6. SYNTHESIS FLOW
# -----------------------------------------------------------------------------
# Generic (technology-independent) elaboration
syn_generic

# Map to target library cells
syn_map

# Post-map optimisation (timing / area trade-off)
syn_opt

# -----------------------------------------------------------------------------
# 7. OUTPUTS — NETLIST & SDC
# -----------------------------------------------------------------------------
write_hdl  > ${DESIGN}_netlist.v
write_sdc  > ${DESIGN}_sdc.sdc

# Optionally write a Verilog netlist with full path info for back-end hand-off
# write_hdl -mapped > ${DESIGN}_netlist_mapped.v

# -----------------------------------------------------------------------------
# 8. REPORTS
# -----------------------------------------------------------------------------
report_timing  > ${DESIGN}_timing.rpt
report_area    > ${DESIGN}_area.rpt
report_power   > ${DESIGN}_power.rpt
report_gates   > ${DESIGN}_gates.rpt

# Quick summary to the log
puts "\n=== Synthesis complete for $DESIGN ==="
puts "  Timing  : ${DESIGN}_timing.rpt"
puts "  Area    : ${DESIGN}_area.rpt"
puts "  Power   : ${DESIGN}_power.rpt"
puts "  Gates   : ${DESIGN}_gates.rpt"
puts "  Netlist : ${DESIGN}_netlist.v"
puts "  SDC out : ${DESIGN}_sdc.sdc\n"

# -----------------------------------------------------------------------------
# 9. GUI (optional — comment out for batch/CI runs)
# -----------------------------------------------------------------------------
gui_show
