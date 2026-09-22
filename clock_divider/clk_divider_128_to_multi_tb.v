`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 03:29:50 PM
// Design Name: 
// Module Name: clk_divider_128_to_multi_tb
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


module clk_divider_128_to_multi_tb(

    );
    
reg clk_in;
reg nrst;
wire clk_out_8MHz;
wire clk_out_1MHz;

// Instantiation
clk_divider_128_to_multi dut(
.clk_in(clk_in),
.nrst(nrst),
.clk_out_8MHz(clk_out_8MHz),
.clk_out_1MHz(clk_out_1MHz)
);

// clock of 128 MHz = 7.8125ns
initial
begin
    clk_in = 0;
    forever #3.90625 clk_in = ~clk_in; // half clock = 3.90625ns
end

// tb logic
initial
begin
    nrst = 0;
    #50;
    nrst = 1;
    #3000;
    $stop;
end

endmodule