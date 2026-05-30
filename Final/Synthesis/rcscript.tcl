set_db init_lib_search_path {/home/install/FOUNDRY/digital/90nm/dig/lib}
set_db library "slow.lib"
set DESIGN ARM
read_hdl "ARM_test.v"
elaborate $DESIGN
check_design -unresolved
read_sdc constraint_top.sdc
set_db syn_generic_effort  medium
set_db syn_map_effort      medium
set_db syn_opt_effort      high
syn_generic
syn_map
syn_opt
write_hdl -out_file ${DESIGN}_netlist.v
write_sdc -out_file ${DESIGN}_sdc.sdc
report_timing > ${DESIGN}_timing.rpt
report_area   > ${DESIGN}_area.rpt
report_power  > ${DESIGN}_power.rpt
report_gates  > ${DESIGN}_gates.rpt
gui_show
