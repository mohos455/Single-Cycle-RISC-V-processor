module Sign_Extend (
    input [24:0] instr ,
    input [2:0] ImmSrc,
    output reg [31:0] ImmExt
); 
    localparam  I_type = 3'b000 ,
                S_type = 3'b001,
                B_typr = 3'b010,
                J_type = 3'b011,
                U_type = 3'b100 ;
    
    always @(*) begin
        case (ImmSrc)
            I_type :  ImmExt = {{20{instr[24]}},instr[24:13]} ; // I type
            S_type :  ImmExt = {{20{instr[24]}},instr[24:18],instr[4:0]} ; // S type
            B_typr :  ImmExt = {{20{instr[24]}},instr[0],instr[23:18],instr[4:1],1'b0} ; // B type
            J_type :  ImmExt = {{12{instr[24]}},instr[12:5],instr[13],instr[23:14],1'b0} ; // J type
            U_type :  ImmExt = {instr[24:5],12'b0} ; // J type

        endcase
    end
endmodule