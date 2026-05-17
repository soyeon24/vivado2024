module BCD_Counter(
    input wire clk,
    input wire reset,
    output reg [3:0] count
);

always @(posedge clk) begin
    if (reset) begin
        count <= 4'b0000;
    end else if (count < 4'b1001) begin
        count <= count + 1'b1;
    end else begin
        count <= 4'b0000;
    end
end

endmodule
