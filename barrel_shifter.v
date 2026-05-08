`timescale 1ns/1ps

// -------------------------------------------------
// mode:
// 000 -> Logical Shift Right  (LSR)
// 001 -> Logical Shift Left   (LSL / ASL)
// 010 -> Arithmetic Shift Right (ASR)
// 011 -> Rotate Right         (ROR)
// 100 -> Rotate Left          (ROL)
// -------------------------------------------------

module barrel_shifter #(
    parameter N = 32
)(
    input  [N-1:0] in,
    input  [$clog2(N)-1:0] shift,
    input  [2:0] mode,
    output [N-1:0] out
);

    localparam LSR = 3'b000;
    localparam LSL = 3'b001;
    localparam ASR = 3'b010;
    localparam ROR = 3'b011;
    localparam ROL = 3'b100;

    localparam STAGES = $clog2(N);

    wire [N-1:0] stage [0:STAGES];

    assign stage[0] = in;

    genvar s, i;

    generate

        for(s = 0; s < STAGES; s = s + 1)
        begin : STAGE_GEN

            localparam SHIFT_AMT = (1 << s);

            for(i = 0; i < N; i = i + 1)
            begin : BIT_GEN

                wire shift_bit;

                assign shift_bit =

                    (mode == LSR) ?

                        ((i + SHIFT_AMT < N) ?
                            stage[s][i + SHIFT_AMT] :
                            1'b0)

                    :

                    (mode == LSL) ?

                        ((i >= SHIFT_AMT) ?
                            stage[s][i - SHIFT_AMT] :
                            1'b0)

                    :

                    (mode == ASR) ?

                        ((i + SHIFT_AMT < N) ?
                            stage[s][i + SHIFT_AMT] :
                            stage[s][N-1])

                    :

                    (mode == ROR) ?

                        stage[s][(i + SHIFT_AMT)%N]

                    :

                    (mode == ROL) ?

                        stage[s][(i - SHIFT_AMT + N)%N]

                    :

                    stage[s][i];


                mux m0 (
                    .in  ({shift_bit, stage[s][i]}),
                    .sel (shift[s]),
                    .out (stage[s+1][i])
                );

            end

        end

    endgenerate

    assign out = stage[STAGES];

endmodule



module mux #(
    parameter n = 1,
    parameter w = 1
)(
    input  [(1 << n)*w - 1:0] in,
    input  [n-1:0] sel,
    output reg [w-1:0] out
);

    always @(*)
    begin
        out = in[sel*w +: w];
    end

endmodule
