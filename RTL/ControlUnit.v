module Control_Unit (
    input zero, funct7 ,
    input [6:0] op,
    input [2:0] funct3,

    output [3:0] ALUControl, // ALU decoder
    output reg [1:0] PCSrc , Ssrc , // branch and jump logic
    output Usrc,MemWrite, RegWrite,ALUSrc,  // main decoder
    output  [1:0] ResultSrc,
    output [2:0] ImmSrc,
    output reg [2:0] LWSrc
    
    );

    wire [1:0] ALUOp ;
    wire Branch,Jump ;
    reg Branch_logic ;

    localparam  R_type    = 7'b0110011,
                I_type    = 7'b0010011,
                B_type    = 7'b1100011,
                Load      = 7'b0000011,
                S_type    = 7'b0100011,
                LUI_type  = 7'b0110111,
                AUIPC_type  = 7'b0110111,
                JAL_type   = 7'b1101111,
                JALR_type   = 7'b1100111;
    
    Main_Decoder MyDecoder (
        .op(op),
        .Usrc(Usrc),
        .MemWrite(MemWrite),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .ImmSrc(ImmSrc),
        .Jump(Jump),
        .ALUOp(ALUOp),
        .Branch(Branch) ,
        .ResultSrc(ResultSrc)
    ) ; 

    ALU_Decoder MyALUDecoder(
        .ALUOp(ALUOp),
        .op(op[5]),
        .funct3(funct3),
        .funct7(funct7),
        .ALUControl(ALUControl)
    );

    always @(*) begin
        if(Branch) begin
             case (funct3)
                3'b000 :  Branch_logic = zero ;  // BEQ
                3'B001 :  Branch_logic = ~zero ;  // BNQ
                3'b100 :  Branch_logic = ~zero ; // BLT
                3'b101 :  Branch_logic = zero ; // BGE 
                3'b110 :  Branch_logic = ~zero ; // BLTU
                3'b111 :  Branch_logic = zero ;  // BGEU 

                default: Branch_logic = zero ;
            endcase
            end
            else 
            Branch_logic = 0 ; 
        
    end

    // PCSrc

    always @(*) begin
        case ({Branch_logic,Jump})
            2'b00 :  PCSrc = 2'b00;
            2'b10 :  PCSrc = 2'b01;
            2'b01 : begin
                if(op == JAL_type) 
                    PCSrc =  2'b01 ;
                else if( op == JALR_type)
                    PCSrc = 2'b10 ;
            end
            default: PCSrc = 2'b00; 
        endcase
    end

    // store logic 
    always @(*) begin
        if(op == S_type  ) begin
            case (funct3[1:0])
                2'b00 :  Ssrc = 2'b00;
                2'b01 :  Ssrc = 2'b01;
                2'b10 :  Ssrc = 2'b10;
                default: Ssrc = 2'b10;
            endcase

        end
    end

    // load logic


    localparam  LB = 3'b000 ,
                LH = 3'b001 ,
                LW = 3'b010 ,
                LBU = 3'b100,
                LHU = 3'b101;

    always @(*) begin
        if(op == Load) begin
            case (funct3)
                LB  :  LWSrc = LB;
                LH  :  LWSrc = LH;
                LW  :  LWSrc = LW;
                LBU :  LWSrc = LBU;
                LHU :  LWSrc = LHU;

                default: LWSrc = LW;
            endcase

        end
    end





    
endmodule