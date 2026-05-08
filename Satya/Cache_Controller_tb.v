`timescale 1ns/1ps

module tb_Cache_Controller;

reg clk;
reg rst;
reg cache_hit;
reg cpu_request;

wire read_sram;
wire update_cache;
wire ready;

// Instantiate DUT
Cache_Controller uut (
    .cache_hit(cache_hit),
    .cpu_request(cpu_request),
    .clk(clk),
    .rst(rst),
    .read_sram(read_sram),
    .update_cache(update_cache),
    .ready(ready)
);

// Clock
always #5 clk = ~clk;

initial begin
    // Monitor
    $display("time\tclk rst req hit | ready sram update");
    $monitor("%0t\t%b   %b   %b   %b  |  %b     %b     %b",
             $time, clk, rst, cpu_request, cache_hit,
             ready, read_sram, update_cache);

    // Init
    clk = 0;
    rst = 1;
    cpu_request = 0;
    cache_hit = 0;

    // Reset
    #10 rst = 0;

    // ================= CASE 1: HIT =================
    #10;
    cpu_request = 1;
    cache_hit = 1;

    #20;
    cpu_request = 0;

    // ================= CASE 2: MISS =================
    #10;
    cpu_request = 1;
    cache_hit = 0;

    #20;
    cpu_request = 0;

    // ================= CASE 3: BACK TO HIT =================
    #10;
    cpu_request = 1;
    cache_hit = 1;

    #20;
    cpu_request = 0;

    // Finish
    #20;
    $finish;
end

endmodule