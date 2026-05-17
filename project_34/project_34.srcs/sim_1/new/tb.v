`timescale 1ns / 1ps

module stopwatch_tb;

    reg clock;
    reg reset;
    reg start;
    reg stop;
    wire [3:0] b0;
    wire [3:0] b1;
    wire [3:0] b_1;
    wire [3:0] b_2;

    // Instantiate the main module
    main uut (
        .clk(clock),
        .rst(reset),
        .start(start),
        .stop(stop),
        .digit0(b0),
        .digit1(b1),
        .digit2(b_1),
        .digit3(b_2)
    );

    // Clock generation (10 kHz => 100 ns period)
    always begin
        #5 clock = ~clock;
    end

    initial begin
        // Initialize signals
        clock = 1;
        reset = 0;
        start = 0;
        stop = 0;

        // Apply reset
        #10 reset = 1;
        #10 reset = 0;

        // Start counting
        #20 start = 1;
        #10 start = 0;

        // Let it run for some time
        #545 stop = 1;
        #10 stop = 0;
        
        #20 start = 1;
        #10 start = 0;
        
        #300 stop = 1;
        #10 stop = 0;
        

    end
endmodule
