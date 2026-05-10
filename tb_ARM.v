`timescale 1ns/1ps

module tb_ARM;

    // ============================================================
    // TESTBENCH SIGNALS
    // ============================================================

    reg clk;
    reg rst;

    // ============================================================
    // DUT
    // ============================================================

    ARM dut(
        .clk(clk),
        .rst(rst)
    );

    // ============================================================
    // CLOCK GENERATION
    // ============================================================

    initial
    begin

        clk = 0;

        forever
            #5 clk = ~clk;

    end

    // ============================================================
    // RESET SEQUENCE
    // ============================================================

    initial
    begin

        rst = 1;

        #20;

        rst = 0;

    end

    // ============================================================
    // WAVEFORM GENERATION
    // ============================================================

    initial
    begin

        $dumpfile("arm_wave.vcd");

        $dumpvars(0, tb_ARM);

    end

    // ============================================================
    // SIMULATION CONTROL
    // ============================================================

    initial
    begin

        // Runtime long enough for:
        // - all instruction groups
        // - pipeline stalls
        // - divider latency
        // - branch execution

        #500000;

        $display("\n====================================================");
        $display("SIMULATION COMPLETED");
        $display("====================================================");

        $display("R0 = %0d", dut.rf.RF[0]);
        $display("R1 = %0d", dut.rf.RF[1]);
        $display("R2 = %0d", dut.rf.RF[2]);
        $display("R3 = %0d", dut.rf.RF[3]);
        $display("R4 = %0d", dut.rf.RF[4]);
        $display("R5 = %0d", dut.rf.RF[5]);
        $display("R6 = %0d", dut.rf.RF[6]);
        $display("R7 = %0d", dut.rf.RF[7]);

        $display("====================================================\n");

        $finish;

    end

endmodule