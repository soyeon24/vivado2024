 `timescale 1ns/1ps
 module testbench;
 reg [1:0] in0, in1;  // 2비트입력신호
reg sel;             // 선택신호
wire [1:0] out;      // 2비트출력신호
mux2b_if uut (in0,in1,sel,out);
 initial begin
 // 테스트케이스1: sel = 0, in0 = 2'b01, in1 = 2'b10
 in0 = 2'b01;
 in1 = 2'b10;
 sel = 0; #10;
 // 테스트케이스2: sel = 1, in0 = 2'b01, in1 = 2'b10
 sel = 1; #10;
 // 테스트케이스3: sel = 0, in0 = 2'b11, in1 = 2'b00
 in0 = 2'b11;
 in1 = 2'b00;
 sel = 0; #10;
 // 테스트케이스4: sel = 1, in0 = 2'b11, in1 = 2'b00
 sel = 1; #10;
 $finish;
 end
 endmodule