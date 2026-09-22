`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2025 03:29:13 PM
// Design Name: 
// Module Name: moore_overlapping_sequence_detector_tb
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


module moore_overlapping_sequence_detector_tb(

    );
    
    reg clk, data_in, nrst;
    wire detect_pin;
    
    // instantiation
    moore_overlapping_sequence_detector dut (
    .clk(clk),
    .data_in(data_in),
    .nrst(nrst),
    .detect_pin(detect_pin)
    );
    
    // clock of 10MHz
     always begin
        clk = 1;
        #50;
        clk = 0;
        #50;
      end
      
    // testbench logic
    // I want to give 1001001001001110 (16 bits) as input and my output should be 0001001001001000
    
 initial begin
    data_in = 1'b0;
    nrst = 0;
    #100 nrst = 1'b1;
    data_in = 1'b1;
    #100 data_in = 1'b0;
    #100 data_in = 1'b0;
    #100 data_in = 1'b1;
    #100 data_in = 1'b0;
    #100 data_in = 1'b0;
    #100 data_in = 1'b1;
    #100 data_in = 1'b0;
    #100 data_in = 1'b0;
    #100 data_in = 1'b1;
    #100 data_in = 1'b0;
    #100 data_in = 1'b0;
    #100 data_in = 1'b1;
    #100 data_in = 1'b1;
    #100 data_in = 1'b1;
    #100 data_in = 1'b0;
    #100;
    $finish;
 end
    
    
endmodule
