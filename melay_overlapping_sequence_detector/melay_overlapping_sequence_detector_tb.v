`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2025 12:34:53 PM
// Design Name: 
// Module Name: melay_overlapping_sequence_detector_tb
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


module melay_overlapping_sequence_detector_tb();

reg clk, data_in, nrst;
wire detect_pin;

// instantiation
melay_overlapping_sequence_detector dut (
 .clk(clk),
 .data_in(data_in),
 .nrst(nrst),
 .detect_pin(detect_pin)
 );
 
 // clock of 20MHz
 always begin
    clk = 1;
    #25;
    clk = 0;
    #25;
 end
 
 // testbench logic
 // I want to give 1001001001001110 (16 bits) as input and my output should be 0001001001001000
 initial begin
    
    data_in = 1'b0;
    nrst = 0;
    #100 nrst = 1'b1;
    #50 data_in = 1'b1;
    #50 data_in = 1'b0;
    #50 data_in = 1'b0;
    #50 data_in = 1'b1;
    #50 data_in = 1'b0;
    #50 data_in = 1'b0;
    #50 data_in = 1'b1;
    #50 data_in = 1'b0;
    #50 data_in = 1'b0;
    #50 data_in = 1'b1;
    #50 data_in = 1'b0;
    #50 data_in = 1'b0;
    #50 data_in = 1'b1;
    #50 data_in = 1'b1;
    #50 data_in = 1'b1;
    #50 data_in = 1'b0;
    #50;
    $finish;
 end
 

endmodule
