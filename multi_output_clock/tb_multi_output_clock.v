`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Muhammad Haris
// Testbench: tb_multi_output_clock
// Description: Testbench for multi_output_clock module
//////////////////////////////////////////////////////////////////////////////////

module tb_multi_output_clock;

    // Testbench signals
    reg clk;
    reg nrst;
    reg [5:0] sel;
    wire [36:0] out_pins;

    // Instantiate the DUT (Device Under Test)
    multi_output_clock uut (
        .clk(clk),
        .nrst(nrst),
        .sel(sel),
        .out_pins(out_pins)
    );

    // Generate 100 MHz clock (10 ns period)
    always #5 clk = ~clk; // toggles every 5 ns ? 10 ns full period

    // Stimulus
    initial begin
        // Initialize
        clk = 0;
        nrst = 0;
        sel = 0;

        // Hold reset for a while
        #50;
        nrst = 1;

        // Test case 1: Select output 1
//        sel = 6'd1;
//        #1000_000;  // run for 1 ms (observe waveform)

        // Test case 2: Select output 2
//        sel = 6'd2;
//        #900_000;

        // Test case 3: Select output 10
//        sel = 6'd10;
//        #900_000;

        // Test case 4: Invalid selection (0 or >37)
//        sel = 6'd0;
//        #100_000;
        sel = 6'd2;
        #100_000;

        // End simulation
        $stop;
    end

endmodule
