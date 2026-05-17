`timescale 1ns / 1ps

module tb();
    reg clk; 
    reg reset;
    wire [3:0] count;
    BCD_Counter uut (count, clk, reset);

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns 주기의 클럭 생성
    end
        initial begin
        // Initialize inputs
        reset = 0;

        // Wait for global reset to finish
        #10;

        // Apply reset
        reset = 1; 
        #10;
        reset = 0;

        // Let counter run
        #100;

        // Apply reset in the middle of counting
        reset = 1;
        #10;
        reset = 0;

        // Let counter run again
        #50;

        // End simulation
        $stop;
        
       end
endmodule
