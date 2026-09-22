`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 12:11:46 PM
// Design Name: 
// Module Name: serial_to_parallel_tb
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


module serial_to_parallel_tb(

    );
    
    reg data, clk, start_signal;
    wire [7:0] output_reg;
    
    serial_to_parallel dut(
        .data(data),
        .clk(clk),
        .start_signal(start_signal),
        .output_reg(output_reg)
    );
    
    always begin
        clk = 1;
        #10;
        clk = 0;
        #10;
    end
    
    initial begin
        start_signal = 0;
        data = 0;
        clk = 0;
        #100;
        start_signal = 1;
        
        data = 1;
        #20;
        data = 0;
        #20;
        data = 1;
        #20;
        data = 1;
        #20;
        data = 0;
        #20;
        data = 1;
        #20;
        data = 1;
        #20;
        data = 1;
        #40;
        $finish;
    end
    
    
endmodule