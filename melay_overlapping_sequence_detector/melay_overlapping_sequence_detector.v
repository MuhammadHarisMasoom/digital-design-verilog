    `timescale 1ns / 1ps
    //////////////////////////////////////////////////////////////////////////////////
    // Company: 
    // Engineer: 
    // 
    // Create Date: 08/06/2025 04:15:46 PM
    // Design Name: 
    // Module Name: melay_overlapping_sequence_detector
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
    
    module melay_overlapping_sequence_detector(
    input wire clk,
    input wire nrst,
    input wire data_in,
    output reg detect_pin
        );
        parameter A = 2'b00;
        parameter B = 2'b01;
        parameter C = 2'b10;
        parameter D = 2'b11;
        reg [1:0] state;
        
        always @(posedge clk)
        begin
            if (nrst == 0)
            begin
               state <= A;
               detect_pin <= 1'b0;
            end
            else
            begin
               case(state)
               A: 
               begin
                    detect_pin <= 1'b0;
                    if (data_in == 1'b0)
                    state <= A;
                    else
                    state <= B;
               end
               B:
               begin
                    detect_pin <= 1'b0;
                    if (data_in == 1'b0)
                    state <= C;
                    else
                    state <= B;
               end
               C:
               begin
                    detect_pin <= 1'b0;
                    if (data_in == 1'b0)
                    state <= D;
                    else
                    state <= B;
               end
               D:
               begin
                if (data_in == 1'b0)
                begin
                state <= A;
                detect_pin <= 1'b0;
                end
                else
                begin
                state <= B;
                detect_pin <= 1'b1;
                end
               end 
               default:
               begin
                state <= A;
                detect_pin <= 1'b0;
               end 
               endcase
            end
        end   
        
    endmodule
