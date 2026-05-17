`timescale 1ns/1ps

module main(
    input wire clk,
    input wire rst,
    input wire start,
    input wire stop,
    output wire [3:0] digit0,
    output wire [3:0] digit1,
    output wire [3:0] digit2,
    output wire [3:0] digit3
);
    wire carry0, carry1, carry2;
    reg enable;
    
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            enable <= 1'b0;
        end else if (start) begin
            enable <= 1'b1;
        end else if (stop) begin
            enable <= 1'b0;
        end
    end

    bcd_counter u0 (
        .clk(clk),
        .rst(rst),
        .start(start),
        .enable(enable),
        .count(digit0),
        .carry(carry0)
    );

    bcd_counter u1 (
        .clk(clk),
        .rst(rst),
        .start(start),
        .enable(carry0),
        .count(digit1),
        .carry(carry1)
    );

    bcd_counter u2 (
        .clk(clk),
        .rst(rst),
        .start(start),
        .enable(carry1),
        .count(digit2),
        .carry(carry2)
    );

    bcd_counter u3 (
        .clk(clk),
        .rst(rst),
        .start(start),
        .enable(carry2),
        .count(digit3),
        .carry()
    );
endmodule
