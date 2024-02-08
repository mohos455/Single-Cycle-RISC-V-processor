module Main_Decoder (
    input [6:0] op ,
    output reg Usrc,MemWrite, RegWrite,Branch,ALUSrc,Jump,
    output  reg [1:0] ResultSrc,
    output reg [1:0] ALUOp ,
    output reg [2:0] ImmSrc
);



    localparam  R_type    = 7'b0110011,
                I_type    = 7'b0010011,
                B_type    = 7'b1100011,
                Load      = 7'b0000011,
                S_type    = 7'b0100011,
                LUI_type  = 7'b0110111,
                AUIPC_type  = 7'b0110111,
                JAL_type   = 7'b1101111,
                JALR_type   = 7'b1100111;

    always @(*) begin
        case (op)

           R_type : begin
            Usrc = 0 ;  MemWrite = 0 ; 
            RegWrite = 1 ; Branch =0;
            ImmSrc = 0 ; Jump = 0; 
            ALUSrc = 0 ; ResultSrc = 2'b00;
            ALUOp = 2'b10;
           end

            I_type : begin
            Usrc = 0 ;  MemWrite = 0 ; 
            RegWrite = 1 ; Branch =0;
            ImmSrc = 0 ; Jump = 0; 
            ALUSrc = 1 ; ResultSrc = 2'b00;
            ALUOp = 2'b10;
           end
            Load : begin
            Usrc = 0 ;  MemWrite = 0 ;
            RegWrite = 1 ; Branch =0;
            ImmSrc = 0 ; Jump = 0; 
            ALUSrc = 1 ; ResultSrc = 2'b01;
            ALUOp = 2'b00;
           end

           S_type : begin

            Usrc = 0 ;  MemWrite = 1 ; 
            RegWrite = 0 ; Branch =0;
            ImmSrc = 3'b001 ; Jump = 0; 
            ALUSrc = 1 ; ResultSrc = 2'b00;
            ALUOp = 2'b00;

           end


           B_type : begin
            Usrc = 0 ;  MemWrite = 0 ; 
            RegWrite = 0 ; Branch = 1;
            ImmSrc = 3'b010 ; Jump = 0; 
            ALUSrc = 0 ; ResultSrc = 2'b00;
            ALUOp = 2'b01;
           end

            LUI_type : begin
            Usrc = 0 ;  MemWrite = 0 ; 
            RegWrite = 1 ; Branch = 0;
            ImmSrc = 3'b100 ; Jump = 0;
            ALUSrc = 0 ; ResultSrc = 2'b11;
            ALUOp = 2'b00;
           end

            AUIPC_type :  begin
            Usrc = 1 ;  MemWrite = 0 ; 
            RegWrite = 1 ; Branch = 0;
            ImmSrc = 3'b100 ; Jump = 0;
            ALUSrc = 0 ; ResultSrc = 2'b11;
            ALUOp = 2'b00;
            end

            JAL_type :  begin
            Usrc = 0 ;  MemWrite = 0 ; 
            RegWrite = 1 ; Branch = 0;
            ImmSrc = 3'b011 ; Jump = 1;
            ALUSrc = 0 ; ResultSrc = 2'b10;
            ALUOp = 2'b00;
            end

            JALR_type : begin
            Usrc = 0 ;  MemWrite = 0 ;
            RegWrite = 1 ; Branch = 0;
            ImmSrc = 3'b011 ; Jump = 1;
            ALUSrc = 1 ; ResultSrc = 2'b00;
            ALUOp = 2'b00;
            end

            default: begin
            Usrc = 0 ;  MemWrite = 0 ; 
            RegWrite = 0 ; Branch = 0;
            ImmSrc = 3'b000 ; Jump = 0; 
            ALUSrc = 0 ; ResultSrc = 2'b00;
            ALUOp = 2'b00;
           end
        endcase
    end
    
endmodule