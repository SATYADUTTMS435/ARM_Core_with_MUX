`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 09:25:13
// Design Name: 
// Module Name: Incrementer
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


module pc_logic(
    input  [31:0] pc,
    input  [31:0] branch_addr,
    input  [31:0] jump_addr,
    input  [1:0]  pc_sel,
    output reg [31:0] next_pc
);

wire [31:0] pc_plus4;

assign pc_plus4 = pc + 32'd4;

always @(*) begin
    case(pc_sel)

        2'b00: next_pc = pc_plus4;     // normal
        2'b01: next_pc = branch_addr;  // branch
        2'b10: next_pc = jump_addr;    // jump

        default: next_pc = pc_plus4;

    endcase
end

endmodule
