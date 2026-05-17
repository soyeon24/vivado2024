`timescale 1ns / 1ps //A unit of time
 module tb_and_2;
 reg a,b;    //INPUT
 wire c;     
//OUTPUT
 and_gate uut (a,b,c);  
//Instantiate the unit under test (uut)
 initial 
begin
 a = 0;  b = 0;
 #10 a = 1;  b = 1;
 #10 a = 0;  b = 1;
 #10 a = 1;  b = 0;
 #10 a = 1;  b = 1;
 #10 a = 0;  b = 0;
 end
 endmodule