`timescale 1ns/1ps

module half_adder_tb;
    reg [1:0] in0, in1;
    reg sel;
    wire [1:0] out;
    mux2b_if uut (in0, in1, sel, out);
    
    initial begin
    in0 = 2'b01;
    in1 = 2'b10;
    sel = 0; #10;
    
     sel = 1; #10;
     
      in0 = 2'b11;
 in1 = 2'b00;
 sel = 0; #10;
 
 
    $finish
endmodule