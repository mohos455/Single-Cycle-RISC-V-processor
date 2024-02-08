module MUX_21 (
    input sel,
    input [31:0] S0,S1,
    output reg [31:0] MUXout
);

    always@(*) begin

        case (sel)
            1'b0 : MUXout = S0 ;
            1'b1 : MUXout = S1 ;
            default: MUXout = S0 ;
        endcase

    end
    
endmodule