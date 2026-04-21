`timescale 1ns/1ps

module tb_SRAM_Controller;

    reg clk;
    reg rst;
    reg [31:0] address;
    reg [31:0] Write_Data;
    reg write_enable, read_enable;

    wire [31:0] Read_Data;
    wire ready;
    wire [31:0] Data_Bus;
    wire [9:0] Sram_address;
    wire sram_we_n;

    // Bidirectional bus handling
    reg [31:0] data_from_sram;
    assign Data_Bus = (sram_we_n == 1) ? data_from_sram : 32'bz;

    // Instantiate your controller
    SRAM_Controller uut (
        .clk(clk),
        .rst(rst),
        .address(address),
        .Write_Data(Write_Data),
        .write_enable(write_enable),
        .read_enable(read_enable),
        .Read_Data(Read_Data),
        .ready(ready),
        .Data_Bus(Data_Bus),
        .Sram_address(Sram_address),
        .sram_we_n(sram_we_n)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        address = 0;
        Write_Data = 0;
        write_enable = 0;
        read_enable = 0;
        data_from_sram = 0;

        // Reset
        #10 rst = 0;

        // ================= WRITE TEST =================
        #10;
        address = 32'd10;
        Write_Data = 32'hA5A5A5A5;
        write_enable = 1;
        read_enable = 0;

        #10 write_enable = 0;

        // Wait until operation finishes
        wait(ready);

        // ================= READ TEST =================
        #10;
        address = 32'd10;
        read_enable = 1;

        // Simulate SRAM returning data
        #10 data_from_sram = 32'hA5A5A5A5;

        #10 read_enable = 0;

        // Wait until done
        wait(ready);

        // ================= ANOTHER WRITE =================
        #10;
        address = 32'd20;
        Write_Data = 32'hDEADBEEF;
        write_enable = 1;

        #10 write_enable = 0;
        wait(ready);

        // ================= ANOTHER READ =================
        #10;
        address = 32'd20;
        read_enable = 1;

        #10 data_from_sram = 32'hDEADBEEF;

        #10 read_enable = 0;
        wait(ready);

        // Finish
        #20;
        $finish;
    end

endmodule