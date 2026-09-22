`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2025 02:54:26 PM
// Design Name: 
// Module Name: moore_overlapping_sequence_detector
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


module moore_overlapping_sequence_detector(
input wire clk,
input wire nrst,
input wire data_in,
output reg detect_pin
    );
    
    reg [2:0] state;
    parameter A = 3'b000;
    parameter B = 3'b001;
    parameter C = 3'b010;
    parameter D = 3'b011;
    parameter E = 3'b100;
    
    always @ (posedge clk) begin
        if (!nrst) begin
            state <= A;
            detect_pin <= 1'b0;
        end
        else begin
            case (state)
                A: begin
                    detect_pin <= 1'b0;
                    if (data_in == 1'b0)
                        state <= A;
                    else
                        state <= B;                       
                end
                B: begin
                    detect_pin <= 1'b0;
                    if (data_in == 1'b0)
                        state <= C;
                    else
                        state <= B; 
                end
                C: begin
                    detect_pin <= 1'b0;
                    if (data_in == 1'b0)
                        state <= D;
                    else
                        state <= B; 
                end
                D: begin
                    detect_pin <= 1'b0;
                    if (data_in == 1'b0)
                        state <= A;
                    else
                        state <= E; 
                end
                E: begin
                    detect_pin <= 1'b1;
                    if (data_in == 1'b0) begin
                        state <= C;
//                        detect_pin <= 1'b0;
                    end
                    else begin
                        state <= B;
//                        detect_pin <= 1'b0; 
                    end
                end
                default: begin
                state <= A;
                detect_pin <= 1'b0;
                end
            endcase
        end
    end
endmodule
