module bcd_counter(
    input wire clk,
    input wire rst,
    input wire start,
    input wire enable,
    output reg [3:0] count,
    output reg carry
);
    reg running;
    always @(posedge clk) begin
        if (start) begin
            count <= 4'd0;
            carry <= 1'b0;
        end else if (enable) begin
            if (count == 4'd9) begin
                count <= 4'd0;
                carry <= 1'b1;
            end else begin
                count <= count + 4'd1;
                carry <= 1'b0;
            end
        end
    end
endmodule