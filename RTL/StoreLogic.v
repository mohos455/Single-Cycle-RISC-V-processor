module Store_Logic (
    input [1:0] store_mode,
    input [31:0] data_store,
    output reg [31:0] data_store_out
);
    localparam SB = 2'b00,
               SH = 2'b01 ,
               SW = 2'B10 ;

    always @(*) begin

        case (store_mode)
            SB :  data_store_out = {24'b0 ,data_store[7:0] } ;
            SH :  data_store_out = {16'b0 ,data_store[15:0] } ;
            SW :  data_store_out = data_store ;

            default: data_store_out = data_store ;
        endcase
        
    end
endmodule