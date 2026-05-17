`timescale 1ns/1ps
 module testbench;
 reg din, clk, rst;  // 입력신호
wire q;             // 출력신호
flip_flop uut (q,din,clk,rst);
 // 클럭생성(20ns 주기)
 initial begin
 clk = 0;
 forever #10 clk = ~clk;
 end
 // 테스트시퀀스
initial begin
 // 초기상태설정
rst = 1; din = 0; #20;
 // 리셋비활성화및데이터입력변화
rst = 0; din = 1; #20;
 // 데이터변화
din = 0; #20;
 // 리셋활성화
rst = 1; #20;
 // 리셋비활성화및데이터입력변화
rst = 0; din = 1; #20;
 din = 0; #20;
 $finish;
 end
 endmodule