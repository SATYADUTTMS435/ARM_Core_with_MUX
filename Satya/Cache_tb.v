`timescale 1ns/1ps

module tb_Cache;

reg clk, rst;
reg [31:0] address;
reg [31:0] write_data;
reg read_request, write_request;

wire [31:0] read_data;
wire cache_hit, cache_miss;

// Instantiate Cache
Cache uut (
    .clk(clk),          // ✅ added
    .rst(rst),          // ✅ added
    .address(address),
    .read_request(read_request),
    .write_request(write_request),
    .write_data(write_data),
    .read_data(read_data),
    .cache_hit(cache_hit),
    .cache_miss(cache_miss)
);

// ✅ Clock generation
always #5 clk = ~clk;

initial begin
    // Monitor
    $display("time\taddr wr rd | wdata rdata | hit miss");
    $monitor("%0t\t%d   %b  %b | %d   %d |  %b   %b",
             $time, address, write_request, read_request,
             write_data, read_data, cache_hit, cache_miss);

    // Init
    clk = 0;
    rst = 1;
    address = 0;
    write_data = 0;
    write_request = 0;
    read_request = 0;

    // Reset
    #10 rst = 0;

    // ================= WRITE =================
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

    // ================= CONFLICT MISS =================
    #10;
    address = 14;   // same index as 10
    read_request = 1;

    #10 read_request = 0;

    // ================= WRITE NEW =================
    #10;
    address = 14;
    write_data = 50;
    write_request = 1;

    #10 write_request = 0;

    // ================= READ HIT AGAIN =================
    #10;
    address = 14;
    read_request = 1;

    #10 read_request = 0;

    #20 $finish;
end

endmodule