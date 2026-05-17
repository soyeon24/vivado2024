module priority_encoder(
    input wire [3:0] D,    // 4-bit input
    output reg [1:0] Y,    // 2-bit encoded output
    output reg V          // Valid signal
);
    always @(*) begin
        if (D[0]) begin
            V = 1;
        end else if (D[1]) begin
            Y = 2'b01;
            V = 1;
        end else if (D[2]) begin
            Y = 2'b10;
            V = 1;
        end else if (D[3]) begin
            Y = 2'b11;  // Lowest priority
            V = 1;
        end else begin
            Y = 2'b00;  // Default state
            V = 0;      // No valid input
        end
    end
endmodule
