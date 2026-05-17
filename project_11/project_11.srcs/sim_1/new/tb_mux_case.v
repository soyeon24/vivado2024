 `timescale 1ns/1ps
 module testbench;
 reg [7:0] in;           // 8비트입력신호
wire [2:0] out;         // 3비트출력신호
// enc_for 모듈인스턴스화
enc_for uut (
 .in(in),
 .out(out)
 );
 initial begin
 // 테스트케이스1: in = 8'b0000_0001 (가장낮은비트)
 in = 8'b0000_0001; #10;
 $display("in=%b -> out=%b", in, out);
 // 테스트케이스2: in = 8'b0000_0010
 in = 8'b0000_0010; #10;
 $display("in=%b -> out=%b", in, out);
 // 테스트케이스3: in = 8'b0000_0100
 in = 8'b0000_0100; #10;
 $display("in=%b -> out=%b", in, out);
 // 테스트케이스4: in = 8'b0000_1000
 in = 8'b0000_1000; #10;
 $display("in=%b -> out=%b", in, out);
 // 테스트케이스5: in = 8'b0001_0000
 in = 8'b0001_0000; #10;
 $display("in=%b -> out=%b", in, out);
 // 테스트케이스6: in = 8'b0010_0000
 in = 8'b0010_0000; #10;
 $display("in=%b -> out=%b", in, out);
 // 테스트케이스7: in = 8'b0100_0000
 in = 8'b0100_0000; #10;
 $display("in=%b -> out=%b", in, out);
 // 테스트케이스8: in = 8'b1000_0000 (가장높은비트)
 in = 8'b1000_0000; #10;
 $display("in=%b -> out=%b", in, out);
 // 테스트케이스9: in = 8'b0000_0000 (모든비트가0일때)
 in = 8'b0000_0000; #10;
 $display("in=%b -> out=%b", in, out);
 $finish;
 end
 endmodule