`timescale 1ns/1ps

module ARM(

    input clk,
    input rst

);

    wire [31:0] bus_out;
    wire hazard_stall;

    reg [15:0] IF_ID_instr;
    reg [7:0]  IF_ID_pc;
    reg [31:0] ID_EX_A;
    reg [31:0] ID_EX_B;

    reg [2:0]  ID_EX_Rd;

    reg [4:0]  ID_EX_alu_opcode;
    reg [4:0]  ID_EX_shift_opcode;

    reg [2:0]  ID_EX_bus_sel;

    reg        ID_EX_WriteEn;
    reg        ID_EX_CPSR_WriteEn;
    reg        ID_EX_mem_we;

    reg [31:0] ID_EX_imm_ext;

    reg [31:0] EX_MEM_alu_out;
    reg [31:0] EX_MEM_shift_out;
    reg [31:0] EX_MEM_mult_out;
    reg [31:0] EX_MEM_div_out;

    reg [31:0] EX_MEM_mem_din;
    reg [31:0] EX_MEM_addr;

    reg [31:0] EX_MEM_imm_ext;

    reg [2:0] EX_MEM_bus_sel;

    reg [2:0] EX_MEM_Rd;

    reg EX_MEM_WriteEn;
    reg EX_MEM_CPSR_WriteEn;

    reg EX_MEM_mem_we;

    reg [31:0] MEM_WB_bus_out;

    reg [2:0] MEM_WB_Rd;

    reg MEM_WB_WriteEn;
    reg MEM_WB_CPSR_WriteEn;

    // ============================================================
    // PROGRAM COUNTER
    // ============================================================

    wire [7:0] pc_addr;
    wire branch_en;

    wire signed [7:0] branch_offset;
    wire [7:0] branch_target;

    assign branch_target = IF_ID_pc + branch_offset;

    PC pc_inst(
        .clk(clk),
        .rst(rst),
        .pc_en(~hazard_stall),
        .branch_en(branch_en),
        .branch_addr(branch_target),
        .pc_addr(pc_addr)
    );

    // ============================================================
    // INSTRUCTION MEMORY
    // ============================================================

    wire [15:0] instruction;

    InstructionMemory imem(
        .addr(pc_addr),
        .instruction(instruction)
    );

    // ============================================================
    // CONTROL UNIT
    // ============================================================

    wire [2:0] Rd;
    wire [2:0] Rn;
    wire [2:0] Rm;

    wire [3:0] imm4;

    wire [4:0] alu_opcode;
    wire [4:0] shift_opcode;

    wire [2:0] bus_sel;

    wire WriteEn;
    wire CPSR_WriteEn;

    wire mem_we;

    wire [31:0] CPSR_out;

    Control_Unit cu(

        .instr(IF_ID_instr),
        .CPSR(CPSR_out),

        .Rd(Rd),
        .Rn(Rn),
        .Rm(Rm),

        .imm4(imm4),

        .alu_opcode(alu_opcode),
        .shift_opcode(shift_opcode),

        .bus_sel(bus_sel),

        .WriteEn(WriteEn),
        .CPSR_WriteEn(CPSR_WriteEn),

        .mem_we(mem_we),
        .branch_en(branch_en)

    );

    // ============================================================
    // SIGN EXTENDER
    // ============================================================

    wire [31:0] imm_ext;

    sign_extend signext(
        .in(imm4),
        .out(imm_ext)
    );

    assign branch_offset = ID_EX_imm_ext[7:0];

    // ============================================================
    // REGISTER FILE
    // ============================================================

    wire [31:0] regA;
    wire [31:0] regB;

    wire N_flag;
    wire Z_flag;
    wire C_flag;
    wire V_flag;

    RegisterFile rf(

        .clk(clk),
        .rst(rst),

        .Rn(Rn),
        .Rm(Rm),
        .Rd(MEM_WB_Rd),

        .Result(MEM_WB_bus_out),

        .WriteEn(MEM_WB_WriteEn),

        .CPSR_WriteEn(MEM_WB_CPSR_WriteEn),

        .N_flag(N_flag),
        .Z_flag(Z_flag),
        .C_flag(C_flag),
        .V_flag(V_flag),

        .A(regA),
        .B(regB),

        .CPSR_out(CPSR_out)

    );

    // ============================================================
    // ALU
    // ============================================================

    wire [31:0] alu_out;
    wire alu_cout;

    alu alu_inst(

        .a(ID_EX_A),
        .b(ID_EX_B),

        .opcode(ID_EX_alu_opcode),

        .carry_in(CPSR_out[29]),

        .result(alu_out),
        .cout(alu_cout)

    );

    // ============================================================
    // FLAGS
    // ============================================================

    assign N_flag = alu_out[31];
    assign Z_flag = (alu_out == 32'd0);
    assign C_flag = alu_cout;
    assign V_flag = 1'b0;

    // ============================================================
    // BARREL SHIFTER
    // ============================================================

    wire [31:0] shift_out;

    barrel_shifter shifter(

        .in(ID_EX_A),

        .shift(ID_EX_B[4:0]),

        .mode(ID_EX_shift_opcode),

        .out(shift_out)

    );

    // ============================================================
    // MULTIPLIER
    // ============================================================

    wire [31:0] mult_out;

    booth #(
        .X(16),
        .Y(16)
    ) mult_inst (

        .M(ID_EX_A[15:0]),
        .Q(ID_EX_B[15:0]),

        .P(mult_out)

    );

    // ============================================================
    // DIVIDER
    // ============================================================

    wire [31:0] div_q;

    divider div_inst(
    
        .a(ID_EX_A),
        .b(ID_EX_B),
    
        .q(div_q)
    
    );
    
    // ============================================================
    // DATA MEMORY
    // ============================================================

    wire [31:0] mem_out;

    SRAM data_mem(

    .clk(clk),

    .we(EX_MEM_mem_we),

    .addr(EX_MEM_addr[7:0]),

    .din(EX_MEM_mem_din),

    .dout(mem_out)

    );

    // ============================================================
    // BUS
    // ============================================================


    BUS bus_inst(

        .alu_out(EX_MEM_alu_out),

        .shift_out(EX_MEM_shift_out),

        .mac_out(EX_MEM_mult_out),

        .div_out(EX_MEM_div_out),

        .mem_out(mem_out),

        .imm_out(EX_MEM_imm_ext),

        .pc_out({24'd0, IF_ID_pc}),

        .bus_sel(EX_MEM_bus_sel),

        .bus_out(bus_out)

    );

    // ============================================================
    // HAZARD DETECTION UNIT
    // ============================================================
    
    HazardDetectionUnit hdu(

    .IF_ID_Rn(Rn),
    .IF_ID_Rm(Rm),

    .ID_EX_Rd(ID_EX_Rd),
    .EX_MEM_Rd(EX_MEM_Rd),
    .MEM_WB_Rd(MEM_WB_Rd),

    .ID_EX_WriteEn(ID_EX_WriteEn),
    .EX_MEM_WriteEn(EX_MEM_WriteEn),
    .MEM_WB_WriteEn(MEM_WB_WriteEn),

    .stall(hazard_stall)

    );

    // ============================================================
    // IF/ID PIPELINE REGISTER
    // ============================================================

    always @(posedge clk or posedge rst)
    begin

        if(rst)
        begin
            IF_ID_instr <= 16'd0;
            IF_ID_pc    <= 8'd0;
        end

        else if (!hazard_stall)
        begin
            IF_ID_instr <= instruction;
            IF_ID_pc    <= pc_addr;
        end

    end

    // ============================================================
    // ID/EX PIPELINE REGISTER
    // ============================================================

    always @(posedge clk or posedge rst)
    begin

        if(rst)
        begin

            ID_EX_A <= 0;
            ID_EX_B <= 0;

            ID_EX_Rd <= 0;

            ID_EX_alu_opcode <= 0;
            ID_EX_shift_opcode <= 0;

            ID_EX_bus_sel <= 0;

            ID_EX_WriteEn <= 0;
            ID_EX_CPSR_WriteEn <= 0;
            ID_EX_mem_we <= 0;

            ID_EX_imm_ext <= 0;

        end

        else if(hazard_stall)
        begin

            ID_EX_A <= 0;
            ID_EX_B <= 0;

            ID_EX_Rd <= 0;

            ID_EX_alu_opcode <= 0;
            ID_EX_shift_opcode <= 0;

            ID_EX_bus_sel <= 0;

            ID_EX_WriteEn <= 0;
            ID_EX_CPSR_WriteEn <= 0;

            ID_EX_mem_we <= 0;

            ID_EX_imm_ext <= 0;

        end

        else
        begin
            ID_EX_A <= regA;
            ID_EX_B <= regB;

            ID_EX_Rd <= Rd;

            ID_EX_alu_opcode <= alu_opcode;
            ID_EX_shift_opcode <= shift_opcode;

            ID_EX_bus_sel <= bus_sel;

            ID_EX_WriteEn <= WriteEn;
            ID_EX_CPSR_WriteEn <= CPSR_WriteEn;

            ID_EX_mem_we <= mem_we;

            ID_EX_imm_ext <= imm_ext;
        end

    end

    // ============================================================
    // EX/MEM PIPELINE REGISTER
    // ============================================================

    always @(posedge clk or posedge rst)
    begin

        if(rst)
        begin

            EX_MEM_alu_out <= 0;
            EX_MEM_shift_out <= 0;
            EX_MEM_mult_out <= 0;
            EX_MEM_div_out <= 0;

            EX_MEM_mem_din <= 0;

            EX_MEM_imm_ext <= 0;

            EX_MEM_bus_sel <= 0;

            EX_MEM_Rd <= 0;

            EX_MEM_WriteEn <= 0;
            EX_MEM_CPSR_WriteEn <= 0;

            EX_MEM_mem_we <= 0;
            EX_MEM_addr <= 0;

        end

        else
        begin

            EX_MEM_alu_out <= alu_out;
            EX_MEM_shift_out <= shift_out;
            EX_MEM_mult_out <= mult_out;
            EX_MEM_div_out <= div_q;

            EX_MEM_mem_din <= ID_EX_B;

            EX_MEM_imm_ext <= ID_EX_imm_ext;

            EX_MEM_bus_sel <= ID_EX_bus_sel;

            EX_MEM_Rd <= ID_EX_Rd;

            EX_MEM_WriteEn <= ID_EX_WriteEn;
            EX_MEM_CPSR_WriteEn <= ID_EX_CPSR_WriteEn;

            EX_MEM_mem_we <= ID_EX_mem_we;
            EX_MEM_addr <= ID_EX_A;

        end

    end

    // ============================================================
    // MEM/WB PIPELINE REGISTER
    // ============================================================

    always @(posedge clk or posedge rst)
    begin

        if(rst)
        begin

            MEM_WB_bus_out <= 0;

            MEM_WB_Rd <= 0;

            MEM_WB_WriteEn <= 0;
            MEM_WB_CPSR_WriteEn <= 0;

        end

        else
        begin

            MEM_WB_bus_out <= bus_out;

            MEM_WB_Rd <= EX_MEM_Rd;

            MEM_WB_WriteEn <= EX_MEM_WriteEn;
            MEM_WB_CPSR_WriteEn <= EX_MEM_CPSR_WriteEn;

        end

    end

endmodule

module Control_Unit(

    input  [15:0] instr,
    input  [31:0] CPSR,

    // Decoded Register Fields
    output [2:0] Rd,
    output [2:0] Rn,
    output [2:0] Rm,

    // Immediate
    output [3:0] imm4,

    // ALU / Shifter Control
    output reg [4:0] alu_opcode,
    output reg [4:0] shift_opcode,

    // BUS Control
    output reg [2:0] bus_sel,

    // Register File Control
    output reg WriteEn,
    output reg CPSR_WriteEn,

    // Memory Control
    output reg mem_we,

    // Branch Control
    output reg branch_en

);

    // ============================================================
    // OPCODES
    // ============================================================

    localparam NOP   = 5'b00000;

    localparam ADDS  = 5'b00001;
    localparam SUBS  = 5'b00010;
    localparam ADCS  = 5'b00011;
    localparam ANDD  = 5'b00100;
    localparam ORR   = 5'b00101;
    localparam XORR  = 5'b00110;
    localparam MOV   = 5'b00111;
    localparam MVN   = 5'b01000;
    localparam CMP   = 5'b01001;
    localparam CMN   = 5'b01010;
    localparam BIC   = 5'b01011;
    localparam RSB   = 5'b01100;
    localparam SBC   = 5'b01101;

    localparam SMULL = 5'b01110;
    localparam UDIV  = 5'b01111;

    localparam LSR   = 5'b10000;
    localparam LSL   = 5'b10001;
    localparam ASR   = 5'b10010;
    localparam ROR   = 5'b10011;
    localparam ROL   = 5'b10100;

    localparam LDR   = 5'b10101;
    localparam STR   = 5'b10110;

    localparam BNE   = 5'b10111;
    localparam BEQ   = 5'b11000;

    localparam MOVI  = 5'b11001;

    // ============================================================
    // INSTRUCTION DECODE
    // ============================================================

    wire [4:0] opcode;
    wire       Imm;

    assign opcode = instr[15:11];
    assign Imm    = instr[10];

    assign Rd = instr[9:7];
    assign Rn = instr[6:4];
    assign Rm = instr[3:1];

    assign imm4 = instr[3:0];

    // ============================================================
    // CPSR FLAGS
    // ============================================================

    wire N_flag;
    wire Z_flag;
    wire C_flag;
    wire V_flag;

    assign N_flag = CPSR[31];
    assign Z_flag = CPSR[30];
    assign C_flag = CPSR[29];
    assign V_flag = CPSR[28];

    // ============================================================
    // CONTROL LOGIC
    // ============================================================

    always @(*)
    begin

        // --------------------------------------------------------
        // DEFAULTS
        // --------------------------------------------------------

        alu_opcode     = opcode;
        shift_opcode   = opcode;

        bus_sel        = 3'b000;

        WriteEn        = 1'b0;
        CPSR_WriteEn   = 1'b0;

        mem_we         = 1'b0;

        branch_en      = 1'b0;

        // --------------------------------------------------------
        // OPCODE DECODE
        // --------------------------------------------------------

        case(opcode)

            // ====================================================
            // NOP
            // ====================================================

            NOP:
            begin
            end

            // ====================================================
            // ALU OPERATIONS
            // ====================================================

            ADDS,
            SUBS,
            ADCS,
            ANDD,
            ORR,
            XORR,
            MOV,
            MVN,
            BIC,
            RSB,
            SBC:
            begin

                bus_sel      = 3'b000; // ALU
                WriteEn      = 1'b1;

                CPSR_WriteEn = 1'b1;

            end

            // ====================================================
            // CMP / CMN
            // ====================================================

            CMP,
            CMN:
            begin

                bus_sel      = 3'b000;

                WriteEn      = 1'b0;

                CPSR_WriteEn = 1'b1;

            end

            // ====================================================
            // MULTIPLIER
            // ====================================================

            SMULL:
            begin

                bus_sel = 3'b010; // MULT
                WriteEn = 1'b1;

            end

            // ====================================================
            // DIVIDER
            // ====================================================

            UDIV:
            begin

                 bus_sel = 3'b011;
                 WriteEn = 1'b1;

            end

            // ====================================================
            // SHIFTER
            // ====================================================

            LSR,
            LSL,
            ASR,
            ROR,
            ROL:
            begin

                bus_sel = 3'b001; // SHIFTER
                WriteEn = 1'b1;

            end

            // ====================================================
            // LOAD
            // ====================================================

            LDR:
            begin

                bus_sel = 3'b100; // SRAM
                WriteEn = 1'b1;

            end

            // ====================================================
            // STORE
            // ====================================================

            STR:
            begin

                mem_we = 1'b1;

            end

            // ====================================================
            // BRANCH NOT EQUAL
            // ====================================================

            BNE:
            begin

                if(!Z_flag)
                    branch_en = 1'b1;

            end

            // ====================================================
            // BRANCH EQUAL
            // ====================================================

            BEQ:
            begin

                if(Z_flag)
                    branch_en = 1'b1;

            end

            // ====================================================
            // MOV IMMEDIATE
            // ====================================================

            MOVI:
            begin

                bus_sel = 3'b101; // IMMEDIATE
                WriteEn = 1'b1;

            end

            // ====================================================
            // DEFAULT
            // ====================================================

            default:
            begin
            end

        endcase

    end

endmodule

module HazardDetectionUnit(
    input [2:0] IF_ID_Rn,
    input [2:0] IF_ID_Rm,

    input [2:0] ID_EX_Rd,
    input [2:0] EX_MEM_Rd,
    input [2:0] MEM_WB_Rd,

    input ID_EX_WriteEn,
    input EX_MEM_WriteEn,
    input MEM_WB_WriteEn,

    output reg stall
);

    always @(*)
    begin

        stall = 0;

        // EX hazard
        if (
            ID_EX_WriteEn &&
            (
                (IF_ID_Rn == ID_EX_Rd) ||
                (IF_ID_Rm == ID_EX_Rd)
            ) &&
            (ID_EX_Rd != 3'b000)
        )
            stall = 1;

        // MEM hazard
        else if (
            EX_MEM_WriteEn &&
            (
                (IF_ID_Rn == EX_MEM_Rd) ||
                (IF_ID_Rm == EX_MEM_Rd)
            ) &&
            (EX_MEM_Rd != 3'b000)
        )
            stall = 1;

        // WB hazard
        else if (
            MEM_WB_WriteEn &&
            (
                (IF_ID_Rn == MEM_WB_Rd) ||
                (IF_ID_Rm == MEM_WB_Rd)
            ) &&
            (MEM_WB_Rd != 3'b000)
        )
            stall = 1;

    end

endmodule

module divider(

    input  [31:0] a,
    input  [31:0] b,

    output [31:0] q

);

    assign q = (b != 0) ? (a / b) : 32'd0;

endmodule

module barrel_shifter #(
    parameter N = 32
)(
    input  [N-1:0] in,
    input  [$clog2(N)-1:0] shift,
    input  [4:0] mode,
    output [N-1:0] out
);

    localparam LSR = 5'b10000;
    localparam LSL = 5'b10001;
    localparam ASR = 5'b10010;
    localparam ROR = 5'b10011;
    localparam ROL = 5'b10100;

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

module booth #(
	parameter X = 16,
	parameter Y = 16
	) (
	input  signed [X-1:0] M,
	input  signed [Y-1:0] Q,
	output signed [X+Y-1:0] P
);
	
    // OPCODE: 01110: SMULL
    
    integer i;
	reg signed [X+Y+3:0] A, S, P_t;

	always @(*)
	begin

		A   =  $signed(M) <<< (Y+1);
		S   = -($signed(M) <<< (Y+1));
		P_t = {{X{1'b0}}, Q, 1'b0};

		for (i = 0; i < Y/2; i = i + 1)
		begin
			case (P_t[2:0])
				3'b001, 3'b010: P_t = P_t + A;
				3'b011: P_t = P_t + (A <<< 1);
				3'b100: P_t = P_t + (S <<< 1);
				3'b101, 3'b110: P_t = P_t + S;
				default: P_t = P_t + {(X+Y+4){1'b0}};
			endcase

			P_t = P_t >>> 2;
		end
	end


	assign P = P_t[X+Y:1];

endmodule

module alu #(
	parameter N = 32
)(
	input  [N-1:0] a, b,
	input  [4:0] opcode,
	input  carry_in,
	output reg [N-1:0] result,
	output reg cout
);

	wire [N-1:0] add_out, sub_out, adc_out;
	wire [N-1:0] and_out, or_out, xor_out, bic_out, rsb_out, sbc_out;
	wire add_cout, sub_cout, adc_cout, rsb_cout, sbc_cout;

 	conditional_adder add_block (a, b, 1'b0, add_out, add_cout);
	conditional_adder sub_block (a, ~b, 1'b1, sub_out, sub_cout);
	conditional_adder adc_block (a, b, carry_in, adc_out, adc_cout);
	conditional_adder rsb_block (b, ~a, 1'b1, rsb_out, rsb_cout);
	conditional_adder sbc_block (a, ~b, carry_in, sbc_out, sbc_cout);
	and_N #(N) and_block (a, b, and_out);
	or_N  #(N) or_block  (a, b, or_out);
	xor_N #(N) xor_block (a, b, xor_out);
	and_N #(N) bic_block (a, ~b, bic_out);

	always @(*)
	begin
		result = 0;
		cout = carry_in;
		case (opcode)
			5'b00001: begin result = add_out; cout = add_cout; end    // ADDS
			5'b00010: begin result = sub_out; cout = sub_cout; end    // SUBS
			5'b00011: begin result = adc_out; cout = adc_cout; end    // ADCS
			5'b00100: begin result = and_out; cout = 0; end           // AND
			5'b00101: begin result = or_out;  cout = 0; end           // ORR
			5'b00110: begin result = xor_out; cout = 0; end           // EOR
			5'b00111: begin result = a;  cout = 0; end                // MOV
			5'b01000: begin result = ~a; cout = 0; end                // MVN
			5'b01001: begin result = 0; cout = sub_cout; end          // CMP
			5'b01010: begin result = 0; cout = add_cout; end          // CMN
			5'b01011: begin result = bic_out; cout = 0; end           // BIC
			5'b01100: begin result = rsb_out; cout = rsb_cout; end    // RSB
			5'b01101: begin result = sbc_out; cout = sbc_cout; end    // SBC
			default: begin result = add_out; cout = add_cout; end
        	endcase
        end

endmodule

module conditional_adder #(
	parameter N = 32
)(
	input [N-1:0]a, b,
	input cin,
	output [N-1:0]sum,
	output cout
);

	wire [N-1:0]out1, out2;
	wire out3, out4;

	rca #(N) rca1 (a, b, 1'b0, out1, out3);
	rca #(N) rca2 (a, b, 1'b1, out2, out4);

	mux #(.n(1), .w(N+1)) mux1 ({{out4, out2}, {out3, out1}}, cin, {cout, sum});

endmodule

module rca #(
	parameter N = 32
)(
	input [N-1:0]a, b,
	input cin,
	output [N-1:0]sum,
	output cout
);

	wire [N:0] carry;
	assign carry[0] = cin;

	genvar i;
	generate
	for (i = 0; i < N; i = i + 1) begin : FA
		adder fa_inst (
		.a   (a[i]),
		.b   (b[i]),
		.cin (carry[i]),
		.sum (sum[i]),
		.cout(carry[i+1])
	);
	end
	endgenerate

	assign cout = carry[N];

endmodule

module adder(
	input a, b, cin,
	output sum, cout
);
	wire out1, out2, out3, out4;

	mux mux1({~cin, cin}, b, out1);
	mux mux2({b, ~b}, cin, out2);
	mux mux3({out2, out1}, a, sum);

	mux mux4({1'b1, cin}, b, out3);
	mux mux5({b, 1'b0}, cin, out4);
	mux mux6({out3, out4}, a, cout);
endmodule

module and_N #(
	parameter N = 32
)(
	input [N-1:0] a, b,
	output [N-1:0] y
);

	genvar i;
	generate
		for (i = 0; i < N; i = i + 1) begin : GEN_AND
			mux m (
				.in({b[i], 1'b0}),
				.sel(a[i]),
				.out(y[i])
			);
		end
	endgenerate

endmodule

module or_N #(
	parameter N = 32
)(
	input [N-1:0] a, b,
	output [N-1:0] y
);

	genvar i;
	generate
		for (i = 0; i < N; i = i + 1) begin : GEN_OR
			mux m (
				.in({1'b1, b[i]}),
				.sel(a[i]),
				.out(y[i])
			);
		end
	endgenerate

endmodule

module xor_N #(
	parameter N = 32
)(
	input [N-1:0] a, b,
	output [N-1:0] y
);

	genvar i;
	generate
		for (i = 0; i < N; i = i + 1) begin : GEN_XOR
			mux m (
				.in({~b[i], b[i]}),
				.sel(a[i]),
				.out(y[i])
			);
		end
	endgenerate

endmodule

module mux #(
	parameter n = 1,
	parameter w = 1
)(
	input  [(1 << n)*w - 1:0] in,
	input  [n - 1:0] sel,
	output reg [w-1:0] out
);

	always @(*)
	begin
		out = in[sel*w +: w];
	end

endmodule

module RegisterFile (
    input         clk,
    input         rst,
    input  [2:0]  Rn,          
    input  [2:0]  Rm,          
    input  [2:0]  Rd,          
    input  [31:0] Result,      
    input         WriteEn,     
    input         CPSR_WriteEn,
    input         N_flag,      
    input         Z_flag,      
    input         C_flag,      
    input         V_flag,      
    output [31:0] A,           
    output [31:0] B,               
    output [31:0] CPSR_out     
);

    // Register array r0-r7 
    reg [31:0] RF [0:7];  
    reg N, Z, C, V;

    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i <= 7; i = i + 1)
                RF[i] <= 32'd0;
            N <= 1'b0; Z <= 1'b0; C <= 1'b0; V <= 1'b0;
        end
    end

    // Write on NEGEDGE clock
    always @(negedge clk) begin
        if (!rst) begin
            // General-purpose register write (r0-r7 including PC)
            if (WriteEn)
                RF[Rd] <= Result;

            // CPSR flag update (separate enable keeps flags independent)
            if (CPSR_WriteEn) begin
                N <= N_flag;
                Z <= Z_flag;
                C <= C_flag;
                V <= V_flag;
            end
        end
    end

    // Combinational (async) reads 
    assign A        = RF[Rn];                      
    assign B        = RF[Rm];                                            
    assign CPSR_out = {N, Z, C, V, 28'b0};        

endmodule

module PC(
    input        clk,
    input        rst,
    input        branch_en,
    input        pc_en,
    input  [7:0] branch_addr,
    output reg [7:0] pc_addr
);

wire [7:0] next_pc;

assign next_pc = (branch_en) ? branch_addr : (pc_addr + 8'd1);

always @(posedge clk or posedge rst)
begin
    if (rst)
        pc_addr <= 8'd0;

    else if (pc_en)
        pc_addr <= next_pc;
end

endmodule

module InstructionMemory(

    input  [7:0] addr,
    output [15:0] instruction

);

    reg [15:0] mem [0:255];

    initial
    begin
        // =====================================================================
        // PROGRAM 1 : BASIC ARITHMETIC
        // =====================================================================
        // MOVI r0, #5
        // MOVI r1, #3
        // ADDS r2, r0, r1       r2 = 5 + 3 = 8
        // SUBS r3, r2, r1       r3 = 8 - 3 = 5
        // NOP
        // =====================================================================
        
        // mem[0] = 16'b11001_1_000_000_0101;   // MOVI r0, #5
        // mem[1] = 16'b11001_1_001_000_0011;   // MOVI r1, #3
        // mem[2] = 16'b00001_0_010_000_001_0;  // ADDS r2, r0, r1
        // mem[3] = 16'b00010_0_011_010_001_0;  // SUBS r3, r2, r1
        // mem[4] = 16'b00000_0_000_000_000_0;  // NOP
        
        // =====================================================================
        // PROGRAM 2 : FLAGS + BRANCH TEST
        // =====================================================================
        // MOVI r0, #5
        // MOVI r1, #5
        // CMP  r0, r1           sets Z flag (equal)
        // BEQ  +2               branch if equal → skip mem[4]
        // MOVI r2, #1           SKIPPED
        // MOVI r2, #-7           EXECUTES
        // NOP
        // =====================================================================
        
        // mem[0] = 16'b11001_1_000_000_0101;   // MOVI r0, #5
        // mem[1] = 16'b11001_1_001_000_0101;   // MOVI r1, #5
        // mem[2] = 16'b01001_0_000_000_001_0;  // CMP  r0, r1
        // mem[3] = 16'b11000_00000000010;      // BEQ  +2
        // mem[4] = 16'b11001_1_010_000_0001;   // MOVI r2, #1  (SKIPPED)
        // mem[5] = 16'b11001_1_010_000_1001;   // MOVI r2, #-7  (EXECUTES)
        // mem[6] = 16'b00000_0_000_000_000_0;  // NOP
        
        // =====================================================================
        // PROGRAM 3 : BARREL SHIFTER TEST
        // =====================================================================
        // MOVI r0, #4
        // MOVI r1, #1            shift amount = 1
        // LSL  r2, r0, r1        r2 = 4 << 1 = 8
        // LSR  r3, r2, r1        r3 = 8 >> 1 = 4
        // ROL  r4, r0, r1        r4 = rotate_left(4, 1)  = 8
        // ROR  r5, r4, r1        r5 = rotate_right(8, 1) = 4
        // NOP
        // =====================================================================
        
        // mem[0] = 16'b11001_1_000_000_0100;   // MOVI r0, #4
        // mem[1] = 16'b11001_1_001_000_0001;   // MOVI r1, #1
        // mem[2] = 16'b10001_0_010_000_001_0;  // LSL  r2, r0, r1   → r2 = 8
        // mem[3] = 16'b10000_0_011_010_001_0;  // LSR  r3, r2, r1   → r3 = 4
        // mem[4] = 16'b10100_0_100_000_001_0;  // ROL  r4, r0, r1   → r4 = 8
        // mem[5] = 16'b10011_0_101_100_001_0;  // ROR  r5, r4, r1   → r5 = 4
        // mem[6] = 16'b00000_0_000_000_000_0;  // NOP
        
        // =====================================================================
        // PROGRAM 4 : SRAM LOAD / STORE TEST
        // =====================================================================
        // MOVI r0, #2            address = 2
        // MOVI r1, #7            data    = 7
        // STR  r1, [r0]          MEM[r0] = r1       MEM[2] = 7
        // LDR  r2, [r0]          r2      = MEM[r0]  r2     = 7
        // NOP
        // =====================================================================
        
        // mem[0] = 16'b11001_1_000_000_0010;   // MOVI r0, #2
        // mem[1] = 16'b11001_1_001_000_0111;   // MOVI r1, #7
        // mem[2] = 16'b10110_0_000_000_001_0;  // STR  r1, [r0]   Rn=r0 Rm=r1
        // mem[3] = 16'b10101_0_010_000_000_0;  // LDR  r2, [r0]   Rd=r2 Rn=r0
        // mem[4] = 16'b00000_0_000_000_000_0;  // NOP
        
        // =====================================================================
        // PROGRAM 5 : BOOTH MULTIPLIER TEST
        // =====================================================================
        // MOVI r0, #3
        // MOVI r1, #-2           signed 4-bit: 1110 = -2
        // SMULL r2, r0, r1       r2 = 3 × (-2) = -6
        // MOVI r3, #4
        // SMULL r4, r2, r3       r4 = (-6) × 4 = -24
        // NOP
        // =====================================================================
        
        // mem[0] = 16'b11001_1_000_000_0011;   // MOVI  r0, #3
        // mem[1] = 16'b11001_1_001_000_1110;   // MOVI  r1, #-2  (1110)
        // mem[2] = 16'b01110_0_010_000_001_0;  // SMULL r2, r0, r1  → r2 = -6
        // mem[3] = 16'b11001_1_011_000_0100;   // MOVI  r3, #4
        // mem[4] = 16'b01110_0_100_010_011_0;  // SMULL r4, r2, r3  → r4 = -24
        // mem[5] = 16'b00000_0_000_000_000_0;  // NOP
        
        // =====================================================================
        // PROGRAM 6 : DIVIDER + STALL TEST
        // =====================================================================
        // MOVI r0, #6            dividend = 6
        // MOVI r1, #2            divisor  = 2
        // UDIV r2, r0, r1        r2 = 6 / 2 = 3   (multi-cycle; PC stalls)
        // MOVI r3, #7            executes only AFTER divider completes
        // NOP
        // =====================================================================
        
        // mem[0] = 16'b11001_1_000_000_0110;      // MOVI r0, #6
        // mem[1] = 16'b11001_1_001_000_0010;      // MOVI r1, #2
        // mem[2] = 16'b01111_0_010_000_001_0;     // UDIV r2, r0, r1  → r2 = 3
        // mem[3] = 16'b11001_1_011_000_0111;      // MOVI r3, #7
        // mem[4] = 16'b00000_0_000_000_000_0;     // NOP

        // ================================================================
        // STAGE 1 : MOVI + ARITHMETIC
        // ================================================================

        mem[0]  = 16'b11001_1_000_000_0101;   // MOVI r0,#5
        mem[1]  = 16'b11001_1_001_000_0011;   // MOVI r1,#3
        mem[2]  = 16'b00001_0_010_000_001_0;  // ADDS r2,r0,r1
        mem[3]  = 16'b00010_0_011_010_001_0;  // SUBS r3,r2,r1
        mem[4]  = 16'b00011_0_100_010_001_0;  // ADCS r4,r2,r1
        mem[5]  = 16'b01100_0_101_001_000_0;  // RSB  r5,r1,r0
        mem[6]  = 16'b01101_0_110_010_001_0;  // SBC  r6,r2,r1
        mem[7]  = 16'b00000_0_000_000_000_0;  // NOP


        // ================================================================
        // STAGE 2 : LOGICAL OPERATIONS
        // ================================================================

        mem[8]  = 16'b00100_0_010_000_001_0;  // AND r2,r0,r1
        mem[9]  = 16'b00101_0_011_000_001_0;  // OR  r3,r0,r1
        mem[10] = 16'b00110_0_100_000_001_0;  // XOR r4,r0,r1
        mem[11] = 16'b00111_0_101_000_001_0;  // MOV r5,r1
        mem[12] = 16'b01000_0_110_000_001_0;  // MVN r6,r1
        mem[13] = 16'b01011_0_111_000_001_0;  // BIC r7,r0,r1
        mem[14] = 16'b00000_0_000_000_000_0;  // NOP


        // ================================================================
        // STAGE 3 : FLAG OPERATIONS
        // ================================================================

        mem[15] = 16'b01001_0_000_000_001_0;  // CMP r0,r1
        mem[16] = 16'b01010_0_000_000_001_0;  // CMN r0,r1
        mem[17] = 16'b00000_0_000_000_000_0;  // NOP


        // ================================================================
        // STAGE 4 : SHIFTER OPERATIONS
        // ================================================================

        mem[18] = 16'b11001_1_000_000_0100;   // MOVI r0,#4
        mem[19] = 16'b11001_1_001_000_0001;   // MOVI r1,#1
        mem[20] = 16'b10001_0_010_000_001_0;  // LSL r2,r0,r1
        mem[21] = 16'b10000_0_011_010_001_0;  // LSR r3,r2,r1
        mem[22] = 16'b10010_0_100_010_001_0;  // ASR r4,r2,r1
        mem[23] = 16'b10011_0_101_010_001_0;  // ROR r5,r2,r1
        mem[24] = 16'b10100_0_110_000_001_0;  // ROL r6,r0,r1
        mem[25] = 16'b00000_0_000_000_000_0;  // NOP


        // ================================================================
        // STAGE 5 : MEMORY OPERATIONS
        // ================================================================

        mem[26] = 16'b11001_1_000_000_0010;   // MOVI r0,#2
        mem[27] = 16'b11001_1_001_000_0111;   // MOVI r1,#7
        mem[28] = 16'b10110_0_000_000_001_0;  // STR r1,[r0]
        mem[29] = 16'b10101_0_010_000_000_0;  // LDR r2,[r0]
        mem[30] = 16'b00000_0_000_000_000_0;  // NOP


        // ================================================================
        // STAGE 6 : MULTIPLIER
        // ================================================================

        mem[31] = 16'b11001_1_000_000_0011;   // MOVI r0,#3
        mem[32] = 16'b11001_1_001_000_1110;   // MOVI r1,#-2
        mem[33] = 16'b01110_0_010_000_001_0;  // SMULL r2,r0,r1
        mem[34] = 16'b00000_0_000_000_000_0;  // NOP


        // ================================================================
        // STAGE 7 : DIVIDER
        // ================================================================

        mem[35] = 16'b11001_1_000_000_0110;   // MOVI r0,#6
        mem[36] = 16'b11001_1_001_000_0010;   // MOVI r1,#2
        mem[37] = 16'b01111_0_010_000_001_0;  // UDIV r2,r0,r1
        mem[38] = 16'b00000_0_000_000_000_0;  // NOP


        // ================================================================
        // STAGE 8 : BRANCHING
        // ================================================================

        mem[39] = 16'b11001_1_000_000_0101;   // MOVI r0,#5
        mem[40] = 16'b11001_1_001_000_0101;   // MOVI r1,#5
        mem[41] = 16'b01001_0_000_000_001_0;  // CMP r0,r1
        mem[42] = 16'b11000_00000000010;      // BEQ +2
        mem[43] = 16'b11001_1_010_000_0001;   // MOVI r2,#1 (SKIPPED)
        mem[44] = 16'b11001_1_010_000_1001;   // MOVI r2,#-7
        mem[45] = 16'b10111_00000000001;      // BNE +1
        mem[46] = 16'b00000_0_000_000_000_0;  // FINAL NOP

    end

    assign instruction = mem[addr];


endmodule

module SRAM #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 32
)(
    input                       clk,
    input                       we,

    input  [ADDR_WIDTH-1:0]    addr,
    input  [DATA_WIDTH-1:0]    din,

    output [DATA_WIDTH-1:0]    dout
);

    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    integer i;

    // Optional initialization
    initial
    begin
        for(i = 0; i < (1<<ADDR_WIDTH); i = i + 1)
            mem[i] = 0;
    end

    // Synchronous write
    always @(negedge clk)
    begin
        if(we)
            mem[addr] <= din;
    end

    // Asynchronous read
    assign dout = mem[addr];

endmodule

module sign_extend (
    input  [3:0] in,
    output [31:0] out
);

assign out = {{28{in[3]}}, in};

endmodule

module BUS #(
    parameter N = 32
)(
    // Execution Unit Outputs
    input  [N-1:0] alu_out,
    input  [N-1:0] shift_out,
    input  [N-1:0] mac_out,
    input  [N-1:0] div_out,

    // Memory Output
    input  [N-1:0] mem_out,

    // Immediate Datapath
    input  [N-1:0] imm_out,

    // PC Datapath
    input  [N-1:0] pc_out,

    // Bus Select
    input  [2:0]   bus_sel,

    // Shared Bus Output
    output reg [N-1:0] bus_out
);

always @(*)
begin

    case(bus_sel)

        // ALU
        3'b000:
            bus_out = alu_out;

        // Barrel Shifter
        3'b001:
            bus_out = shift_out;

        // MAC
        3'b010:
            bus_out = mac_out;

        // Divider
        3'b011:
            bus_out = div_out;

        // SRAM
        3'b100:
            bus_out = mem_out;

        // Immediate Datapath
        3'b101:
            bus_out = imm_out;

        // PC
        3'b110:
            bus_out = pc_out;

        // Default / Reserved
        default:
            bus_out = {N{1'b0}};

    endcase

end

endmodule
