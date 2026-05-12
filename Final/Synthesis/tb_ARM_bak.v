`timescale 1ns/1ps

module tb_ARM;

    reg clk;
    reg rst;

    reg [7:0] start_pc;

    // ============================================================
    // DEBUG WIRES
    // ============================================================

    wire [31:0] debug_r0;
    wire [31:0] debug_r1;
    wire [31:0] debug_r2;
    wire [31:0] debug_r3;

    wire [31:0] debug_r4;
    wire [31:0] debug_r5;
    wire [31:0] debug_r6;
    wire [31:0] debug_r7;

    wire [7:0] debug_pc;

    wire N_flag;
    wire Z_flag;
    wire C_flag;
    wire V_flag;

    // Optional observability signals
    wire [15:0] debug_instr;
    //wire [31:0] debug_bus;
    //wire [31:0] debug_alu;

    // ============================================================
    // DUT
    // ============================================================

    ARM dut(

        .clk(clk),
        .rst(rst),

        .start_pc(start_pc),

        .debug_r0(debug_r0),
        .debug_r1(debug_r1),
        .debug_r2(debug_r2),
        .debug_r3(debug_r3),

        .debug_r4(debug_r4),
        .debug_r5(debug_r5),
        .debug_r6(debug_r6),
        .debug_r7(debug_r7),

        .debug_pc(debug_pc),

        .N_flag(N_flag),
        .Z_flag(Z_flag),
        .C_flag(C_flag),
        .V_flag(V_flag),

        // Optional debug outputs
        .debug_instr(debug_instr)
        //.debug_bus(debug_bus),
        //.debug_alu(debug_alu)

    );

    // ============================================================
    // CLOCK GENERATION
    // ============================================================

    initial
    begin
        clk = 1'b0;

        forever #5 clk = ~clk;
    end

    // ============================================================
    // RESET
    // ============================================================

    initial
    begin

        start_pc = 8'd0;

        rst = 1'b1;

        #20;

        rst = 1'b0;

    end

    // ============================================================
    // WAVEFORM DUMP
    // ============================================================

    initial
    begin

        $dumpfile("arm_wave.vcd");

        $dumpvars(0, tb_ARM);

    end

    // ============================================================
    // MONITOR
    // ============================================================

    initial
    begin

        $display("==============================================================================================");
        $display("TIME\tPC\tINSTR\tR0\tR1\tR2\tR3\tR4\tR5\tR6\t\tR7\tN Flag\tZ FLag\tC flag\tV flag");
//  	$display("TIME\tPC\tIF\tID\tEX\tR0\tR1\tR2\tR3\tR4\tR5\tR6\tR7\tALU_OUT\tALU_Z\tCPSR_Z\tCPSR_C");
        $display("==============================================================================================");

        $monitor(

            "%0t\t%0d\t%h\t%0h\t%0h\t%0h\t%0h\t%0h\t%0h\t%0h\t\t%0h\t%0h\t%0h\t%0h\t%0h",
	   //"%0t\t%0d\t%h\t%h\t%h\t%0h\t%0h\t%0h\t%0h\t%0h\t%0h\t%0h\t%0h\t%0h\t%b\t%b\t%b",
            $time,

            debug_pc,
            debug_instr,

            debug_r0,
            debug_r1,
            debug_r2,
            debug_r3,

            debug_r4,
            debug_r5,
            debug_r6,
            debug_r7,
            N_flag,
            Z_flag,
            C_flag,
            V_flag

//	dut.debug_pc,
//
//                dut.instruction,
//
//                dut.IF_ID_instr,
//
//                dut.ID_EX_instr,
//
//                dut.debug_r0,
//                dut.debug_r1,
//                dut.debug_r2,
//                dut.debug_r3,
//                dut.debug_r4,
//                dut.debug_r5,
//                dut.debug_r6,
//                dut.debug_r7,
//
//                dut.alu_result,
//
//                dut.alu_Z_flag,
//
//                dut.CPSR_out[30],
//
//                dut.CPSR_out[29]

        );

    end

    // ============================================================
    // FINAL STATE
    // ============================================================

    initial
    begin

        wait(dut.halted == 1'b1);

        #50;

        $display("");
        $display("====================================================");
        $display("FINAL REGISTER VALUES");
        $display("====================================================");

        $display("R0 = %0d", debug_r0);
        $display("R1 = %0d", debug_r1);
        $display("R2 = %0d", debug_r2);
        $display("R3 = %0d", debug_r3);

        $display("R4 = %0d", debug_r4);
        $display("R5 = %0d", debug_r5);
        $display("R6 = %0d", debug_r6);
        $display("R7 = %0d", debug_r7);

        $display("");
        $display("FLAGS");
        $display("====================================================");

        $display("N = %0d", N_flag);
        $display("Z = %0d", Z_flag);
        $display("C = %0d", C_flag);
        $display("V = %0d", V_flag);

	$display("instr = %0h", debug_instr);
        $finish;

    end

endmodule
