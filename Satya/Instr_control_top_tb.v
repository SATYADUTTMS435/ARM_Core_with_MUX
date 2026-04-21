`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2026 23:42:01
// Design Name: 
// Module Name: Instr_control_top_tb
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




module tb_Control_Inst_Top;

reg clk, rst;

wire [3:0] alu_opcode;
wire read_request;
wire write_request;

// ---------------- DUT ----------------
Control_Inst_Top uut (
    .clk(clk),
    .rst(rst),
    .alu_opcode(alu_opcode),
    .read_request(read_request),
    .write_request(write_request)
);

// ---------------- CLOCK ----------------
always #5 clk = ~clk;

// ---------------- TEST ----------------
initial begin

    $display("time\tALU_OP  READ WRITE");
    $monitor("%0t\t%b    %b    %b",
             $time, alu_opcode,
             read_request, write_request);

    // init
    clk = 0;
    rst = 1;

    // reset
    #10 rst = 0;

    // run for multiple cycles
    #100 $finish;

end

endmodule
