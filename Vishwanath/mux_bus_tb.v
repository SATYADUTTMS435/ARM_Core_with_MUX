`timescale 1ns/1ns

module mux_bus_tb;

    // =========================================================
    // ARM Datapath Inputs
    // =========================================================

    reg [31:0] in0; // Register Rn
    reg [31:0] in1; // Register Rm
    reg [31:0] in2; // ALU Result
    reg [31:0] in3; // Barrel Shifter Output
    reg [31:0] in4; // MAC Output
    reg [31:0] in5; // Memory Read Data
    reg [31:0] in6; // PC + Incrementer
    reg [31:0] in7; // Sign Extended Immediate

    reg [2:0] sel;

    wire [31:0] bus_out;

    // =========================================================
    // DUT : Device Under Test
    // =========================================================

    mux_bus dut (

        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .in5(in5),
        .in6(in6),
        .in7(in7),

        .sel(sel),

        .bus_out(bus_out)

    );

    // =========================================================
    // Simulation
    // =========================================================

    initial begin

        // =====================================================
        // Assign ARM-style datapath values
        // =====================================================

        in0 = 32'h1111_1111; // Register Rn
        in1 = 32'h2222_2222; // Register Rm
        in2 = 32'h3333_3333; // ALU Result
        in3 = 32'h4444_4444; // Barrel Shifter Output
        in4 = 32'h5555_5555; // MAC Output
        in5 = 32'h6666_6666; // Memory Read Data
        in6 = 32'h7777_7777; // PC + Incrementer
        in7 = 32'h8888_8888; // Sign Extended Immediate

        $display("==============================================");
        $display("     ARM STYLE BUS MUX SIMULATION STARTED     ");
        $display("==============================================");

        // =====================================================
        // Register Rn
        // =====================================================

        sel = 3'b000;
        #10;

        $display("sel = %b -> bus_out = %h (Register Rn Selected)",
                  sel, bus_out);

        // =====================================================
        // Register Rm
        // =====================================================

        sel = 3'b001;
        #10;

        $display("sel = %b -> bus_out = %h (Register Rm Selected)",
                  sel, bus_out);

        // =====================================================
        // ALU Result
        // =====================================================

        sel = 3'b010;
        #10;

        $display("sel = %b -> bus_out = %h (ALU Result Selected)",
                  sel, bus_out);

        // =====================================================
        // Barrel Shifter Output
        // =====================================================

        sel = 3'b011;
        #10;

        $display("sel = %b -> bus_out = %h (Barrel Shifter Output Selected)",
                  sel, bus_out);

        // =====================================================
        // MAC Output
        // =====================================================

        sel = 3'b100;
        #10;

        $display("sel = %b -> bus_out = %h (MAC Output Selected)",
                  sel, bus_out);

        // =====================================================
        // Memory Read Data
        // =====================================================

        sel = 3'b101;
        #10;

        $display("sel = %b -> bus_out = %h (Memory Read Data Selected)",
                  sel, bus_out);

        // =====================================================
        // PC + Incrementer
        // =====================================================

        sel = 3'b110;
        #10;

        $display("sel = %b -> bus_out = %h (PC + Incrementer Selected)",
                  sel, bus_out);

        // =====================================================
        // Sign Extended Immediate
        // =====================================================

        sel = 3'b111;
        #10;

        $display("sel = %b -> bus_out = %h (Sign Extended Immediate Selected)",
                  sel, bus_out);

        $display("==============================================");
        $display("           ALL TESTS COMPLETED                ");
        $display("==============================================");

        $finish;

    end

endmodule