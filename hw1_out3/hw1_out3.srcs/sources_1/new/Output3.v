module Output3(
output Out_3,
input A, B, C, D
);
assign Out_3 = ((A&&B||C)&&D)||((~B)&&C);
endmodule


