`timescale 1ns/1ps
 module testbench;
 reg a, b;           // 입력신호
wire sum, cout;     // 출력신호
// half_add1 모듈인스턴스화
half_add1 uut (a,b,sum,cout);
 initial begin
 a = 0; b = 0; #10;
 a = 0; b = 1; #10;
 a = 1; b = 0; #10;
 a = 1; b = 1; #10;
 $finish;
 end
 endmodule