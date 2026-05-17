`timescale 1ns / 1ps
module tb_AND_2();

reg A, B;
wire C;

AND_2 DUT(A, B, C);

initial begin    A = 0;
    B = 1;
    
    #50
    A = 1;
    B = 0;
    
    #50
    
    A = 1;
    B = 1;
    
end

endmodule
