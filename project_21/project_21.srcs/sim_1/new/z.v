`timescale 1ns / 1ps

module Stopwatch_tb;

    // Testbench signals
    reg clk_10kHz;
    reg reset;
    reg start;
    reg stop;
    reg css;
    wire [15:0] lcd_display;
    wire [15:0] least_time;

    // Instantiate the Stopwatch module
    Stopwatch uut (
        .clk_10kHz(clk_10kHz),
        .reset(reset),
        .start(start),
        .stop(stop),
        .css(css),
        .lcd_display(lcd_display),
        .least_time(least_time)
    );

    // Generate 10kHz clock
    initial begin
        clk_10kHz = 0;
        forever #50 clk_10kHz = ~clk_10kHz; // 10kHz = 100ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        start = 0;
        stop = 0;
        css = 0;

        // Hold reset for a few cycles
        #200;
        reset = 0;

        // Start stopwatch
        #100;
        start = 1;
        #100;
        start = 0;

        // Simulate running for a while
        #5000;

        // Stop stopwatch
        stop = 1;
        #100;
        stop = 0;

        // Compare and store shortest time
        css = 1;
        #100;
        css = 0;

        // Restart and simulate again
        start = 1;
        #100;
        start = 0;
        #3000;

        // Stop again
        stop = 1;
        #100;
        stop = 0;

        // Compare and store shortest time
        css = 1;
        #100;
        css = 0;

        // End simulation
        #1000;
        $stop;
    end

endmodule
