module Instr_Mem (
    input [31:0] instr_adress ,
    output reg [31:0] instr_read 
);


    reg [31:0] instruction_memory [0:256] ;
    initial begin
    $readmemh("inst.txt", instruction_memory);
    end

    always @(*) begin
        instr_read = instruction_memory [instr_adress>>2] ;
    end
    
endmodule