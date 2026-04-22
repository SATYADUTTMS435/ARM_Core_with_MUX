module tb;

  parameter N = 32;

  reg  [N-1:0] a, b;
  reg  [3:0] opcode;
  reg  carry_in;

  wire [N-1:0] result;
  wire cout;

  reg [32:0] expected;

  // DUT
  alu dut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .carry_in(carry_in),
    .result(result),
    .cout(cout)
  );

  // Reference model
  function [32:0] alu_ref;
    input [31:0] a, b;
    input [3:0] opcode;
    input carry_in;

    reg [32:0] tmp;

    begin
      case (opcode)

        // ADD
        4'b0000: tmp = a + b;

        // SUB
        4'b0001: begin
          tmp[31:0] = a - b;
          tmp[32]   = (a >= b);
        end

        // ADC
        4'b0010: tmp = a + b + carry_in;

        // AND
        4'b0011: tmp = {1'b0, (a & b)};

        // OR
        4'b0100: tmp = {1'b0, (a | b)};

        // XOR
        4'b0101: tmp = {1'b0, (a ^ b)};

        // MOV
        4'b0110: tmp = {1'b0, a};

        // MVN
        4'b0111: tmp = {1'b0, ~a};

        // CMP
        4'b1000: begin
          tmp[31:0] = a - b;
          tmp[32]   = (a >= b);
        end

        // CMN
        4'b1001: tmp = a + b;

        // BIC
        4'b1010: tmp = {1'b0, (a & ~b)};

        // RSB
        4'b1011: begin
          tmp[31:0] = b - a;
          tmp[32]   = (b >= a);
        end

        // SBC
        4'b1100: begin
          tmp[31:0] = a - b - (1 - carry_in);
          tmp[32]   = (a >= (b + (1 - carry_in)));
        end

        default: tmp = a + b;

      endcase

      alu_ref = tmp;
    end
  endfunction

  integer i;

  initial begin

    for (i = 0; i < 3000; i = i + 1) begin

      // Random inputs
      a = $random;
      b = $random;
      opcode = $random % 13;   // 0 to 12 only
      carry_in = $random % 2;

      #1;

      expected = alu_ref(a, b, opcode, carry_in);

      if (opcode == 4'b1000 || opcode == 4'b1001) begin
        if (cout !== expected[32]) begin
          $display("ERROR: Flag mismatch opcode=%d a=%h b=%h", opcode, a, b);
        end
      end
      else begin
        if ({cout, result} !== expected) begin
          $display("ERROR: Mismatch opcode=%d a=%h b=%h", opcode, a, b);
        end
      end

    end

    $display("TEST COMPLETED");
    $finish;

  end

endmodule
