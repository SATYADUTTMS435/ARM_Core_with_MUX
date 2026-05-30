`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 09:29:04
// Design Name: 
// Module Name: tb_pc_logic
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

module tb_pc_logic;

reg  [31:0] pc;
reg  [31:0] branch_addr;
reg  [31:0] jump_addr;
reg  [1:0]  pc_sel;

wire [31:0] next_pc;


// Instantiate DUT
pc_logic DUT (
    .pc(pc),
    .branch_addr(branch_addr),
    .jump_addr(jump_addr),
    .pc_sel(pc_sel),
    .next_pc(next_pc)
);


initial begin

    
    $dumpfile("pc_logic.vcd");
    $dumpvars(0, tb_pc_logic);

    // Initialize values
    pc          = 32'h00000000;
    branch_addr = 32'h00000100;
    jump_addr   = 32'h00001000;

 
    // CASE 1 : Normal PC + 4
    pc_sel = 2'b00;
    #10;

    
    // CASE 2 : Branch Address
    pc_sel = 2'b01;
    #10;

    
    // CASE 3 : Jump Address
    pc_sel = 2'b10;
    #10;

    
    // CASE 4 : Default Condition
    pc_sel = 2'b11;
    #10;

   
    // CASE 5 : Different PC Value
    pc = 32'h00000020;
    pc_sel = 2'b00;
    #10;

    
    // CASE 6 : New Branch Address
    branch_addr = 32'hABCDEFFF;
    pc_sel = 2'b01;
    #10;

   
    // CASE 7 : New Jump Address
    jump_addr = 32'h12345678;
    pc_sel = 2'b10;
    #10;

   
    // CASE 8 : Overflow Check
    pc = 32'hFFFFFFFC;
    pc_sel = 2'b00;
    #10;

    $finish;

end

endmodule
