module Data_Mem (
    input clk ,WE ,  // ,reset
    input [31:0] A,
    input [31:0] WD,
    output [31:0] RD,
    output [31:0] test

);

    reg [31:0] DataMemory [0:255] ;
    always @(posedge clk ) begin
        if(WE) begin
            DataMemory[A] <= WD ;
        end
    end

    assign RD = DataMemory[A] ;
    assign test = DataMemory[0] ;
    
endmodule