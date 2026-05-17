module tb_priority_encoder;
    reg [3:0] D;             // Test input
    wire [1:0] Y;            // Encoded output
    wire V;                  // Valid signal

    // Instantiate the priority encoder
    priority_encoder uut (
        .D(D),
        .Y(Y),
        .V(V)
    );

    initial begin
        // Initialize inputs
        D = 4'b0000;
        #10;

        // Test Case 1: Only D0 active
        D = 4'b0001;
        #10;

        // Test Case 2: Only D1 active
        D = 4'b0010;
        #10;

        // Test Case 3: Only D2 active
        D = 4'b0100;
        #10;

        // Test Case 4: Only D3 active
        D = 4'b1000;
        #10;

        // Test Case 5: Multiple inputs active (D0 has highest priority)
        D = 4'b1011;
        #10;

