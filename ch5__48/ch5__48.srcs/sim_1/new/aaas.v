`timescale 1ns/1ps

module mealy_fsm_tb();
    reg clk;
    reg reset;
    reg in;
    wire out;

    mealy_fsm uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("mealy_fsm_tb.vcd");
        $dumpvars(0, mealy_fsm_tb);

        reset = 1;
        in = 0;

        #10 reset = 0;

        #10 in = 0; // A -> B
        #10 in = 1; // B -> C
        #10 in = 1; // C -> D
        #10 in = 0; // D -> D
        #10 in = 1; // D -> A
        #10 in = 0; // A -> B

        #20 $finish;
    end
endmodule
