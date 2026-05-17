`timescale 1ms/1ns  // 1ms 단위로 시뮬레이션, 1ns 정확도

module bcd_4bit_tb;

    // Testbench 신호 선언
    reg clk, start, stop;
    wire [15:0] count;
    wire overflow;

    // 모듈 인스턴스화
    bcd_4bit uut (
        .clk(clk),
        .start(start),
        .stop(stop),
        .count(count),
        .overflow(overflow)
    );

    // 클럭 생성: 0.01초 주기
    always begin
        #5 clk = ~clk;  // 주기 = 10ms (0.01초)
    end

    // Testbench 초기화
    initial begin
        // 초기 신호 값 설정
        clk = 0;
        start = 0;
        stop = 0;
        
        // 초기화 및 카운터 시작
        #10 start = 1;  // 시작 신호로 초기화
        #10 start = 0;  // 시작 신호 비활성화

        // 카운트 진행 확인
        #200 stop = 1;  // Stop 신호 활성화 (정지)
        #20 stop = 0;   // Stop 신호 비활성화 (다시 시작)

        // 다시 초기화
        #20 start = 1;  // 초기화
        #10 start = 0;

        // 일정 시간 동안 실행 후 종료
        #500 $stop;
    end

    // 카운터 출력 관찰
    initial begin
        $monitor("Time: %t | Count: %h | Overflow: %b", $time, count, overflow);
    end

endmodule
