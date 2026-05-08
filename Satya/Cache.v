`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2026 19:43:27
// Design Name: 
// Module Name: Cache
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


module Cache(
    input clk, rst,
    input [31:0] address,
    input read_request, write_request,
    input [31:0] write_data,
    output [31:0] read_data,
    output cache_hit, cache_miss
);

reg [31:0] data_array [3:0];
reg [29:0] tag_array [3:0];
reg valid_array [3:0];

wire [1:0] index;
wire [29:0] tag;

assign index = address[1:0];
assign tag   = address[31:2];

// WRITE + RESET
always @(posedge clk) begin
    if (rst) begin
        valid_array[0] <= 0;
        valid_array[1] <= 0;
        valid_array[2] <= 0;
        valid_array[3] <= 0;
    end
    else if (write_request) begin
        data_array[index]  <= write_data;
        tag_array[index]   <= tag;
        valid_array[index] <= 1'b1;
    end
end

// HIT / MISS
assign cache_hit =
    (valid_array[index] && (tag_array[index] == tag));

assign cache_miss = ~cache_hit;

// READ
assign read_data =
    (read_request && cache_hit) ? data_array[index] : 32'd0;

endmodule
