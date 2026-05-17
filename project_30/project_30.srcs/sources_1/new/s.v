module counter (
    input Count,
    input Load,
    input [3:0] Data_in,
    input CLK,
    input Clr,
    output reg [3:0] A,
    output reg C0
);
    always @(posedge CLK or negedge Clr) begin
        if (!Clr) begin
            A <= 4'b0000;
            C0 <= 1'b0;
        end else if (Load) begin
            A <= Data_in;
        end else if (Count) begin
            {C0, A} <= A + 1;
        end
    end
endmodule
