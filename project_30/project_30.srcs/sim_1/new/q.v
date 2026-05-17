`timescale 1ns / 1ps

module testbench;
    // Declare inputs as regs and outputs as wires
    reg t_Count, t_Load, t_CLK, t_Clr;
    reg [3:0] t_IN;
    wire t_C0;
    wire [3:0] t_A;

    // Instantiate the counter module
    counter cnt (
        .Count(t_Count),    
        .Load(t_Load),
        .Data_in(t_IN),
        .CLK(t_CLK),
        .Clr(t_Clr),
        .A(t_A),
        .C0(t_C0)
    );

    // Clock generation
    always #5 t_CLK = ~t_CLK;

    // Testbench stimulus
    initial begin
        t_Clr = 0;    // Counter reset
        t_CLK = 0;    // Start with clock low
        t_Load = 0;   // Load disabled
        t_Count = 1;  // Enable counting
        t_IN = 4'b0000;

        // Apply reset
        #5 t_Clr = 1;  // Release reset after 5 ns

        // Load value 1001
        #40 t_Load = 1;
        t_IN = 4'b1001;
        #10 t_Load = 0;

        // Stop counting
        #70 t_Count = 0;

        // End simulation
        #85 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time: %t | A: %b | C0: %b | CLK: %b | Clr: %b | Load: %b | Count: %b | IN: %b", 
                 $time, t_A, t_C0, t_CLK, t_Clr, t_Load, t_Count, t_IN);
    end
endmodule
