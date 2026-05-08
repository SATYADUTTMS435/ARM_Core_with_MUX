`timescale 1ns/1ns

// =============================================================================
// Testbench for RegisterFile
// Tests: reset, GP register write/read (Rn/Rm), PC (r15) write/read,
//        CPSR flag update, simultaneous read+write.
// =============================================================================

module RegisterFile_tb;

    // ── DUT signals ──────────────────────────────────────────────────────────
    reg        clk, rst;

    reg  [3:0]  Rn, Rm, Rd;
    reg  [31:0] Result;
    reg         WriteEn;

    reg         CPSR_WriteEn;
    reg         N_flag, Z_flag, C_flag, V_flag;

    wire [31:0] A, B, PC, CPSR_out;

    // ── Instantiate DUT ──────────────────────────────────────────────────────
    RegisterFile DUT (
        .clk          (clk),
        .rst          (rst),
        .Rn           (Rn),
        .Rm           (Rm),
        .Rd           (Rd),
        .Result       (Result),
        .WriteEn      (WriteEn),
        .CPSR_WriteEn (CPSR_WriteEn),
        .N_flag       (N_flag),
        .Z_flag       (Z_flag),
        .C_flag       (C_flag),
        .V_flag       (V_flag),
        .A            (A),
        .B            (B),
        .PC           (PC),
        .CPSR_out     (CPSR_out)
    );

    // ── Clock: 10 ns period ───────────────────────────────────────────────────
    initial clk = 0;
    always #5 clk = ~clk;

    // ── Helper task: write one register ──────────────────────────────────────
    task write_reg;
        input [3:0]  addr;
        input [31:0] data;
        begin
            @(posedge clk);          // align to rising edge
            Rd      = addr;
            Result  = data;
            WriteEn = 1;
            @(negedge clk);          // write happens here
            #1;
            WriteEn = 0;
        end
    endtask

    // ── Helper task: update CPSR flags ───────────────────────────────────────
    task write_cpsr;
        input n, z, c, v;
        begin
            @(posedge clk);
            N_flag = n; Z_flag = z; C_flag = c; V_flag = v;
            CPSR_WriteEn = 1;
            @(negedge clk);
            #1;
            CPSR_WriteEn = 0;
        end
    endtask

    // ── Main test sequence ────────────────────────────────────────────────────
    initial begin
        $display("==============================================");
        $display("  ARM Register File Testbench");
        $display("==============================================");

        // ── Initialise all control signals ───────────────────────────────────
        rst          = 1;
        WriteEn      = 0;
        CPSR_WriteEn = 0;
        Rn = 0; Rm = 0; Rd = 0;
        Result = 0;
        N_flag = 0; Z_flag = 0; C_flag = 0; V_flag = 0;

        // ── Apply reset for 2 cycles ──────────────────────────────────────────
        #15 rst = 0;
        $display("[%0t] Reset de-asserted", $time);

        // ── TEST 1: Verify reset state ────────────────────────────────────────
        #2;
        Rn = 4'd0; Rm = 4'd1;
        #1;
        $display("\n-- TEST 1: Reset State --");
        $display("  r0 (A) = %0h  (expect 0)", A);
        $display("  r1 (B) = %0h  (expect 0)", B);
        $display("  PC     = %0h  (expect 0)", PC);
        $display("  CPSR   = %0h  (expect 0)", CPSR_out);

        // ── TEST 2: Write to r0, r1 and read back ────────────────────────────
        $display("\n-- TEST 2: Write r0=100, r1=250 --");
        write_reg(4'd0, 32'd100);
        write_reg(4'd1, 32'd250);

        Rn = 4'd0; Rm = 4'd1; #2;
        $display("  r0 via A = %0d  (expect 100)", A);
        $display("  r1 via B = %0d  (expect 250)", B);

        // ── TEST 3: Write PC (r15) ────────────────────────────────────────────
        $display("\n-- TEST 3: Write PC (r15 = 4096) --");
        write_reg(4'd15, 32'd4096);
        #2;
        $display("  PC = %0d  (expect 4096)", PC);

        // ── TEST 4: Read r15 through Rn port ─────────────────────────────────
        $display("\n-- TEST 4: Read r15 through Rn port --");
        Rn = 4'd15; #2;
        $display("  A (r15) = %0d  (expect 4096)", A);

        // ── TEST 5: CPSR flag update N=1,Z=0,C=1,V=0 ─────────────────────────
        $display("\n-- TEST 5: Set CPSR flags N=1 Z=0 C=1 V=0 --");
        write_cpsr(1, 0, 1, 0);
        #2;
        $display("  N=%b Z=%b C=%b V=%b  (expect N=1 Z=0 C=1 V=0)",
                 CPSR_out[31], CPSR_out[30], CPSR_out[29], CPSR_out[28]);

        // ── TEST 6: CPSR flag update Z=1 only ────────────────────────────────
        $display("\n-- TEST 6: Update CPSR flags N=0 Z=1 C=0 V=0 --");
        write_cpsr(0, 1, 0, 0);
        #2;
        $display("  N=%b Z=%b C=%b V=%b  (expect N=0 Z=1 C=0 V=0)",
                 CPSR_out[31], CPSR_out[30], CPSR_out[29], CPSR_out[28]);

        // ── TEST 7: All flags set ─────────────────────────────────────────────
        $display("\n-- TEST 7: All flags set N=1 Z=1 C=1 V=1 --");
        write_cpsr(1, 1, 1, 1);
        #2;
        $display("  N=%b Z=%b C=%b V=%b  (expect N=1 Z=1 C=1 V=1)",
                 CPSR_out[31], CPSR_out[30], CPSR_out[29], CPSR_out[28]);

        // ── TEST 8: Simultaneous read of two different registers ──────────────
        $display("\n-- TEST 8: Simultaneous Rn=r2, Rm=r3 read --");
        write_reg(4'd2, 32'd500);
        write_reg(4'd3, 32'd999);
        Rn = 4'd2; Rm = 4'd3; #2;
        $display("  A (r2) = %0d  (expect 500)", A);
        $display("  B (r3) = %0d  (expect 999)", B);

        // ── TEST 9: Write r5 and read as Rm ──────────────────────────────────
        $display("\n-- TEST 9: Write r5=255, read via Rm --");
        write_reg(4'd5, 32'd255);
        Rm = 4'd5; #2;
        $display("  B (r5) = %0d  (expect 255)", B);

        // ── TEST 10: Assert reset mid-operation ───────────────────────────────
        $display("\n-- TEST 10: Reset clears all registers --");
        rst = 1; #12; rst = 0;
        Rn = 4'd0; Rm = 4'd5; #2;
        $display("  r0 (A) = %h  (expect 0 after reset)", A);
        $display("  r5 (B) = %h  (expect 0 after reset)", B);
        $display("  PC     = %h  (expect 0 after reset)", PC);
        $display("  CPSR   = %h  (expect 0 after reset)", CPSR_out);

        $display("\n==============================================");
        $display("  All Tests Complete");
        $display("==============================================");
        $finish;
    end

endmodule
