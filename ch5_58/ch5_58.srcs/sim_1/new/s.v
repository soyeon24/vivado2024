`timescale 1ns/1ps

module tb_ones_counter;

    reg clk;
    reg reset;
    reg x;
    wire y;

    ones_counter uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        x = 0;

        #10 reset = 0;

        #10 x = 1;  
        #10 x = 1;  
        #10 x = 1;  
        #10 x = 1; 
        #10 x = 0; 
        #10 x = 1;
        #10 x = 0; 

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | x=%b | y=%b | State=%b", $time, x, y, uut.current_state);
    end

endmodule
