`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 03:21:17 PM
// Design Name: 
// Module Name: clk_divider_128_to_multi
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

module clk_divider_128_to_multi(
input wire clk_in,
input wire nrst,
output reg clk_out_8MHz,
output reg clk_out_1MHz
    );
    
 // -------------------------------------------------------------------------------
 // Divide 128 MHz -> 8MHz (factor = 16)
 // -------------------------------------------------------------------------------
    
 reg [2:0] counter_8MHz = 3'd0;
 
 always @(posedge clk_in)
 begin
     if(~nrst)
     begin
        counter_8MHz <= 3'd0;
        clk_out_8MHz <= 1'd0;
     end
     else
     begin
        if(counter_8MHz == 3'd7)
        begin
            counter_8MHz <= 3'd0;
            clk_out_8MHz <= ~clk_out_8MHz;
        end
        else
        begin
            counter_8MHz <= counter_8MHz + 1'b1;
        end
     end
 end

 // -------------------------------------------------------------------------------
 // Divide 128 MHz -> 1MHz (factor = 128)
 // -------------------------------------------------------------------------------
 
  reg [5:0] counter_1MHz = 6'd0;
 
 always @(posedge clk_in)
 begin
     if(~nrst)
     begin
        counter_1MHz <= 6'd0;
        clk_out_1MHz <= 1'd0;
     end
     else
     begin
        if(counter_1MHz == 6'd63)
        begin
            counter_1MHz <= 6'd0;
            clk_out_1MHz <= ~clk_out_1MHz;
        end
        else
        begin
            counter_1MHz <= counter_1MHz + 1'b1;
        end
     end
 end
 
endmodule