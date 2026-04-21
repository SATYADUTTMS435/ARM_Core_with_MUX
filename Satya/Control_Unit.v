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
    input [3:0] instr,          // instruction opcode

    output reg [3:0] alu_opcode,
    output reg read_request,
    output reg write_request
);

always @(*) begin

    // -------- DEFAULT --------
    alu_opcode    = 4'b0000;
    read_request  = 0;
    write_request = 0;

    case(instr)

        //  ALU OPERATIONS 
        4'b0000: alu_opcode = 4'b0000; // ADD
        4'b0001: alu_opcode = 4'b0001; // SUB
        4'b0010: alu_opcode = 4'b0010; // ADC
        4'b0011: alu_opcode = 4'b0011; // AND
        4'b0100: alu_opcode = 4'b0100; // OR
        4'b0101: alu_opcode = 4'b0101; // XOR
        4'b0110: alu_opcode = 4'b0110; // MOV
        4'b0111: alu_opcode = 4'b0111; // MVN
        4'b1000: alu_opcode = 4'b1000; // CMP
        4'b1001: alu_opcode = 4'b1001; // CMN
        4'b1010: alu_opcode = 4'b1010; // BIC
        4'b1011: alu_opcode = 4'b1011; // RSB
        4'b1100: alu_opcode = 4'b1100; // SBC

        //  LOAD (memory read)
        4'b1101: begin
            read_request = 1;
        end

        //  STORE (memory write)
        4'b1110: begin
            write_request = 1;
        end

        default: begin
            alu_opcode = 4'b0000;
        end

    endcase

end

endmodule