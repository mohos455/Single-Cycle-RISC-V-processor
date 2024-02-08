module Load_logic (
    input [31:0] data_load,
    input [2:0] load_mode ,
    output reg [31:0] data_load_out
);

    localparam  LB = 3'b000 ,
                LH = 3'b001 ,
                LW = 3'b010 ,
                LBU = 3'b100,
                LHU = 3'b101;

    always @(*) begin
        case (load_mode)
            LB : data_load_out = {{24{data_load[7]}},data_load[7:0]};
            LH : data_load_out = {{16{data_load[15]}},data_load[15:0]};
            LW : data_load_out = data_load ;
            LBU : data_load_out = {24'b0,data_load[7:0]};
            LHU : data_load_out = {16'b0,data_load[15:0]};
            default: data_load_out = data_load ;
        endcase
    end
endmodule