`timescale 1ns/1ns

// =============================================================================
// ARM-style Register File (r0-r15)
// Based on ARM Datapath Diagram:
//   - r15 = PC (Program Counter), read-only output port
//   - Rd   = Destination register (write port, driven by Result)
//   - Rn   = Source A output
//   - Rm   = Source B output
//   - CPSR = Current Program Status Register [31:28] = {N, Z, C, V}, bits[27:0] = 0
// Write on NEGEDGE clk; Read is combinational (asynchronous).
// =============================================================================

module RegisterFile (
    input         clk,
    input         rst,

    // ── Read ports (Rn→A, Rm→B from diagram) ─────────────────────────────────
    input  [3:0]  Rn,          // Address for port A  (→ ALU operand A)
    input  [3:0]  Rm,          // Address for port B  (→ Barrel Shifter / ALU B)

    // ── Write port (Rd ← Result from diagram) ────────────────────────────────
    input  [3:0]  Rd,          // Destination register address
    input  [31:0] Result,      // Data to write back
    input         WriteEn,     // Write-enable (active high)

    // ── CPSR write port (flags from ALU/MAC) ─────────────────────────────────
    input         CPSR_WriteEn,// High when flags should be updated
    input         N_flag,      // Negative
    input         Z_flag,      // Zero
    input         C_flag,      // Carry
    input         V_flag,      // Overflow

    // ── Read outputs ─────────────────────────────────────────────────────────
    output [31:0] A,           // Rn read data  → ALU / MAC port A
    output [31:0] B,           // Rm read data  → Barrel Shifter / MAC port B
    output [31:0] PC,          // r15 value     → Address register / Incrementer
    output [31:0] CPSR_out     // Full 32-bit CPSR: {N,Z,C,V, 28'b0}
);

    // ── Register array r0-r15 ────────────────────────────────────────────────
    reg [31:0] RF [0:15];      // 16 × 32-bit registers

    // ── CPSR flags (only N,Z,C,V; rest are 0 per spec) ──────────────────────
    reg N, Z, C, V;

    integer i;

    // ── Reset / Initialise ───────────────────────────────────────────────────
    // r0-r14 = 0, r15 (PC) = 32'h0000_0000, all flags = 0
    always @(posedge rst) begin
        for (i = 0; i <= 15; i = i + 1)
            RF[i] <= 32'd0;
        N <= 1'b0; Z <= 1'b0; C <= 1'b0; V <= 1'b0;
    end

    // ── Write on NEGEDGE clock ───────────────────────────────────────────────
    always @(negedge clk) begin
        if (!rst) begin
            // General-purpose register write (r0-r15 including PC)
            if (WriteEn)
                RF[Rd] <= Result;

            // CPSR flag update (separate enable keeps flags independent)
            if (CPSR_WriteEn) begin
                N <= N_flag;
                Z <= Z_flag;
                C <= C_flag;
                V <= V_flag;
            end
        end
    end

    // ── Combinational (async) reads ──────────────────────────────────────────
    assign A        = RF[Rn];                       // Port A → ALU / MAC
    assign B        = RF[Rm];                       // Port B → Barrel Shifter
    assign PC       = RF[15];                       // r15 always visible as PC
    assign CPSR_out = {N, Z, C, V, 28'b0};         // flags in bits[31:28]

endmodule
