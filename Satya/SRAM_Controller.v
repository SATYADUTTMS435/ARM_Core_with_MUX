`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2026 21:20:39
// Design Name: 
// Module Name: SRAM_Controller
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


module SRAM_Controller(
    input clk,rst,
    input [31:0] address,
    input [31:0] Write_Data,
    input write_enable,read_enable,
    output reg [31:0] Read_Data,
    output reg ready,
    inout [31:0] Data_Bus,
    output reg [9:0] Sram_address,
    output reg sram_we_n
    );
    parameter  [1:0] IDLE = 2'b00;
    parameter  [1:0] READ = 2'b01;
    parameter  [1:0] WRITE = 2'b10;
    reg [1:0] next_state,present_state;
    reg [2:0] count;
    always@(*)
    begin
    next_state = present_state;
  case (present_state)
        IDLE: begin
           
            next_state = (read_enable)  ? READ  :
                         (write_enable) ? WRITE :
                                          IDLE;
        end

        READ: begin
            next_state = (count == 3'd4) ? IDLE : READ;
        end

        WRITE: begin
            next_state = (count == 3'd4) ? IDLE : WRITE;
        end

        default: next_state = IDLE;
    endcase
    end
    always @(posedge clk or posedge rst) begin
    if (rst)
        present_state <= IDLE;
    else
        present_state <= next_state;
    end


    always @(posedge clk or posedge rst) begin
            if (rst)
                count <= 3'd0;
    else if (present_state == READ || present_state == WRITE)
            count <= count + 1;
    else
             count <= 3'd0;
    end
   always @(*) begin
    
    Sram_address = address[9:0];
     sram_we_n = (present_state == WRITE) ? 1'b0 : 1'b1;

    ready     = (present_state == IDLE)  ? 1'b1 : 1'b0;

    
    Read_Data = (present_state == READ) ? Data_Bus : 32'd0;

end


    assign Data_Bus = (present_state == WRITE) ? Write_Data : 32'bz;

endmodule 

