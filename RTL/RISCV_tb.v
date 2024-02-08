`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 09:35:13 PM
// Design Name: 
// Module Name: RISCV_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RISCV_tb();
    reg clk , reset ;
    wire [31:0] test;
    
    TOP DUT(.clk(clk), .reset(reset) , .test(test) );
    
     localparam CLK_PERIOD = 100;
    always 
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;    reset = 0;


        @(negedge clk)  reset = 1;

        repeat (1000000)  @(negedge clk);
        #10000 
        $stop;
    end
endmodule

