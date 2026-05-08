`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2026 22:54:56
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [3:0] instr,

    output [3:0] alu_opcode,
    output read_request,
    output write_request
);

// ---------------- MEMORY CONTROL ----------------
// MUX: (instr == value) ? 1 : 0

assign read_request  = (instr == 4'b1101) ? 1'b1 : 1'b0;
assign write_request = (instr == 4'b1110) ? 1'b1 : 1'b0;


// ---------------- ALU OPCODE ----------------
// MUX: select instr or default

assign alu_opcode =
    (instr == 4'b1101) ? 4'b0000 :   // LOAD → no ALU
    (instr == 4'b1110) ? 4'b0000 :   // STORE → no ALU
                        instr;       // ALU ops directly mapped

endmodule