# =============================================================================
# constraint_top.sdc  —  Timing Constraints for ARM (5-stage pipeline)
# Target: nangate45 / generic 90nm  |  Clock: 500 MHz (2 ns period)
# =============================================================================

# -----------------------------------------------------------------------------
# CLOCK DEFINITION
# -----------------------------------------------------------------------------
create_clock -name clk -period 2.0 -waveform {0 1.0} [get_ports "clk"]

# Clock transition (10 % of period)
set_clock_transition -rise 0.1 [get_clocks "clk"]
set_clock_transition -fall 0.1 [get_clocks "clk"]

# Clock uncertainty (jitter + skew budget)
set_clock_uncertainty 0.05 [get_clocks "clk"]

# -----------------------------------------------------------------------------
# INPUT DELAYS  (assume external logic drives inputs 1 ns before clock edge)
# -----------------------------------------------------------------------------
# Synchronous inputs
set_input_delay -max 1.0 -clock [get_clocks "clk"] [get_ports "rst"]
set_input_delay -max 1.0 -clock [get_clocks "clk"] [get_ports "start_pc[*]"]

# Minimum (hold) input delays
set_input_delay -min 0.2 -clock [get_clocks "clk"] [get_ports "rst"]
set_input_delay -min 0.2 -clock [get_clocks "clk"] [get_ports "start_pc[*]"]

# -----------------------------------------------------------------------------
# OUTPUT DELAYS  (downstream logic needs data 0.5 ns before next clock edge)
# -----------------------------------------------------------------------------
# Debug register outputs (r0-r7)
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "debug_r0[*]"]
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "debug_r1[*]"]
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "debug_r2[*]"]
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "debug_r3[*]"]
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "debug_r4[*]"]
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "debug_r5[*]"]
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "debug_r6[*]"]
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "debug_r7[*]"]

# Debug PC output
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "debug_pc[*]"]

# CPSR flag outputs
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "N_flag"]
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "Z_flag"]
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "C_flag"]
set_output_delay -max 0.5 -clock [get_clocks "clk"] [get_ports "V_flag"]

# Minimum output delays
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "debug_r0[*]"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "debug_r1[*]"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "debug_r2[*]"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "debug_r3[*]"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "debug_r4[*]"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "debug_r5[*]"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "debug_r6[*]"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "debug_r7[*]"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "debug_pc[*]"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "N_flag"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "Z_flag"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "C_flag"]
set_output_delay -min 0.0 -clock [get_clocks "clk"] [get_ports "V_flag"]

# -----------------------------------------------------------------------------
# DRIVING CELL & LOAD
# -----------------------------------------------------------------------------
set_driving_cell -lib_cell BUF_X2 -pin Z [get_ports "clk"]
set_driving_cell -lib_cell BUF_X1 -pin Z [get_ports "rst"]
set_driving_cell -lib_cell BUF_X1 -pin Z [get_ports "start_pc[*]"]

set_load 0.05 [get_ports "debug_r0[*]"]
set_load 0.05 [get_ports "debug_r1[*]"]
set_load 0.05 [get_ports "debug_r2[*]"]
set_load 0.05 [get_ports "debug_r3[*]"]
set_load 0.05 [get_ports "debug_r4[*]"]
set_load 0.05 [get_ports "debug_r5[*]"]
set_load 0.05 [get_ports "debug_r6[*]"]
set_load 0.05 [get_ports "debug_r7[*]"]
set_load 0.05 [get_ports "debug_pc[*]"]
set_load 0.02 [get_ports "N_flag"]
set_load 0.02 [get_ports "Z_flag"]
set_load 0.02 [get_ports "C_flag"]
set_load 0.02 [get_ports "V_flag"]

# -----------------------------------------------------------------------------
# FALSE PATHS
# -----------------------------------------------------------------------------
# Asynchronous reset is not a timing-critical path
set_false_path -from [get_ports "rst"]

# Debug outputs are observability-only; relax their output timing
set_false_path -to [get_ports "debug_r0[*]"]
set_false_path -to [get_ports "debug_r1[*]"]
set_false_path -to [get_ports "debug_r2[*]"]
set_false_path -to [get_ports "debug_r3[*]"]
set_false_path -to [get_ports "debug_r4[*]"]
set_false_path -to [get_ports "debug_r5[*]"]
set_false_path -to [get_ports "debug_r6[*]"]
set_false_path -to [get_ports "debug_r7[*]"]
set_false_path -to [get_ports "debug_pc[*]"]

# -----------------------------------------------------------------------------
# MULTI-CYCLE PATHS
# -----------------------------------------------------------------------------
# RegisterFile writes on negedge (half-cycle write port) — flag the WB→RF path
# as a 2-cycle path so the tool doesn't try to fit it in one half-cycle.
set_multicycle_path 2 -setup \
    -from [get_cells "MEM_WB_*"] \
    -to   [get_cells "rf/RF_*"]

set_multicycle_path 1 -hold \
    -from [get_cells "MEM_WB_*"] \
    -to   [get_cells "rf/RF_*"]

# Combinational divider (purely combinational assign q = a/b) may have a long
# path; allow it 2 cycles through the EX/MEM register boundary.
set_multicycle_path 2 -setup \
    -through [get_cells "div_inst"]

set_multicycle_path 1 -hold \
    -through [get_cells "div_inst"]
