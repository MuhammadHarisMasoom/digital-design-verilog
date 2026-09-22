`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Muhammad Haris
// Module Name: multi_output_clock
// Description: Generates a 10us HIGH / 80us LOW pulse on one of 37 outputs
//              based on selection input (1–37). System clock = 100 MHz.
//
//////////////////////////////////////////////////////////////////////////////////

module multi_output_clock (
    input  wire clk,            // 100 MHz system clock
    input  wire nrst,            // Active-low reset
    input  wire [5:0] sel,      // Selection input (1–37)
    output reg  [36:0] out_pins // 37 output pins
);

    // Timing parameters for 100 MHz clock
    parameter HIGH_COUNT  = 1000;   // 10us / 10ns = 1000 cycles
    parameter LOW_COUNT   = 8000;   // 80us / 10ns = 8000 cycles
    parameter TOTAL_COUNT = HIGH_COUNT + LOW_COUNT; // 9000 cycles

    reg [13:0] counter = 0;   // counts up to 9000 (needs 14 bits)
    reg pulse_state = 0;

    // Generate pulse pattern (10us high, 80us low)
    always @(posedge clk) begin
        if (~nrst) begin
            counter <= 0;
            pulse_state <= 0;
        end else begin
            if (counter < TOTAL_COUNT - 1)
                counter <= counter + 1;
            else
                counter <= 0;

            if (counter < HIGH_COUNT)
                pulse_state <= 1'b1;
            else
                pulse_state <= 1'b0;
        end
    end

    // Output selection logic
    always @(*) begin
        out_pins = 37'b0;           // default all outputs low
        if (sel >= 1 && sel <= 37)
            out_pins[sel - 1] = pulse_state;  // drive selected output
    end

endmodule
