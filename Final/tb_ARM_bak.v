`timescale 1ns/1ps

module tb_ARM;

    reg clk;
    reg rst;
    reg [7:0] start_pc;

    // ============================================================
    // DUT
    // ============================================================

    ARM dut(
        .clk(clk),
        .rst(rst),

        .start_pc(start_pc),

        .debug_r0(),
        .debug_r1(),
        .debug_r2(),
        .debug_r3(),
        .debug_r4(),
        .debug_r5(),
        .debug_r6(),
        .debug_r7(),

        .debug_pc(),

        .N_flag(),
        .Z_flag(),
        .C_flag(),
        .V_flag()
    );

    // ============================================================
    // CLOCK GENERATION
    // ============================================================

    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // ============================================================
    // RESET
    // ============================================================

    initial
    begin
        start_pc = 8'd0;
        rst = 1;
        #20;
        rst = 0;
        
    end

    // ============================================================
    // WAVEFORM DUMP
    // ============================================================

    initial
    begin

        $dumpfile("arm_wave.vcd");

        // PC
        $dumpvars(0, dut.pc_addr);

        // Register File
        $dumpvars(0, dut.rf.RF[0]);
        $dumpvars(0, dut.rf.RF[1]);
        $dumpvars(0, dut.rf.RF[2]);
        $dumpvars(0, dut.rf.RF[3]);
        $dumpvars(0, dut.rf.RF[4]);
        $dumpvars(0, dut.rf.RF[5]);
        $dumpvars(0, dut.rf.RF[6]);
        $dumpvars(0, dut.rf.RF[7]);

        // Flags
        $dumpvars(0, dut.N_flag);
        $dumpvars(0, dut.Z_flag);
        $dumpvars(0, dut.C_flag);
        $dumpvars(0, dut.V_flag);

    end

    // ============================================================
    // MONITOR
    // ============================================================

    initial
    begin

        $display("====================================================");
        $display("TIME\tPC\tR0\tR1\tR2\tR3\tR4\tR5\tR6\tR7");
        $display("====================================================");

        $monitor(
            "%0t\t%0d\t%0d\t%0d\t%0d\t%0d\t%0d\t%0d\t%0d\t%0d",

            $time,

            dut.pc_addr,

            dut.rf.RF[0],
            dut.rf.RF[1],
            dut.rf.RF[2],
            dut.rf.RF[3],
            dut.rf.RF[4],
            dut.rf.RF[5],
            dut.rf.RF[6],
            dut.rf.RF[7]

        );

    end

    // ============================================================
    // SIMULATION END
    // ============================================================

    initial
    begin

        wait(dut.halted == 1'b1);

        #50;

        $display("====================================================");
        $display("FINAL REGISTER VALUES");
        $display("====================================================");

        $display("R0 = %0d", dut.rf.RF[0]);
        $display("R1 = %0d", dut.rf.RF[1]);
        $display("R2 = %0d", dut.rf.RF[2]);
        $display("R3 = %0d", dut.rf.RF[3]);
        $display("R4 = %0d", dut.rf.RF[4]);
        $display("R5 = %0d", dut.rf.RF[5]);
        $display("R6 = %0d", dut.rf.RF[6]);
        $display("R7 = %0d", dut.rf.RF[7]);

        $finish;

    end 

endmodule