`timescale 1ns / 1ps
module tb();

reg clock;
reg start;
reg stop;
wire [3:0] count;


upcounter_for_1ms uut (
.clock(clock),
.start(start),
.count(count),
.stop(stop)
);

initial begin
clock = 0;
start = 0;
#10 start = 1;
#5 stop = 1;
#10 start = 1;
#8 stop = 1;


end

// clk 신호 생성
always #5 clock = ~clock; 

endmodule