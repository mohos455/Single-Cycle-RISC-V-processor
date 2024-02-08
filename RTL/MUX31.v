module MUX_31 (
    input [1:0] sel,
    input [31:0] S0,S1,S2,
    output reg [31:0] MUXout
);

    always@(*) begin

        case (sel)
            2'b00 : MUXout = S0 ;
            2'b01 : MUXout = S1 ;
            2'b10 : MUXout = S2 ;
            default: MUXout = S0 ;
        endcase

    end
    
endmodule