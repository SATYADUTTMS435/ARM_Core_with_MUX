`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2026 20:45:52
// Design Name: 
// Module Name: Cache_Controller
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


module Cache_Controller(
    input cache_hit,
    input cpu_request,
    input clk,rst,
    output reg read_sram,update_cache,ready
    );
    reg [1:0] present_state;
    wire [1:0] next_state;
    parameter [1:0] IDLE = 2'b00;
    parameter [1:0] CHECK = 2'b01;
    parameter [1:0] MISS = 2'b10;
    assign next_state =
    (present_state == IDLE)  ? (cpu_request ? CHECK : IDLE) :
    (present_state == CHECK) ? (cache_hit ? IDLE : MISS) :
    (present_state == MISS)  ? IDLE :
                              IDLE;
   always @(posedge clk or posedge rst) begin
    if (rst)
        present_state <= IDLE;
    else
        present_state <= next_state;
    end
    always @(*) begin
    ready        = (present_state == IDLE)  ? 1 : 0;
    read_sram    = (present_state == MISS)  ? 1 : 0;
    update_cache = (present_state == MISS)  ? 1 : 0;
    end
endmodule
