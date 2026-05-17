`timescale 1ns/1ps
 module testbench;
 reg a, b;         // 입력신호
wire out;         // 출력신호
sample uut (a,b,out);
 initial begin
 // 모든입력조합테스트
a = 0; b = 0; #10;
 a = 0; b = 1; #10;
 a = 1; b = 0; #10;
 a = 1; b = 1; #10;
 $finish;
 end
 endmodule