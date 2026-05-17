`timescale 1ns / 1ps
 module test_logic_gates;
    reg a;              // 입력신호를reg로선언
reg b;
 wire c_or;      // 출력신호를wire로선언
wire c_and;
 wire c_not;
 wire c_xor;
 logic_gates uut (a,b,c_or,c_and,c_not,c_xor);
 initial begin
 a = 0;  b = 0;
 #10 a = 1;  b = 1;
 #10 a = 0;  b = 1;
 #10 a = 1;  b = 0;
 #10 a = 1;  b = 1;
 #10 a = 0;  b = 0;
     $finish; // 시뮬레이션종료
end
 endmodule