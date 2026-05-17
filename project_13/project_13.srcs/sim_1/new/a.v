module adder_subtractor_tb;

    // Inputs
    reg [7:0] A;
    reg [7:0] B;
    reg op;

    // Outputs
    wire [7:0] result;
    wire carry_out;

    // Instantiate the Unit Under Test (UUT)
    adder_subtractor uut (
        .A(A), 
        .B(B), 
        .op(op), 
        .result(result), 
        .carry_out(carry_out)
    );

    initial begin
        // Monitor signals for debugging
        $monitor("Time: %0d | A: %b (%0d), B: %b (%0d), op: %b | result: %b (%0d), carry_out: %b", 
                 $time, A, A, B, B, op, result, result, carry_out);

        // Initialize inputs
        A = 0; B = 0; op = 0;
        #10;

        // Test Case 1: 5 + 3
        A = 8'b00000101; B = 8'b00000011; op = 0; // Addition
        #10;

        // Test Case 2: 10 - 7
        A = 8'b00001010; B = 8'b00000111; op = 1; // Subtraction
        #10;

        // Test Case 3: 15 + 20
        A = 8'b00001111; B = 8'b00010100; op = 0; // Addition
        #10;

        // Test Case 4: 50 - 25
        A = 8'b00110010; B = 8'b00011001; op = 1; // Subtraction
        #10;

        // Test Case 5: Overflow case (255 + 1)
        A = 8'b11111111; B = 8'b00000001; op = 0; // Addition
        #10;

        // Test Case 6: Underflow case (0 - 1)
        A = 8'b00000000; B = 8'b00000001; op = 1; // Subtraction
        #10;

        // End simulation
        $stop;
    end

endmodule
