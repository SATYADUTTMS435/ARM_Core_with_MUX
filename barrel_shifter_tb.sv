`timescale 1ns/1ps

module barrel_shifter_tb;

    parameter N = 32;

    // =====================================================
    // DUT SIGNALS
    // =====================================================
    logic [N-1:0] in;
    logic [$clog2(N)-1:0] shift;
    logic [2:0] mode;
    logic [N-1:0] out;

    // =====================================================
    // MODE DEFINITIONS
    // =====================================================
    localparam LSR = 3'b000;
    localparam LSL = 3'b001;
    localparam ASR = 3'b010;
    localparam ROR = 3'b011;
    localparam ROL = 3'b100;

    // =====================================================
    // DUT
    // =====================================================
    barrel_shifter #(
        .N(N)
    ) dut (
        .in(in),
        .shift(shift),
        .mode(mode),
        .out(out)
    );

    // =====================================================
    // EXPECTED RESULT FUNCTION
    // =====================================================
    function automatic [N-1:0] expected_result(
        input [N-1:0] data,
        input [$clog2(N)-1:0] shamt,
        input [2:0] op
    );

        begin

            case(op)

                // -----------------------------------------
                // Logical Shift Right
                // -----------------------------------------
                LSR:
                    expected_result = data >> shamt;

                // -----------------------------------------
                // Logical Shift Left
                // -----------------------------------------
                LSL:
                    expected_result = data << shamt;

                // -----------------------------------------
                // Arithmetic Shift Right
                // -----------------------------------------
                ASR:
                    expected_result = $signed(data) >>> shamt;

                // -----------------------------------------
                // Rotate Right
                // -----------------------------------------
                ROR:
                    expected_result =
                        (data >> shamt) |
                        (data << (N-shamt));

                // -----------------------------------------
                // Rotate Left
                // -----------------------------------------
                ROL:
                    expected_result =
                        (data << shamt) |
                        (data >> (N-shamt));

                default:
                    expected_result = data;

            endcase

        end

    endfunction

    // =====================================================
    // VERIFICATION TASK
    // =====================================================
    task automatic check_output;

        logic [N-1:0] expected;

        begin

            expected = expected_result(in, shift, mode);

            #1;

            if(out !== expected)
            begin
                $display("========================================");
                $display("ERROR");
                $display("TIME      : %0t", $time);
                $display("MODE      : %03b", mode);
                $display("INPUT     : %h", in);
                $display("SHIFT     : %0d", shift);
                $display("EXPECTED  : %h", expected);
                $display("GOT       : %h", out);
                $display("========================================");
                $fatal;
            end
            else
            begin
                $display(
                    "PASS | mode=%03b in=%h shift=%0d out=%h",
                    mode,
                    in,
                    shift,
                    out
                );
            end

        end

    endtask

    // =====================================================
    // TEST SEQUENCE
    // =====================================================
    integer i;

    initial begin

        $display("\n=====================================");
        $display(" STARTING BARREL SHIFTER TESTBENCH ");
        $display("=====================================\n");

        // =================================================
        // EDGE CASES
        // =================================================

        // -----------------------------------------
        // All zeros
        // -----------------------------------------
        in    = 32'h00000000;
        shift = 0;

        for(int m=0; m<5; m++)
        begin
            mode = m;
            check_output();
        end

        // -----------------------------------------
        // All ones
        // -----------------------------------------
        in    = 32'hFFFFFFFF;
        shift = 31;

        for(int m=0; m<5; m++)
        begin
            mode = m;
            check_output();
        end

        // -----------------------------------------
        // Single bit
        // -----------------------------------------
        in    = 32'h00000001;
        shift = 1;

        for(int m=0; m<5; m++)
        begin
            mode = m;
            check_output();
        end

        // -----------------------------------------
        // MSB set
        // -----------------------------------------
        in    = 32'h80000000;
        shift = 4;

        for(int m=0; m<5; m++)
        begin
            mode = m;
            check_output();
        end

        // -----------------------------------------
        // Alternating pattern
        // -----------------------------------------
        in    = 32'hA5A5A5A5;
        shift = 8;

        for(int m=0; m<5; m++)
        begin
            mode = m;
            check_output();
        end

        // -----------------------------------------
        // Random hex
        // -----------------------------------------
        in    = 32'hFE0FFF12;
        shift = 8;

        for(int m=0; m<5; m++)
        begin
            mode = m;
            check_output();
        end

        // =================================================
        // RANDOMIZED TESTING
        // =================================================

        $display("\n=====================================");
        $display(" RANDOMIZED TESTING ");
        $display("=====================================\n");

        for(i = 0; i < 500; i++)
        begin

            in    = $urandom;
            shift = $urandom_range(0, N-1);
            mode  = $urandom_range(0, 4);

            check_output();

        end

        $display("\n=====================================");
        $display(" ALL TESTS PASSED ");
        $display("=====================================\n");

        $finish;

    end

endmodule
