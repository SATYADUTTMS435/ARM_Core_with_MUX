
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2026 22:55:38
// Design Name: 
// Module Name: Cache_System_tb
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

//BASIC SIGNAL TB TO CHECK WORKING

`timescale 1ns/1ps

module tb_Cache_System;

reg clk, rst;
reg [31:0] address;
reg [31:0] write_data;
reg read_request, write_request;

wire [31:0] read_data;

// Instantiate system
Cache_System uut (
    .clk(clk),
    .rst(rst),
    .address(address),
    .write_data(write_data),
    .read_request(read_request),
    .write_request(write_request),
    .read_data(read_data)
);

// Clock
always #5 clk = ~clk;

initial begin
    // Monitor
    $display("time\taddr wr rd | wdata rdata");
    $monitor("%0t\t%d   %b  %b | %d   %d",
             $time, address, write_request, read_request,
             write_data, read_data);

    // Init
    clk = 0;
    rst = 1;
    address = 0;
    write_data = 0;
    write_request = 0;
    read_request = 0;

    // Reset
    #10 rst = 0;

    // ================= WRITE (to cache directly) =================
    #10;
    address = 10;
    write_data = 25;
    write_request = 1;

    #10 write_request = 0;

    // ================= READ (HIT) =================
    #10;
    address = 10;
    read_request = 1;

    #10 read_request = 0;

    // ================= READ NEW ADDRESS (MISS → SRAM) =================
    #10;
    address = 20;
    read_request = 1;

    #10 read_request = 0;

    // ================= READ AGAIN (NOW HIT AFTER UPDATE) =================
    #20;
    address = 20;
    read_request = 1;

    #10 read_request = 0;

    // ================= WRITE NEW =================
    #10;
    address = 30;
    write_data = 100;
    write_request = 1;

    #10 write_request = 0;

    // ================= READ HIT =================
    #10;
    address = 30;
    read_request = 1;

    #10 read_request = 0;

    #30 $finish;
end

endmodule


// TO TEST ALL SIGNALS
/*
`timescale 1ns/1ps

module tb_Cache_System;

reg clk, rst;
reg [31:0] address;
reg [31:0] write_data;
reg read_request, write_request;

wire [31:0] read_data;

// 🔥 DEBUG SIGNALS
wire cache_hit;
wire cache_miss;
wire read_sram;
wire update_cache;
wire ready;

// ---------------- DUT ----------------
Cache_System uut (
    .clk(clk),
    .rst(rst),
    .address(address),
    .write_data(write_data),
    .read_request(read_request),
    .write_request(write_request),
    .read_data(read_data),

    // debug connections
    .cache_hit(cache_hit),
    .cache_miss(cache_miss),
    .read_sram(read_sram),
    .update_cache(update_cache),
    .ready(ready)
);

// ---------------- CLOCK ----------------
always #5 clk = ~clk;

// ---------------- TEST ----------------
initial begin

    // Display header
    $display("time\taddr wr rd | rdata | hit miss sram upd ready");

    $monitor("%0t\t%d   %b  %b | %d |  %b   %b   %b    %b   %b",
             $time, address, write_request, read_request,
             read_data, cache_hit, cache_miss,
             read_sram, update_cache, ready);

    // Init
    clk = 0;
    rst = 1;
    address = 0;
    write_data = 0;
    write_request = 0;
    read_request = 0;

    // Reset
    #10 rst = 0;

    // ================= WRITE (10 → 25) =================
    #10;
    address = 10;
    write_data = 25;
    write_request = 1;

    #10 write_request = 0;

    // ================= READ HIT =================
    #10;
    address = 10;
    read_request = 1;

    #10 read_request = 0;

    // ================= READ MISS (20) =================
    #10;
    address = 20;
    read_request = 1;

    #10 read_request = 0;

    // ================= READ AGAIN (HIT after update) =================
    #20;
    address = 20;
    read_request = 1;

    #10 read_request = 0;

    // ================= WRITE (30 → 100) =================
    #10;
    address = 30;
    write_data = 100;
    write_request = 1;

    #10 write_request = 0;

    // ================= READ HIT =================
    #10;
    address = 30;
    read_request = 1;

    #10 read_request = 0;

    // Finish
    #30 $finish;

end

endmodule
*/