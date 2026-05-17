`timescale 1ns/1ps

module stopwatch_tb;

    // 테스트 벤치에서 사용할 신호 선언
    reg clock;
    reg start;
    reg stop;
    reg reset;
    wire [3:0] b1, b0, b_1, b_2;

    // DUT (Device Under Test) 인스턴스화
    stopwatch uut (
        .clock(clock),
        .start(start),
        .stop(stop),
        .reset(reset),
        .b1(b1),
        .b0(b0),
        .b_1(b_1),
        .b_2(b_2)
    );

    // Clock 생성
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns 주기의 클럭 생성
    end

    // 테스트 시나리오
    initial begin
        // 초기화
        $display("Starting Testbench...");
        reset = 0;
        start = 0;
        stop = 0;
        #20;  // 20ns 대기

        // Reset 동작 테스트
        $display("Applying Reset...");
        reset = 1;
        #10;
        reset = 0;
        #20;

        // Start 동작 테스트
        $display("Starting Stopwatch...");
        start = 1;
        #10;
        start = 0;

        // 일정 시간 동안 카운트 동작 확인
        #100;

        // Stop 동작 테스트
        $display("Stopping Stopwatch...");
        stop = 1;
        #10;
        stop = 0;

        // 재시작 테스트
        $display("Restarting Stopwatch...");
        start = 1;
        #10;
        start = 0;

        #50;

        // 다시 Stop
        $display("Stopping Again...");
        stop = 1;
        #10;
        stop = 0;

        // 마지막으로 Reset 테스트
        $display("Final Reset...");
        reset = 1;
        #10;
        reset = 0;

        // 테스트 종료
        $display("Testbench Complete.");
        $stop;
    end

endmodule
