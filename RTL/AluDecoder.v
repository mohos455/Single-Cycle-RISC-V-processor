module ALU_Decoder (
    input [1:0] ALUOp,
    input op,
    input [2:0] funct3,
    input funct7 ,
    output reg [3:0] ALUControl
);

    localparam ADD  = 0;     localparam SUB = 1;
    localparam SLL  = 2;     localparam SLT = 3;
    localparam SLTU = 4;     localparam XOR = 5;
    localparam SRL  = 6;     localparam SRA = 7;
    localparam OR   = 8;     localparam AND = 9;

    localparam  LW_SW =  2'b00,
                R_I_type = 2'b10 ,
                B_type = 2'b01 ;

    always @(*) begin
        case (ALUOp)
          LW_SW  : ALUControl = ADD; // add  lw,sw
          B_type : begin
            case (funct3)
                3'b000 :  ALUControl = SUB ;  // BEQ
                3'B001 :  ALUControl = SUB ;  // BNQ
                3'b100 :  ALUControl = SLT ; // BLT
                3'b101 :  ALUControl = SLT ; // BGE 
                3'b110 :  ALUControl = SLTU ; // BLTU
                3'b111 :  ALUControl = SLTU ;  // BGEU 

                default: ALUControl = SUB ;
            endcase

          end // beq
          R_I_type : begin 
            if(op) begin  // R Type
                case (funct3)
                    3'b000 : begin
                            if(funct7)
                                ALUControl = SUB ;
                            else 
                                ALUControl = ADD ;
                    end
                    3'b001 : ALUControl = SLL ;
                    3'b010 : ALUControl = SLT ;
                    3'b011 : ALUControl = SLTU ;
                    3'b100 : ALUControl = XOR ;
                    3'b101 : begin
                            if(funct7)
                                ALUControl = SRA ;
                            else 
                                ALUControl = SRL ;
                    end
                    3'b110 : ALUControl = OR ;
                    3'b111 : ALUControl = AND ;


                    default: ALUControl = ADD ;
                endcase
            end
            else begin

                case (funct3)
                   3'b000 : ALUControl = ADD ;
                   3'b001 : ALUControl = SLL ;
                   3'b101 : begin
                            if(funct7)
                                ALUControl = SRA ;
                            else 
                                ALUControl = SRL ;
                    end

                   3'b010 : ALUControl = SLT ;
                   3'b011 : ALUControl = SLTU ;
                   3'b100 : ALUControl = XOR ;
                   3'b111 : ALUControl = AND ;
                    default: ALUControl = ADD ;
                endcase
            end

          end   
            default: ALUControl = 3'b000;
        endcase        
    end
endmodule