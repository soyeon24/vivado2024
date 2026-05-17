module tb_priority_encoder;
    reg [3:0] D;          // Test input
    wire [1:0] Y;         // Encoded output
    wire valid;           // Valid output flag

    // Instantiate the priority encoder
    priority_encoder uut (
        .D(D),
        .Y(Y),
        .valid(valid)
    );

    initial begin
        // Test case 1: D0 active
        D = 4'b0001;
        #10;
        $display("Input: %b, Y: %b, Valid: %b", D, Y, valid);

        // Test case 2: D1 active
        D = 4'b0010;
        #10;
        $display("Input: %b, Y: %b, Valid: %b", D, Y, valid);

        // Test case 3: D2 active
        D = 4'b0100;
        #10;
        $display("Input: %b, Y: %b, Valid: %b", D, Y, valid);

        // Test case 4: D3 active
        D = 4'b1000;
        #10;
        $display("Input: %b, Y: %b, Valid: %b", D, Y, valid);

        // Test case 5: No inputs active
        D = 4'b0000;
        #10;
        $display("Input: %b, Y: %b, Valid: %b", D, Y, valid);

        // Test case 6: Multiple inputs active
        D = 4'b0110; // D1 and D2 active, expect Y=01
        #10;
        $display("Input: %b, Y: %b, Valid: %b", D, Y, valid);

        $finish;
    end
endmodule
