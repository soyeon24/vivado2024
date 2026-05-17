

module sequential_circuit (
    input wire x,
    input wire y,
    input wire clk,
    input wire reset,
    output wire z
);
    // Flip-flops
    reg A, B;

    // Next state logic
    wire next_A = (x & ~y) | (x & B);
    wire next_B = (x & A) | (x & ~B);

    // Flip-flop behavior
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A <= 1'b0;
            B <= 1'b0;
        end else begin
            A <= next_A;
            B <= next_B;
        end
    end

    // Output logic
    assign z = A;

endmodule