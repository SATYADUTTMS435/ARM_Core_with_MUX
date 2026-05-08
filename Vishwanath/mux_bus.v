`timescale 1ns/1ns

// ============================================================
// ARM Style Shared Internal Bus using MUX
// 8-to-1 Bus Multiplexer
// ============================================================

module mux_bus #(
    parameter WIDTH = 32
)(
    input  [WIDTH-1:0] in0, // Register Rn
    input  [WIDTH-1:0] in1, // Register Rm
    input  [WIDTH-1:0] in2, // ALU Result
    input  [WIDTH-1:0] in3, // Barrel Shifter Output
    input  [WIDTH-1:0] in4, // MAC Output
    input  [WIDTH-1:0] in5, // Memory Read Data
    input  [WIDTH-1:0] in6, // PC + Incrementer
    input  [WIDTH-1:0] in7, // Sign Extended Immediate

    input  [2:0] sel,

    output reg [WIDTH-1:0] bus_out
);

always @(*) begin

    case(sel)

        3'b000: bus_out = in0;
        3'b001: bus_out = in1;
        3'b010: bus_out = in2;
        3'b011: bus_out = in3;
        3'b100: bus_out = in4;
        3'b101: bus_out = in5;
        3'b110: bus_out = in6;
        3'b111: bus_out = in7;

        default: bus_out = {WIDTH{1'b0}};

    endcase

end

endmodule