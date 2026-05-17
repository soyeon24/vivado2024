module output2(
    output Out_2,
    input A, B, C, D
 );
    
assign Out_2 = ((~C)&&D||B&&C&&D||C&&(~D))&&((~A)||B);
    
endmodule
