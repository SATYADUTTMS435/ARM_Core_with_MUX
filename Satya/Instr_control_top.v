`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2026 23:40:34
// Design Name: 
// Module Name: Instr_control_top
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


module Control_Inst_Top(
    input clk,
    input rst,

    output [3:0] alu_opcode,
    output read_request,
    output write_request
);

// ---------------- WIRES ----------------
wire [7:0] pc_addr;
wire [3:0] instruction;

// ---------------- PC ----------------
PC pc_inst (
    .clk(clk),
    .rst(rst),
    .pc_addr(pc_addr)
);

// ---------------- INSTRUCTION MEMORY ----------------
Instruction_Memory imem (
    .address(pc_addr),
    .instruction(instruction)
);

// ---------------- CONTROL UNIT ----------------
Control_Unit CU (
    .instr(instruction),
    .alu_opcode(alu_opcode),
    .read_request(read_request),
    .write_request(write_request)
);

endmodule