# ============================================================
# ARM CPU — OpenROAD Place & Route Script
# Platform : NanGate45
# ============================================================

# ============================================================
# TECH + LIBRARY
# ============================================================
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

# ============================================================
# DESIGN
# ============================================================
read_verilog ARM_mapped.v
link_design ARM

# ============================================================
# TIMING CONSTRAINTS
# ============================================================
create_clock -name clk -period 10 [get_ports clk]
set_input_delay  -clock clk -max 2.0 [all_inputs]
set_output_delay -clock clk -max 2.0 [all_outputs]

# Wire RC model — required for repair_timing
set_wire_rc -clock  -resistance 1.3e-4 -capacitance 2.0e-4
set_wire_rc -signal -resistance 1.3e-4 -capacitance 2.0e-4

# ============================================================
# FLOORPLAN
# ============================================================
initialize_floorplan \
    -die_area  "0 0 250 250" \
    -core_area "10 10 240 240" \
    -site FreePDK45_38x28_10R_NP_162NW_34O

# ============================================================
# IO PLACEMENT
# ============================================================
make_tracks
place_pins \
    -hor_layers metal3 \
    -ver_layers metal2

# ============================================================
# POWER PLANNING
# ============================================================
add_global_connection -net VDD -pin_pattern "^VDD$" -power
add_global_connection -net VSS -pin_pattern "^VSS$" -ground
global_connect

pdngen

# ============================================================
# GLOBAL PLACEMENT
# ============================================================
global_placement -density 0.6

# ============================================================
# DETAILED PLACEMENT
# ============================================================
detailed_placement
check_placement -verbose

# ============================================================
# CTS
# ============================================================
clock_tree_synthesis
repair_timing

# ============================================================
# GLOBAL ROUTING
# ============================================================
global_route \
    -guide_file route.guide \
    -verbose

# ============================================================
# DETAILED ROUTING
# ============================================================
detailed_route \
    -output_drc drc.rpt \
    -verbose 1

# ============================================================
# REPORTS
# ============================================================
report_design_area
report_tns
report_wns
report_worst_slack -max
report_clock_skew

# ============================================================
# WRITE OUTPUTS
# ============================================================
write_def ARM_final.def
write_verilog ARM_final.v
