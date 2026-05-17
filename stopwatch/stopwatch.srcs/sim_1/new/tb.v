`timescale 1ms/1ps

module bcd_4bit_tb;

    reg clk, start, stop;
    wire [15:0] count;
    wire overflow;

    bcd_4bit uut (
        .clk(clk),
        .start(start),
        .stop(stop),
        .count(count),
        .overflow(overflow)
    );

   initial begin
        clk = 0;
        start = 0;
        stop = 0;
        
        end
        
    initial begin

        #10 start = 1;
        #10 start = 0;

        #200 stop = 1;
        #20 stop = 0;

        #20 start = 1;
        #10 start = 0;

        #500 $stop;
    end
always #5 clk = ~clk;  // 10ms 주기

endmodule
