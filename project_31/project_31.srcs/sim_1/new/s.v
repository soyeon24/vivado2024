`timescale 1ns/1ps

module BCD_Counter_tb;

    // Testbench signals
    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the BCD Counter
    BCD_Counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation: 10ns period (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Monitor the signals
       
        // Initialize reset
        reset = 1;
        #10;  // Hold reset for 10ns

        // Release reset and start counting
        reset = 0;
        #100; // Let the counter run for 100ns

        // Apply reset in the middle of counting
        reset = 1;
        #10;  // Hold reset for 10ns
        reset = 0;
        #50;  // Let the counter run for another 50ns

        // Finish simulation
        $finish;
    end

endmodule
