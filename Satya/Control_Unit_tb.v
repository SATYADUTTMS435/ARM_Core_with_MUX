`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2026 22:57:13
// Design Name: 
// Module Name: Control_Unit_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps

module tb_Control_Unit;

reg [3:0] instr;

wire [3:0] alu_opcode;
wire read_request;
wire write_request;

// ---------------- DUT ----------------
Control_Unit uut (
    .instr(instr),
    .alu_opcode(alu_opcode),
    .read_request(read_request),
    .write_request(write_request)
);

// ---------------- TEST ----------------
initial begin

    $display("time\tinstr | alu_opcode | read write");

    $monitor("%0t\t%b   |   %b      |  %b     %b",
             $time, instr, alu_opcode,
             read_request, write_request);

    // -------- ALU OPERATIONS --------
    #10 instr = 4'b0000; // ADD
    #10 instr = 4'b0001; // SUB
    #10 instr = 4'b0011; // AND
    #10 instr = 4'b0101; // XOR
    #10 instr = 4'b0110; // MOV

    // -------- SPECIAL OPS --------
    #10 instr = 4'b1000; // CMP
    #10 instr = 4'b1010; // BIC

    // -------- MEMORY OPS --------
    #10 instr = 4'b1101; // LOAD
    #10 instr = 4'b1110; // STORE

    // -------- DEFAULT --------
    #10 instr = 4'b1111; // undefined

    #20 $finish;

end

endmodule