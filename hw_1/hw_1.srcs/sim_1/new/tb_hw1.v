`timescale 1ns / 1ps

module tb_hw1();
    reg A,B,C,D;
    wire[2:0] out;
    hw1 tb_hw1(
    A,B,C,D,
    out[2], out[1], out[0]
    );
    
    initial begin
    
    A = 0; B = 0; C = 0; D = 0; #10;
    A = 0; B = 0; C = 0; D = 1; #10;
    A = 0; B = 0; C = 1; D = 0; #10;
    A = 0; B = 0; C = 1; D = 1; #10;
    A = 0; B = 1; C = 0; D = 0; #10;
    A = 0; B = 1; C = 0; D = 1; #10;
    A = 0; B = 1; C = 1; D = 0; #10;
    end


endmodule
