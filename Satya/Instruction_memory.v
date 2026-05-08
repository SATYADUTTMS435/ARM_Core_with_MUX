`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2026 23:29:42
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_Memory(
    input [7:0] address,
    output reg [3:0] instruction
);

reg [3:0] mem [0:255];

// Program
initial begin
    mem[0] = 4'b0000; // ADD
    mem[1] = 4'b0001; // SUB
    mem[2] = 4'b0011; // AND
    mem[3] = 4'b1101; // LOAD
    mem[4] = 4'b1110; // STORE
    mem[5] = 4'b0101; // XOR
end

always @(*) begin
    instruction = mem[address];   // mux-like behavior
end

endmodule