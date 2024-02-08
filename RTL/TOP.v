module TOP (
    input clk,reset,
    output [31:0] test
);


    wire [3:0] ALUControl ; // ALU decoder
    wire [1:0] PCSrc , Ssrc;// branch and jump logic
    wire Usrc,MemWrite, RegWrite,ALUSrc ; // main decoder
    wire  [1:0] ResultSrc;
    wire [2:0] ImmSrc,LWSrc;

    wire zero, funct7 ;
    wire [6:0] op ;
    wire [2:0] funct3;

    Data_Path MyDataPath (

        .clk(clk), .reset(reset),
        .ALUControl(ALUControl),
        .PCSrc(PCSrc),.Ssrc(Ssrc),
        .Usrc(Usrc),.MemWrite(MemWrite), .RegWrite(RegWrite),.ALUSrc(ALUSrc),
        .ResultSrc(ResultSrc),.ImmSrc(ImmSrc),.LWSrc(LWSrc),
        .funct7(funct7) , .zero(zero),
        .op(op) , .funct3(funct3),
        .test(test)
    );

    Control_Unit MyControlUnit (
        
        .ALUControl(ALUControl),
        .PCSrc(PCSrc),.Ssrc(Ssrc),
        .Usrc(Usrc),.MemWrite(MemWrite), .RegWrite(RegWrite),.ALUSrc(ALUSrc),
        .ResultSrc(ResultSrc),.ImmSrc(ImmSrc),.LWSrc(LWSrc),
        .funct7(funct7) , .zero(zero),
        .op(op) , .funct3(funct3)
        );

    
endmodule