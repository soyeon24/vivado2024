

module BCD_Counter(
    input clk,reset,
    output reg [3:0] count
    );
    
always@(posedge clk)
    if(reset)
    count = 4'b0000;
    else if (count<4'b1001)
    count=count+1'b1;
    else
    count = 4'b0000;
    
endmodule
