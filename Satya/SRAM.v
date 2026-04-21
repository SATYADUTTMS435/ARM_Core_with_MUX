`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2026 01:16:38
// Design Name: 
// Module Name: SRAM
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

module SRAM(
    input clk,
    input [9:0] addr,
    output reg [31:0] data,
    input we_n
);

reg [31:0] mem [0:1023];

integer i;

initial begin
    for (i = 0; i < 1024; i = i + 1)
        mem[i] = i;   // initialize memory
end

always @(posedge clk) begin
    if (we_n) begin
        data <= mem[addr];   // READ
    end
end

endmodule