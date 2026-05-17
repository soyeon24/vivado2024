module bcd_counter (
    input wire clk,
    input wire reset,
    input wire start,
    input wire stop,
    output reg [15:0] bcd_out
);
    reg running;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            bcd_out <= 16'd0;
            running <= 1'b0;
        end else if (start) begin
            running <= 1'b1;
        end else if (stop) begin
            running <= 1'b0;
        end else if (running) begin
            if (bcd_out[3:0] == 4'd9) begin
                bcd_out[3:0] <= 4'd0;
                if (bcd_out[7:4] == 4'd9) begin
                    bcd_out[7:4] <= 4'd0;
                    if (bcd_out[11:8] == 4'd9) begin
                        bcd_out[11:8] <= 4'd0;
                        if (bcd_out[15:12] == 4'd9) begin
                            bcd_out[15:12] <= 4'd0;
                        end else begin
                            bcd_out[15:12] <= bcd_out[15:12] + 4'd1;
                        end
                    end else begin
                        bcd_out[11:8] <= bcd_out[11:8] + 4'd1;
                    end
                end else begin
                    bcd_out[7:4] <= bcd_out[7:4] + 4'd1;
                end
            end else begin
                bcd_out[3:0] <= bcd_out[3:0] + 4'd1;
            end
        end
    end
endmodule