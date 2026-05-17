`timescale 1ns / 1ps

module tb();
reg clock, start, stop;
reg [3:0] count;
bcd_count_4bit uut (
    .clock(clock),
    .start(start),
    .stop(stop),
    .count(count)
);

initial begin
    clock = 0;
    start = 0;
    stop = 0;
    #5 start = 1;   // Start counting
        #6 start = 0;
        #7 stop = 1;   // Stop counting
        #8 stop = 0;    // Resume counting
        #3 $stop;       // End simulation
    end
always #5 clock = ~clock;
endmodule
