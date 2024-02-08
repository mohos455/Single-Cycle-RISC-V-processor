module D_Flipflop (
    input clk ,reset,
    input [31:0] PCNext,
    output reg [31:0] PC 
);

    always@(posedge clk or negedge reset) begin
        if(~reset)
            PC <= 0 ;
        else
            PC <= PCNext ;
    end
    
endmodule