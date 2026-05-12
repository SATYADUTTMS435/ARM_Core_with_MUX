# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Mon May 11 13:06:15 IST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design ARM

create_clock -name "clk" -period 2.0 -waveform {0.0 1.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_load -pin_load 0.05 [get_ports {debug_r0[31]}]
set_load -pin_load 0.05 [get_ports {debug_r0[30]}]
set_load -pin_load 0.05 [get_ports {debug_r0[29]}]
set_load -pin_load 0.05 [get_ports {debug_r0[28]}]
set_load -pin_load 0.05 [get_ports {debug_r0[27]}]
set_load -pin_load 0.05 [get_ports {debug_r0[26]}]
set_load -pin_load 0.05 [get_ports {debug_r0[25]}]
set_load -pin_load 0.05 [get_ports {debug_r0[24]}]
set_load -pin_load 0.05 [get_ports {debug_r0[23]}]
set_load -pin_load 0.05 [get_ports {debug_r0[22]}]
set_load -pin_load 0.05 [get_ports {debug_r0[21]}]
set_load -pin_load 0.05 [get_ports {debug_r0[20]}]
set_load -pin_load 0.05 [get_ports {debug_r0[19]}]
set_load -pin_load 0.05 [get_ports {debug_r0[18]}]
set_load -pin_load 0.05 [get_ports {debug_r0[17]}]
set_load -pin_load 0.05 [get_ports {debug_r0[16]}]
set_load -pin_load 0.05 [get_ports {debug_r0[15]}]
set_load -pin_load 0.05 [get_ports {debug_r0[14]}]
set_load -pin_load 0.05 [get_ports {debug_r0[13]}]
set_load -pin_load 0.05 [get_ports {debug_r0[12]}]
set_load -pin_load 0.05 [get_ports {debug_r0[11]}]
set_load -pin_load 0.05 [get_ports {debug_r0[10]}]
set_load -pin_load 0.05 [get_ports {debug_r0[9]}]
set_load -pin_load 0.05 [get_ports {debug_r0[8]}]
set_load -pin_load 0.05 [get_ports {debug_r0[7]}]
set_load -pin_load 0.05 [get_ports {debug_r0[6]}]
set_load -pin_load 0.05 [get_ports {debug_r0[5]}]
set_load -pin_load 0.05 [get_ports {debug_r0[4]}]
set_load -pin_load 0.05 [get_ports {debug_r0[3]}]
set_load -pin_load 0.05 [get_ports {debug_r0[2]}]
set_load -pin_load 0.05 [get_ports {debug_r0[1]}]
set_load -pin_load 0.05 [get_ports {debug_r0[0]}]
set_load -pin_load 0.05 [get_ports {debug_r1[31]}]
set_load -pin_load 0.05 [get_ports {debug_r1[30]}]
set_load -pin_load 0.05 [get_ports {debug_r1[29]}]
set_load -pin_load 0.05 [get_ports {debug_r1[28]}]
set_load -pin_load 0.05 [get_ports {debug_r1[27]}]
set_load -pin_load 0.05 [get_ports {debug_r1[26]}]
set_load -pin_load 0.05 [get_ports {debug_r1[25]}]
set_load -pin_load 0.05 [get_ports {debug_r1[24]}]
set_load -pin_load 0.05 [get_ports {debug_r1[23]}]
set_load -pin_load 0.05 [get_ports {debug_r1[22]}]
set_load -pin_load 0.05 [get_ports {debug_r1[21]}]
set_load -pin_load 0.05 [get_ports {debug_r1[20]}]
set_load -pin_load 0.05 [get_ports {debug_r1[19]}]
set_load -pin_load 0.05 [get_ports {debug_r1[18]}]
set_load -pin_load 0.05 [get_ports {debug_r1[17]}]
set_load -pin_load 0.05 [get_ports {debug_r1[16]}]
set_load -pin_load 0.05 [get_ports {debug_r1[15]}]
set_load -pin_load 0.05 [get_ports {debug_r1[14]}]
set_load -pin_load 0.05 [get_ports {debug_r1[13]}]
set_load -pin_load 0.05 [get_ports {debug_r1[12]}]
set_load -pin_load 0.05 [get_ports {debug_r1[11]}]
set_load -pin_load 0.05 [get_ports {debug_r1[10]}]
set_load -pin_load 0.05 [get_ports {debug_r1[9]}]
set_load -pin_load 0.05 [get_ports {debug_r1[8]}]
set_load -pin_load 0.05 [get_ports {debug_r1[7]}]
set_load -pin_load 0.05 [get_ports {debug_r1[6]}]
set_load -pin_load 0.05 [get_ports {debug_r1[5]}]
set_load -pin_load 0.05 [get_ports {debug_r1[4]}]
set_load -pin_load 0.05 [get_ports {debug_r1[3]}]
set_load -pin_load 0.05 [get_ports {debug_r1[2]}]
set_load -pin_load 0.05 [get_ports {debug_r1[1]}]
set_load -pin_load 0.05 [get_ports {debug_r1[0]}]
set_load -pin_load 0.05 [get_ports {debug_r2[31]}]
set_load -pin_load 0.05 [get_ports {debug_r2[30]}]
set_load -pin_load 0.05 [get_ports {debug_r2[29]}]
set_load -pin_load 0.05 [get_ports {debug_r2[28]}]
set_load -pin_load 0.05 [get_ports {debug_r2[27]}]
set_load -pin_load 0.05 [get_ports {debug_r2[26]}]
set_load -pin_load 0.05 [get_ports {debug_r2[25]}]
set_load -pin_load 0.05 [get_ports {debug_r2[24]}]
set_load -pin_load 0.05 [get_ports {debug_r2[23]}]
set_load -pin_load 0.05 [get_ports {debug_r2[22]}]
set_load -pin_load 0.05 [get_ports {debug_r2[21]}]
set_load -pin_load 0.05 [get_ports {debug_r2[20]}]
set_load -pin_load 0.05 [get_ports {debug_r2[19]}]
set_load -pin_load 0.05 [get_ports {debug_r2[18]}]
set_load -pin_load 0.05 [get_ports {debug_r2[17]}]
set_load -pin_load 0.05 [get_ports {debug_r2[16]}]
set_load -pin_load 0.05 [get_ports {debug_r2[15]}]
set_load -pin_load 0.05 [get_ports {debug_r2[14]}]
set_load -pin_load 0.05 [get_ports {debug_r2[13]}]
set_load -pin_load 0.05 [get_ports {debug_r2[12]}]
set_load -pin_load 0.05 [get_ports {debug_r2[11]}]
set_load -pin_load 0.05 [get_ports {debug_r2[10]}]
set_load -pin_load 0.05 [get_ports {debug_r2[9]}]
set_load -pin_load 0.05 [get_ports {debug_r2[8]}]
set_load -pin_load 0.05 [get_ports {debug_r2[7]}]
set_load -pin_load 0.05 [get_ports {debug_r2[6]}]
set_load -pin_load 0.05 [get_ports {debug_r2[5]}]
set_load -pin_load 0.05 [get_ports {debug_r2[4]}]
set_load -pin_load 0.05 [get_ports {debug_r2[3]}]
set_load -pin_load 0.05 [get_ports {debug_r2[2]}]
set_load -pin_load 0.05 [get_ports {debug_r2[1]}]
set_load -pin_load 0.05 [get_ports {debug_r2[0]}]
set_load -pin_load 0.05 [get_ports {debug_r3[31]}]
set_load -pin_load 0.05 [get_ports {debug_r3[30]}]
set_load -pin_load 0.05 [get_ports {debug_r3[29]}]
set_load -pin_load 0.05 [get_ports {debug_r3[28]}]
set_load -pin_load 0.05 [get_ports {debug_r3[27]}]
set_load -pin_load 0.05 [get_ports {debug_r3[26]}]
set_load -pin_load 0.05 [get_ports {debug_r3[25]}]
set_load -pin_load 0.05 [get_ports {debug_r3[24]}]
set_load -pin_load 0.05 [get_ports {debug_r3[23]}]
set_load -pin_load 0.05 [get_ports {debug_r3[22]}]
set_load -pin_load 0.05 [get_ports {debug_r3[21]}]
set_load -pin_load 0.05 [get_ports {debug_r3[20]}]
set_load -pin_load 0.05 [get_ports {debug_r3[19]}]
set_load -pin_load 0.05 [get_ports {debug_r3[18]}]
set_load -pin_load 0.05 [get_ports {debug_r3[17]}]
set_load -pin_load 0.05 [get_ports {debug_r3[16]}]
set_load -pin_load 0.05 [get_ports {debug_r3[15]}]
set_load -pin_load 0.05 [get_ports {debug_r3[14]}]
set_load -pin_load 0.05 [get_ports {debug_r3[13]}]
set_load -pin_load 0.05 [get_ports {debug_r3[12]}]
set_load -pin_load 0.05 [get_ports {debug_r3[11]}]
set_load -pin_load 0.05 [get_ports {debug_r3[10]}]
set_load -pin_load 0.05 [get_ports {debug_r3[9]}]
set_load -pin_load 0.05 [get_ports {debug_r3[8]}]
set_load -pin_load 0.05 [get_ports {debug_r3[7]}]
set_load -pin_load 0.05 [get_ports {debug_r3[6]}]
set_load -pin_load 0.05 [get_ports {debug_r3[5]}]
set_load -pin_load 0.05 [get_ports {debug_r3[4]}]
set_load -pin_load 0.05 [get_ports {debug_r3[3]}]
set_load -pin_load 0.05 [get_ports {debug_r3[2]}]
set_load -pin_load 0.05 [get_ports {debug_r3[1]}]
set_load -pin_load 0.05 [get_ports {debug_r3[0]}]
set_load -pin_load 0.05 [get_ports {debug_r4[31]}]
set_load -pin_load 0.05 [get_ports {debug_r4[30]}]
set_load -pin_load 0.05 [get_ports {debug_r4[29]}]
set_load -pin_load 0.05 [get_ports {debug_r4[28]}]
set_load -pin_load 0.05 [get_ports {debug_r4[27]}]
set_load -pin_load 0.05 [get_ports {debug_r4[26]}]
set_load -pin_load 0.05 [get_ports {debug_r4[25]}]
set_load -pin_load 0.05 [get_ports {debug_r4[24]}]
set_load -pin_load 0.05 [get_ports {debug_r4[23]}]
set_load -pin_load 0.05 [get_ports {debug_r4[22]}]
set_load -pin_load 0.05 [get_ports {debug_r4[21]}]
set_load -pin_load 0.05 [get_ports {debug_r4[20]}]
set_load -pin_load 0.05 [get_ports {debug_r4[19]}]
set_load -pin_load 0.05 [get_ports {debug_r4[18]}]
set_load -pin_load 0.05 [get_ports {debug_r4[17]}]
set_load -pin_load 0.05 [get_ports {debug_r4[16]}]
set_load -pin_load 0.05 [get_ports {debug_r4[15]}]
set_load -pin_load 0.05 [get_ports {debug_r4[14]}]
set_load -pin_load 0.05 [get_ports {debug_r4[13]}]
set_load -pin_load 0.05 [get_ports {debug_r4[12]}]
set_load -pin_load 0.05 [get_ports {debug_r4[11]}]
set_load -pin_load 0.05 [get_ports {debug_r4[10]}]
set_load -pin_load 0.05 [get_ports {debug_r4[9]}]
set_load -pin_load 0.05 [get_ports {debug_r4[8]}]
set_load -pin_load 0.05 [get_ports {debug_r4[7]}]
set_load -pin_load 0.05 [get_ports {debug_r4[6]}]
set_load -pin_load 0.05 [get_ports {debug_r4[5]}]
set_load -pin_load 0.05 [get_ports {debug_r4[4]}]
set_load -pin_load 0.05 [get_ports {debug_r4[3]}]
set_load -pin_load 0.05 [get_ports {debug_r4[2]}]
set_load -pin_load 0.05 [get_ports {debug_r4[1]}]
set_load -pin_load 0.05 [get_ports {debug_r4[0]}]
set_load -pin_load 0.05 [get_ports {debug_r5[31]}]
set_load -pin_load 0.05 [get_ports {debug_r5[30]}]
set_load -pin_load 0.05 [get_ports {debug_r5[29]}]
set_load -pin_load 0.05 [get_ports {debug_r5[28]}]
set_load -pin_load 0.05 [get_ports {debug_r5[27]}]
set_load -pin_load 0.05 [get_ports {debug_r5[26]}]
set_load -pin_load 0.05 [get_ports {debug_r5[25]}]
set_load -pin_load 0.05 [get_ports {debug_r5[24]}]
set_load -pin_load 0.05 [get_ports {debug_r5[23]}]
set_load -pin_load 0.05 [get_ports {debug_r5[22]}]
set_load -pin_load 0.05 [get_ports {debug_r5[21]}]
set_load -pin_load 0.05 [get_ports {debug_r5[20]}]
set_load -pin_load 0.05 [get_ports {debug_r5[19]}]
set_load -pin_load 0.05 [get_ports {debug_r5[18]}]
set_load -pin_load 0.05 [get_ports {debug_r5[17]}]
set_load -pin_load 0.05 [get_ports {debug_r5[16]}]
set_load -pin_load 0.05 [get_ports {debug_r5[15]}]
set_load -pin_load 0.05 [get_ports {debug_r5[14]}]
set_load -pin_load 0.05 [get_ports {debug_r5[13]}]
set_load -pin_load 0.05 [get_ports {debug_r5[12]}]
set_load -pin_load 0.05 [get_ports {debug_r5[11]}]
set_load -pin_load 0.05 [get_ports {debug_r5[10]}]
set_load -pin_load 0.05 [get_ports {debug_r5[9]}]
set_load -pin_load 0.05 [get_ports {debug_r5[8]}]
set_load -pin_load 0.05 [get_ports {debug_r5[7]}]
set_load -pin_load 0.05 [get_ports {debug_r5[6]}]
set_load -pin_load 0.05 [get_ports {debug_r5[5]}]
set_load -pin_load 0.05 [get_ports {debug_r5[4]}]
set_load -pin_load 0.05 [get_ports {debug_r5[3]}]
set_load -pin_load 0.05 [get_ports {debug_r5[2]}]
set_load -pin_load 0.05 [get_ports {debug_r5[1]}]
set_load -pin_load 0.05 [get_ports {debug_r5[0]}]
set_load -pin_load 0.05 [get_ports {debug_r6[31]}]
set_load -pin_load 0.05 [get_ports {debug_r6[30]}]
set_load -pin_load 0.05 [get_ports {debug_r6[29]}]
set_load -pin_load 0.05 [get_ports {debug_r6[28]}]
set_load -pin_load 0.05 [get_ports {debug_r6[27]}]
set_load -pin_load 0.05 [get_ports {debug_r6[26]}]
set_load -pin_load 0.05 [get_ports {debug_r6[25]}]
set_load -pin_load 0.05 [get_ports {debug_r6[24]}]
set_load -pin_load 0.05 [get_ports {debug_r6[23]}]
set_load -pin_load 0.05 [get_ports {debug_r6[22]}]
set_load -pin_load 0.05 [get_ports {debug_r6[21]}]
set_load -pin_load 0.05 [get_ports {debug_r6[20]}]
set_load -pin_load 0.05 [get_ports {debug_r6[19]}]
set_load -pin_load 0.05 [get_ports {debug_r6[18]}]
set_load -pin_load 0.05 [get_ports {debug_r6[17]}]
set_load -pin_load 0.05 [get_ports {debug_r6[16]}]
set_load -pin_load 0.05 [get_ports {debug_r6[15]}]
set_load -pin_load 0.05 [get_ports {debug_r6[14]}]
set_load -pin_load 0.05 [get_ports {debug_r6[13]}]
set_load -pin_load 0.05 [get_ports {debug_r6[12]}]
set_load -pin_load 0.05 [get_ports {debug_r6[11]}]
set_load -pin_load 0.05 [get_ports {debug_r6[10]}]
set_load -pin_load 0.05 [get_ports {debug_r6[9]}]
set_load -pin_load 0.05 [get_ports {debug_r6[8]}]
set_load -pin_load 0.05 [get_ports {debug_r6[7]}]
set_load -pin_load 0.05 [get_ports {debug_r6[6]}]
set_load -pin_load 0.05 [get_ports {debug_r6[5]}]
set_load -pin_load 0.05 [get_ports {debug_r6[4]}]
set_load -pin_load 0.05 [get_ports {debug_r6[3]}]
set_load -pin_load 0.05 [get_ports {debug_r6[2]}]
set_load -pin_load 0.05 [get_ports {debug_r6[1]}]
set_load -pin_load 0.05 [get_ports {debug_r6[0]}]
set_load -pin_load 0.05 [get_ports {debug_r7[31]}]
set_load -pin_load 0.05 [get_ports {debug_r7[30]}]
set_load -pin_load 0.05 [get_ports {debug_r7[29]}]
set_load -pin_load 0.05 [get_ports {debug_r7[28]}]
set_load -pin_load 0.05 [get_ports {debug_r7[27]}]
set_load -pin_load 0.05 [get_ports {debug_r7[26]}]
set_load -pin_load 0.05 [get_ports {debug_r7[25]}]
set_load -pin_load 0.05 [get_ports {debug_r7[24]}]
set_load -pin_load 0.05 [get_ports {debug_r7[23]}]
set_load -pin_load 0.05 [get_ports {debug_r7[22]}]
set_load -pin_load 0.05 [get_ports {debug_r7[21]}]
set_load -pin_load 0.05 [get_ports {debug_r7[20]}]
set_load -pin_load 0.05 [get_ports {debug_r7[19]}]
set_load -pin_load 0.05 [get_ports {debug_r7[18]}]
set_load -pin_load 0.05 [get_ports {debug_r7[17]}]
set_load -pin_load 0.05 [get_ports {debug_r7[16]}]
set_load -pin_load 0.05 [get_ports {debug_r7[15]}]
set_load -pin_load 0.05 [get_ports {debug_r7[14]}]
set_load -pin_load 0.05 [get_ports {debug_r7[13]}]
set_load -pin_load 0.05 [get_ports {debug_r7[12]}]
set_load -pin_load 0.05 [get_ports {debug_r7[11]}]
set_load -pin_load 0.05 [get_ports {debug_r7[10]}]
set_load -pin_load 0.05 [get_ports {debug_r7[9]}]
set_load -pin_load 0.05 [get_ports {debug_r7[8]}]
set_load -pin_load 0.05 [get_ports {debug_r7[7]}]
set_load -pin_load 0.05 [get_ports {debug_r7[6]}]
set_load -pin_load 0.05 [get_ports {debug_r7[5]}]
set_load -pin_load 0.05 [get_ports {debug_r7[4]}]
set_load -pin_load 0.05 [get_ports {debug_r7[3]}]
set_load -pin_load 0.05 [get_ports {debug_r7[2]}]
set_load -pin_load 0.05 [get_ports {debug_r7[1]}]
set_load -pin_load 0.05 [get_ports {debug_r7[0]}]
set_load -pin_load 0.05 [get_ports {debug_pc[7]}]
set_load -pin_load 0.05 [get_ports {debug_pc[6]}]
set_load -pin_load 0.05 [get_ports {debug_pc[5]}]
set_load -pin_load 0.05 [get_ports {debug_pc[4]}]
set_load -pin_load 0.05 [get_ports {debug_pc[3]}]
set_load -pin_load 0.05 [get_ports {debug_pc[2]}]
set_load -pin_load 0.05 [get_ports {debug_pc[1]}]
set_load -pin_load 0.05 [get_ports {debug_pc[0]}]
set_load -pin_load 0.02 [get_ports N_flag]
set_load -pin_load 0.02 [get_ports Z_flag]
set_load -pin_load 0.02 [get_ports C_flag]
set_load -pin_load 0.02 [get_ports V_flag]
set_false_path -from [get_ports rst]
set_false_path -to [list \
  [get_ports {debug_r0[0]}]  \
  [get_ports {debug_r0[1]}]  \
  [get_ports {debug_r0[2]}]  \
  [get_ports {debug_r0[3]}]  \
  [get_ports {debug_r0[4]}]  \
  [get_ports {debug_r0[5]}]  \
  [get_ports {debug_r0[6]}]  \
  [get_ports {debug_r0[7]}]  \
  [get_ports {debug_r0[8]}]  \
  [get_ports {debug_r0[9]}]  \
  [get_ports {debug_r0[10]}]  \
  [get_ports {debug_r0[11]}]  \
  [get_ports {debug_r0[12]}]  \
  [get_ports {debug_r0[13]}]  \
  [get_ports {debug_r0[14]}]  \
  [get_ports {debug_r0[15]}]  \
  [get_ports {debug_r0[16]}]  \
  [get_ports {debug_r0[17]}]  \
  [get_ports {debug_r0[18]}]  \
  [get_ports {debug_r0[19]}]  \
  [get_ports {debug_r0[20]}]  \
  [get_ports {debug_r0[21]}]  \
  [get_ports {debug_r0[22]}]  \
  [get_ports {debug_r0[23]}]  \
  [get_ports {debug_r0[24]}]  \
  [get_ports {debug_r0[25]}]  \
  [get_ports {debug_r0[26]}]  \
  [get_ports {debug_r0[27]}]  \
  [get_ports {debug_r0[28]}]  \
  [get_ports {debug_r0[29]}]  \
  [get_ports {debug_r0[30]}]  \
  [get_ports {debug_r0[31]}]  \
  [get_ports {debug_r1[0]}]  \
  [get_ports {debug_r1[1]}]  \
  [get_ports {debug_r1[2]}]  \
  [get_ports {debug_r1[3]}]  \
  [get_ports {debug_r1[4]}]  \
  [get_ports {debug_r1[5]}]  \
  [get_ports {debug_r1[6]}]  \
  [get_ports {debug_r1[7]}]  \
  [get_ports {debug_r1[8]}]  \
  [get_ports {debug_r1[9]}]  \
  [get_ports {debug_r1[10]}]  \
  [get_ports {debug_r1[11]}]  \
  [get_ports {debug_r1[12]}]  \
  [get_ports {debug_r1[13]}]  \
  [get_ports {debug_r1[14]}]  \
  [get_ports {debug_r1[15]}]  \
  [get_ports {debug_r1[16]}]  \
  [get_ports {debug_r1[17]}]  \
  [get_ports {debug_r1[18]}]  \
  [get_ports {debug_r1[19]}]  \
  [get_ports {debug_r1[20]}]  \
  [get_ports {debug_r1[21]}]  \
  [get_ports {debug_r1[22]}]  \
  [get_ports {debug_r1[23]}]  \
  [get_ports {debug_r1[24]}]  \
  [get_ports {debug_r1[25]}]  \
  [get_ports {debug_r1[26]}]  \
  [get_ports {debug_r1[27]}]  \
  [get_ports {debug_r1[28]}]  \
  [get_ports {debug_r1[29]}]  \
  [get_ports {debug_r1[30]}]  \
  [get_ports {debug_r1[31]}]  \
  [get_ports {debug_r2[0]}]  \
  [get_ports {debug_r2[1]}]  \
  [get_ports {debug_r2[2]}]  \
  [get_ports {debug_r2[3]}]  \
  [get_ports {debug_r2[4]}]  \
  [get_ports {debug_r2[5]}]  \
  [get_ports {debug_r2[6]}]  \
  [get_ports {debug_r2[7]}]  \
  [get_ports {debug_r2[8]}]  \
  [get_ports {debug_r2[9]}]  \
  [get_ports {debug_r2[10]}]  \
  [get_ports {debug_r2[11]}]  \
  [get_ports {debug_r2[12]}]  \
  [get_ports {debug_r2[13]}]  \
  [get_ports {debug_r2[14]}]  \
  [get_ports {debug_r2[15]}]  \
  [get_ports {debug_r2[16]}]  \
  [get_ports {debug_r2[17]}]  \
  [get_ports {debug_r2[18]}]  \
  [get_ports {debug_r2[19]}]  \
  [get_ports {debug_r2[20]}]  \
  [get_ports {debug_r2[21]}]  \
  [get_ports {debug_r2[22]}]  \
  [get_ports {debug_r2[23]}]  \
  [get_ports {debug_r2[24]}]  \
  [get_ports {debug_r2[25]}]  \
  [get_ports {debug_r2[26]}]  \
  [get_ports {debug_r2[27]}]  \
  [get_ports {debug_r2[28]}]  \
  [get_ports {debug_r2[29]}]  \
  [get_ports {debug_r2[30]}]  \
  [get_ports {debug_r2[31]}]  \
  [get_ports {debug_r3[0]}]  \
  [get_ports {debug_r3[1]}]  \
  [get_ports {debug_r3[2]}]  \
  [get_ports {debug_r3[3]}]  \
  [get_ports {debug_r3[4]}]  \
  [get_ports {debug_r3[5]}]  \
  [get_ports {debug_r3[6]}]  \
  [get_ports {debug_r3[7]}]  \
  [get_ports {debug_r3[8]}]  \
  [get_ports {debug_r3[9]}]  \
  [get_ports {debug_r3[10]}]  \
  [get_ports {debug_r3[11]}]  \
  [get_ports {debug_r3[12]}]  \
  [get_ports {debug_r3[13]}]  \
  [get_ports {debug_r3[14]}]  \
  [get_ports {debug_r3[15]}]  \
  [get_ports {debug_r3[16]}]  \
  [get_ports {debug_r3[17]}]  \
  [get_ports {debug_r3[18]}]  \
  [get_ports {debug_r3[19]}]  \
  [get_ports {debug_r3[20]}]  \
  [get_ports {debug_r3[21]}]  \
  [get_ports {debug_r3[22]}]  \
  [get_ports {debug_r3[23]}]  \
  [get_ports {debug_r3[24]}]  \
  [get_ports {debug_r3[25]}]  \
  [get_ports {debug_r3[26]}]  \
  [get_ports {debug_r3[27]}]  \
  [get_ports {debug_r3[28]}]  \
  [get_ports {debug_r3[29]}]  \
  [get_ports {debug_r3[30]}]  \
  [get_ports {debug_r3[31]}]  \
  [get_ports {debug_r4[0]}]  \
  [get_ports {debug_r4[1]}]  \
  [get_ports {debug_r4[2]}]  \
  [get_ports {debug_r4[3]}]  \
  [get_ports {debug_r4[4]}]  \
  [get_ports {debug_r4[5]}]  \
  [get_ports {debug_r4[6]}]  \
  [get_ports {debug_r4[7]}]  \
  [get_ports {debug_r4[8]}]  \
  [get_ports {debug_r4[9]}]  \
  [get_ports {debug_r4[10]}]  \
  [get_ports {debug_r4[11]}]  \
  [get_ports {debug_r4[12]}]  \
  [get_ports {debug_r4[13]}]  \
  [get_ports {debug_r4[14]}]  \
  [get_ports {debug_r4[15]}]  \
  [get_ports {debug_r4[16]}]  \
  [get_ports {debug_r4[17]}]  \
  [get_ports {debug_r4[18]}]  \
  [get_ports {debug_r4[19]}]  \
  [get_ports {debug_r4[20]}]  \
  [get_ports {debug_r4[21]}]  \
  [get_ports {debug_r4[22]}]  \
  [get_ports {debug_r4[23]}]  \
  [get_ports {debug_r4[24]}]  \
  [get_ports {debug_r4[25]}]  \
  [get_ports {debug_r4[26]}]  \
  [get_ports {debug_r4[27]}]  \
  [get_ports {debug_r4[28]}]  \
  [get_ports {debug_r4[29]}]  \
  [get_ports {debug_r4[30]}]  \
  [get_ports {debug_r4[31]}]  \
  [get_ports {debug_r5[0]}]  \
  [get_ports {debug_r5[1]}]  \
  [get_ports {debug_r5[2]}]  \
  [get_ports {debug_r5[3]}]  \
  [get_ports {debug_r5[4]}]  \
  [get_ports {debug_r5[5]}]  \
  [get_ports {debug_r5[6]}]  \
  [get_ports {debug_r5[7]}]  \
  [get_ports {debug_r5[8]}]  \
  [get_ports {debug_r5[9]}]  \
  [get_ports {debug_r5[10]}]  \
  [get_ports {debug_r5[11]}]  \
  [get_ports {debug_r5[12]}]  \
  [get_ports {debug_r5[13]}]  \
  [get_ports {debug_r5[14]}]  \
  [get_ports {debug_r5[15]}]  \
  [get_ports {debug_r5[16]}]  \
  [get_ports {debug_r5[17]}]  \
  [get_ports {debug_r5[18]}]  \
  [get_ports {debug_r5[19]}]  \
  [get_ports {debug_r5[20]}]  \
  [get_ports {debug_r5[21]}]  \
  [get_ports {debug_r5[22]}]  \
  [get_ports {debug_r5[23]}]  \
  [get_ports {debug_r5[24]}]  \
  [get_ports {debug_r5[25]}]  \
  [get_ports {debug_r5[26]}]  \
  [get_ports {debug_r5[27]}]  \
  [get_ports {debug_r5[28]}]  \
  [get_ports {debug_r5[29]}]  \
  [get_ports {debug_r5[30]}]  \
  [get_ports {debug_r5[31]}]  \
  [get_ports {debug_r6[0]}]  \
  [get_ports {debug_r6[1]}]  \
  [get_ports {debug_r6[2]}]  \
  [get_ports {debug_r6[3]}]  \
  [get_ports {debug_r6[4]}]  \
  [get_ports {debug_r6[5]}]  \
  [get_ports {debug_r6[6]}]  \
  [get_ports {debug_r6[7]}]  \
  [get_ports {debug_r6[8]}]  \
  [get_ports {debug_r6[9]}]  \
  [get_ports {debug_r6[10]}]  \
  [get_ports {debug_r6[11]}]  \
  [get_ports {debug_r6[12]}]  \
  [get_ports {debug_r6[13]}]  \
  [get_ports {debug_r6[14]}]  \
  [get_ports {debug_r6[15]}]  \
  [get_ports {debug_r6[16]}]  \
  [get_ports {debug_r6[17]}]  \
  [get_ports {debug_r6[18]}]  \
  [get_ports {debug_r6[19]}]  \
  [get_ports {debug_r6[20]}]  \
  [get_ports {debug_r6[21]}]  \
  [get_ports {debug_r6[22]}]  \
  [get_ports {debug_r6[23]}]  \
  [get_ports {debug_r6[24]}]  \
  [get_ports {debug_r6[25]}]  \
  [get_ports {debug_r6[26]}]  \
  [get_ports {debug_r6[27]}]  \
  [get_ports {debug_r6[28]}]  \
  [get_ports {debug_r6[29]}]  \
  [get_ports {debug_r6[30]}]  \
  [get_ports {debug_r6[31]}]  \
  [get_ports {debug_r7[0]}]  \
  [get_ports {debug_r7[1]}]  \
  [get_ports {debug_r7[2]}]  \
  [get_ports {debug_r7[3]}]  \
  [get_ports {debug_r7[4]}]  \
  [get_ports {debug_r7[5]}]  \
  [get_ports {debug_r7[6]}]  \
  [get_ports {debug_r7[7]}]  \
  [get_ports {debug_r7[8]}]  \
  [get_ports {debug_r7[9]}]  \
  [get_ports {debug_r7[10]}]  \
  [get_ports {debug_r7[11]}]  \
  [get_ports {debug_r7[12]}]  \
  [get_ports {debug_r7[13]}]  \
  [get_ports {debug_r7[14]}]  \
  [get_ports {debug_r7[15]}]  \
  [get_ports {debug_r7[16]}]  \
  [get_ports {debug_r7[17]}]  \
  [get_ports {debug_r7[18]}]  \
  [get_ports {debug_r7[19]}]  \
  [get_ports {debug_r7[20]}]  \
  [get_ports {debug_r7[21]}]  \
  [get_ports {debug_r7[22]}]  \
  [get_ports {debug_r7[23]}]  \
  [get_ports {debug_r7[24]}]  \
  [get_ports {debug_r7[25]}]  \
  [get_ports {debug_r7[26]}]  \
  [get_ports {debug_r7[27]}]  \
  [get_ports {debug_r7[28]}]  \
  [get_ports {debug_r7[29]}]  \
  [get_ports {debug_r7[30]}]  \
  [get_ports {debug_r7[31]}]  \
  [get_ports {debug_pc[0]}]  \
  [get_ports {debug_pc[1]}]  \
  [get_ports {debug_pc[2]}]  \
  [get_ports {debug_pc[3]}]  \
  [get_ports {debug_pc[4]}]  \
  [get_ports {debug_pc[5]}]  \
  [get_ports {debug_pc[6]}]  \
  [get_ports {debug_pc[7]}] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports rst]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {start_pc[7]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {start_pc[6]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {start_pc[5]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {start_pc[4]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {start_pc[3]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {start_pc[2]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {start_pc[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {start_pc[0]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.2 [get_ports rst]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.2 [get_ports {start_pc[7]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.2 [get_ports {start_pc[6]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.2 [get_ports {start_pc[5]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.2 [get_ports {start_pc[4]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.2 [get_ports {start_pc[3]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.2 [get_ports {start_pc[2]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.2 [get_ports {start_pc[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.2 [get_ports {start_pc[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r0[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r1[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r2[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r3[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r4[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r5[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r6[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_r7[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_pc[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_pc[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_pc[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_pc[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_pc[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_pc[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_pc[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports {debug_pc[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports N_flag]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports Z_flag]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports C_flag]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.5 [get_ports V_flag]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r0[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r1[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r2[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r3[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r4[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r5[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r6[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_r7[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_pc[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_pc[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_pc[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_pc[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_pc[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_pc[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_pc[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports {debug_pc[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports N_flag]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports Z_flag]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports C_flag]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.0 [get_ports V_flag]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.05 [get_clocks clk]
set_clock_uncertainty -hold 0.05 [get_clocks clk]
