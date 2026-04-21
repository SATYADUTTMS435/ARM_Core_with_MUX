`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2026 23:39:44
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input rst,
    output reg [7:0] pc_addr
);

wire [7:0] next_pc;


assign next_pc = pc_addr + 1;   // sequential increment

always @(posedge clk or posedge rst) begin
    if (rst)
        pc_addr <= 8'd0;
    else
        pc_addr <= next_pc;
end

endmodule
