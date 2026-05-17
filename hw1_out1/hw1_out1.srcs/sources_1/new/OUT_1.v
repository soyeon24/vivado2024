module output1(
    output Out_1,
    input A,B,C,D

    );
    
    assign Out_1 = (A||(~B))&&(~C)&&(C||D);

endmodule