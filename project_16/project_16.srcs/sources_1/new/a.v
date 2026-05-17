module BinaryMultiplier (
    input [3:0] A, // 4-bit input A
    input [3:0] B, // 4-bit input B
    output [7:0] P // 8-bit product
);

    assign P = A * B;

endmodule