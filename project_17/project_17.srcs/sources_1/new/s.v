module priority_encoder (
    input [3:0] D,         // 4 input lines
    output reg [1:0] Y,    // Encoded output (2-bit)
    output reg valid       // Valid output flag
);
    always @(*) begin
        if (D[0]) begin
            Y = 2'b00;     // D0 has the highest priority
            valid = 1;
        end else if (D[1]) begin
            Y = 2'b01;     // D1 next priority
            valid = 1;
        end else if (D[2]) begin
            Y = 2'b10;     // D2 next
            valid = 1;
        end else if (D[3]) begin
            Y = 2'b11;     // D3 lowest priority
            valid = 1;
        end else begin
            Y = 2'bxx;     // No valid input
            valid = 0;
        end
    end
endmodule
