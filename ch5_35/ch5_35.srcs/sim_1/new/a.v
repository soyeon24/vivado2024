
`timescale 1ns/1ps

module tb_sequential_circuit;
    reg x, y, clk, reset;
    wire z;

    // Instantiate the module
    sequential_circuit uut (
        .x(x),
        .y(y),
        .clk(clk),
        .reset(reset),
        .z(z)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10-time unit clock period
    end

    // Stimulus
    initial begin
        // Initialize inputs
        reset = 1; x = 0; y = 0;
        #10 reset = 0;

        // Test case 1
        #10 x = 1; y = 0;
        #10 x = 1; y = 1;

        // Test case 2
        #10 x = 0; y = 0;
        #10 x = 1; y = 0;

        // Test case 3
        #20 reset = 1;
        #10 reset = 0;

        #30 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t, x=%b, y=%b, A=%b, B=%b, z=%b", $time, x, y, uut.A, uut.B, z);
    end

endmodule
