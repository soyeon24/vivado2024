

`timescale 1ns / 1ps

module tb_output1;
reg clock, start, stop;
wire [3:0] count;
bcd_up uut(
    .clock(clock),
    .start(start),
    .stop(stop),
    .count(count)

);

initial
begin
clock = 1;
start = 0;
stop = 0;
end

initial begin
    #10 start = 1;
    #10 start = 0; 
    #20 stop = 1;
    #10 stop = 0;
    #30 start = 1;
    #40 start = 0;
    #50 stop = 1;
    #10 stop = 0;
    
end

always #5 clock = ~clock;


endmodule
