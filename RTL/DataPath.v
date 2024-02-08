module Data_Path (
    input clk, reset,
    input [3:0] ALUControl, // ALU decoder
    input [1:0] PCSrc , Ssrc, // branch and jump logic
    input Usrc,MemWrite, RegWrite,ALUSrc,  // main decoder
    input  [1:0] ResultSrc,
    input [2:0] ImmSrc,LWSrc,

    output zero, funct7 ,
    output [6:0] op,
    output [2:0] funct3,
    output [31:0] test
);
 
    wire [31:0] PCNext , PC ,instr , PcPlus4 ,ImmExt ,SrcA, SrcB , ALUResult;
    wire [31:0] PCTarget , WriteData , Result, ReadData;
    wire [31:0] RD2_out,MemOUT,U_MUXOUT;

    MUX_31 PC_MUX (   // pc MUX 
        .sel(PCSrc),
        .S0(PcPlus4),
        .S1(PCTarget),
        .S2(Result),
        .MUXout(PCNext)
    );

    D_Flipflop PC_FLIPFLOP (  // PC FLIPFLOP
        .clk(clk),
        .reset(reset),
        .PCNext(PCNext),
        .PC(PC)
    );

    Adder Adder_PC4 (  // PC + 4 
        .A(PC),
        .B(32'b100),
        .C(PcPlus4)
    );

    Instr_Mem Instruction_mem (  // instruction memory
        .instr_adress(PC),
        .instr_read(instr)
    );


    Reg_File MyRegFile(
        .clk(clk),
        .reset(reset),
        .A1(instr[19:15]),
        .A2(instr[24:20]),
        .A3(instr[11:7]),
        .WD3(Result),
        .WE3(RegWrite),
        .RD1(SrcA),
        .RD2(RD2_out)
    );

    MUX_21 ALU_MUX21 (
        .sel(ALUSrc),
        .S0(RD2_out),
        .S1(ImmExt),
        .MUXout(SrcB)
    );

    Store_Logic MyStoreLogic(
        .store_mode(Ssrc),
        .data_store(RD2_out),
        .data_store_out(WriteData)
    );

    ALU MyALU (
        .A(SrcA),
        .B(SrcB),
        .opcode(ALUControl),
        .ALU_out(ALUResult),
        .zero_flag(zero)
    );

    Data_Mem MyMemory(
        .clk(clk),
        .WE(MemWrite),
        .A(ALUResult),
        .WD(WriteData),
        .RD(MemOUT),
        .test(test)
    );

    Load_logic MyLoadLogic (
        .data_load(MemOUT),
        .load_mode(LWSrc),
        .data_load_out(ReadData)
    );

    MUX_41 MemMUX_41 (
        .sel(ResultSrc),
        .S0(ALUResult),
        .S1(ReadData),
        .S2(PcPlus4),
        .S3(U_MUXOUT),
        .MUXout(Result)
    );

    Sign_Extend MySignExtend(
        .instr(instr[31:7]),
        .ImmSrc(ImmSrc),
        .ImmExt(ImmExt)
    );

    Adder Adder_Target (  // PC + ImmExt
        .A(PC),
        .B(ImmExt),
        .C(PCTarget)
    );

    MUX_21 UtypeMUX_21 (
        .sel(Usrc),
        .S0(ImmExt),
        .S1(PCTarget),
        .MUXout(U_MUXOUT)
    );

    assign op = instr[6:0];
    assign funct3 = instr[14:12];
    assign funct7 = instr[30];
    
endmodule