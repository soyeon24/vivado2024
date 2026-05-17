`timescale 1ns / 1ps

module tb_output1;
reg A,B,C,D;
wire Out_1;
output1 uut(Out_1, A,B,C,D);

initial
begin
 A = 0; B = 0; C = 0; D = 0; #10;
 A = 0; B = 0; C = 0; D = 1; #10;
 A = 0; B = 0; C = 1; D = 0; #10;
 A = 0; B = 0; C = 1; D = 1; #10;
 A = 0; B = 1; C = 0; D = 0; #10;
 A = 0; B = 1; C = 0; D = 1; #10;
 A = 0; B = 1; C = 1; D = 0; #10;
end

endmodule
