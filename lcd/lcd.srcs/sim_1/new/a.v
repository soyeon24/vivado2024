`timescale 1ns/1ps  // 시뮬레이션 단위와 정밀도 설정

module tb_lcd_display;

    reg clk;
    reg rst;
    wire rs;
    wire rw;
    wire e;
    wire [7:0] data;

    lcd_display uut (
        .clk(clk),
        .rst(rst),
        .rs(rs),
        .rw(rw),
        .e(e),
        .data(data)
    );

    initial begin
        clk = 0;
        rst = 1;
        #20 rst = 0;  // 20ns 후 리셋 해제
    end

    always #5 clk = ~clk; // 10ns 주기의 클럭 생성

    initial begin
        #1000; // 1000ns 동안 시뮬레이션
        $stop;
    end
endmodule
