`timescale 1ns / 1ps
module tb_bcd_counter;
    reg clk;
    reg reset;
    reg start;
    reg stop;
    wire [15:0] bcd_out;

    // Instantiate the BCD Counter
    bcd_counter uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .stop(stop),
        .bcd_out(bcd_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #50 clk = ~clk; // 10kHz clock frequency (100us clock period)
    end

    // Test sequence
    initial begin
        $dumpfile("bcd_counter.vcd");
        $dumpvars(0, tb_bcd_counter);

        // Initialize signals
        reset = 1;
        start = 0;
        stop = 0;
        #200;

        reset = 0;
        #100;

        // Start the counter
        start = 1;
        #1000;
        
        // Stop the counter
        stop = 1;
        start = 0;
        #500;

        // Resume counting
        stop = 0;
        start = 1;
        #500;

        // Reset the counter
        reset = 1;
        #200;
        reset = 0;
        #200;

        $finish;
    end
endmodule
