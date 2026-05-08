`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 10:00:09
// Design Name: 
// Module Name: tb_sign_extend
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

module tb_sign_extend;

reg  [15:0] in;
wire [31:0] out;

sign_extend DUT (
    .in(in),
    .out(out)
);

initial begin

    $dumpfile("sign_extend.vcd");
    $dumpvars(0, tb_sign_extend);

    // Positive
    in = 16'h0005;
    #10;

    // Negative
    in = 16'hFFFA;
    #10;

    // Largest positive
    in = 16'h7FFF;
    #10;

    // Most negative
    in = 16'h8000;
    #10;

    $finish;

end

endmodule