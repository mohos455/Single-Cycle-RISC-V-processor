module Reg_File (
    input clk ,reset ,WE3,
    input [4:0] A1,A2,A3 ,
    input [31:0] WD3,
    output reg [31:0] RD1,RD2
);

    reg [31:0] reg_file [0:31] ;
    integer i ;
    always @(posedge clk or negedge reset) begin
        if(~reset) begin
            for( i = 0 ; i< 32 ; i=i+1 ) begin
                reg_file[i] <= 0;
            end
        end

        else if(WE3) begin
            reg_file[A3] <= WD3 ;
        end

    end

    always @(*) begin
        RD1 = reg_file[A1];
        RD2 = reg_file[A2];
    end


    
endmodule