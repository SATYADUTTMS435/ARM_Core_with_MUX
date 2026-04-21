//BASIC WORKING WITH NOT ALL DEBUG SIGNALS

timescale 1ns/1ps

module Cache_System(
    input clk, rst,
    input [31:0] address,
    input [31:0] write_data,
    input read_request, write_request,
    output [31:0] read_data
);

// ---------------- WIRES ----------------
wire cache_hit, cache_miss;
wire read_sram, update_cache, ready;

wire [31:0] cache_read_data;
wire [31:0] sram_data;

// ---------------- DELAY (IMPORTANT FIX) ----------------
reg update_cache_d;
reg [31:0] sram_data_d;

always @(posedge clk) begin
    update_cache_d <= update_cache;
    sram_data_d <= sram_data;
end

// ---------------- CACHE ----------------
Cache cache_inst (
    .clk(clk),
    .rst(rst),
    .address(address),

    // combine CPU write + update write
    .write_request(write_request | update_cache_d),

    // MUX between CPU data and SRAM data
    .write_data(update_cache_d ? sram_data_d : write_data),

    .read_request(read_request),
    .read_data(cache_read_data),
    .cache_hit(cache_hit),
    .cache_miss(cache_miss)
);

// ---------------- CONTROLLER ----------------
Cache_Controller ctrl (
    .cache_hit(cache_hit),
    .cpu_request(read_request | write_request),
    .clk(clk),
    .rst(rst),
    .read_sram(read_sram),
    .update_cache(update_cache),
    .ready(ready)
);

// ---------------- SRAM ----------------
SRAM sram_inst (
    .clk(clk),
    .addr(address[9:0]),
    .data(sram_data),
    .we_n(~read_sram)
);

// ---------------- OUTPUT ----------------
assign read_data =
    (read_request) ?
        (cache_hit ? cache_read_data : sram_data)
        : 32'd0;

endmodule


//WITH ALL SIGNALS TO DEBUG USE THIS CODE BELOW
/*
`timescale 1ns/1ps

module Cache_System(
    input clk, rst,
    input [31:0] address,
    input [31:0] write_data,
    input read_request, write_request,

    output [31:0] read_data,

    // 🔥 DEBUG SIGNALS (optional)
    output cache_hit,
    output cache_miss,
    output read_sram,
    output update_cache,
    output ready
);

// ---------------- INTERNAL WIRES ----------------
wire cache_hit_int, cache_miss_int;
wire read_sram_int, update_cache_int, ready_int;

wire [31:0] cache_read_data;
wire [31:0] sram_data;

// ---------------- DELAY (for proper update) ----------------
reg update_cache_d;
reg [31:0] sram_data_d;

always @(posedge clk) begin
    update_cache_d <= update_cache_int;
    sram_data_d <= sram_data;
end

// ---------------- CACHE ----------------
Cache cache_inst (
    .clk(clk),
    .rst(rst),
    .address(address),

    .write_request(write_request | update_cache_d),
    .write_data(update_cache_d ? sram_data_d : write_data),

    .read_request(read_request),
    .read_data(cache_read_data),

    .cache_hit(cache_hit_int),
    .cache_miss(cache_miss_int)
);

// ---------------- CONTROLLER ----------------
Cache_Controller ctrl (
    .cache_hit(cache_hit_int),
    .cpu_request(read_request | write_request),
    .clk(clk),
    .rst(rst),

    .read_sram(read_sram_int),
    .update_cache(update_cache_int),
    .ready(ready_int)
);

// ---------------- SRAM ----------------
SRAM sram_inst (
    .clk(clk),
    .addr(address[9:0]),
    .data(sram_data),
    .we_n(~read_sram_int)
);

// ---------------- OUTPUT LOGIC ----------------
assign read_data =
    (read_request) ?
        (cache_hit_int ? cache_read_data : sram_data)
        : 32'd0;

// ---------------- DEBUG OUTPUTS ----------------
assign cache_hit    = cache_hit_int;
assign cache_miss   = cache_miss_int;
assign read_sram    = read_sram_int;
assign update_cache = update_cache_int;
assign ready        = ready_int;

endmodule
*/