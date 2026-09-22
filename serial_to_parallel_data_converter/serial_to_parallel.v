            `timescale 1ns / 1ps
            //////////////////////////////////////////////////////////////////////////////////
            // Company: 
            // Engineer: 
            // 
            // Create Date: 08/07/2025 04:57:53 PM
            // Design Name: 
            // Module Name: serial_to_parallel
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
            
            module serial_to_parallel(
            input data,
            input clk,
            input start_signal,
            output reg [7:0] output_reg = 8'd0
                );
                
                reg [7:0] internal_reg = 8'd0;
                reg [3:0] counter = 4'd0;
//                reg start_signal_prev_state = 1'b0;
                
                always @ (posedge clk) 
                begin
                    if (start_signal) 
                    begin
                      internal_reg[7-counter]  <= data;
                      if (counter == 4'd8) 
                      begin
                        output_reg <= internal_reg;
//                        output_reg <= {internal_reg[6:0], data};
                        counter <= 0;
                      end
                      else 
                      begin
                      counter <= counter + 1;
                      end
                    end
                end
endmodule