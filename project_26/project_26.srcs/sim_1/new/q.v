
`timescale 1ns / 1ps  // 1ns 단위 시뮬레이션

module stopwatch_counter_tb;

    // 테스트를 위한 입력 및 출력 신호 선언
    reg clk;            // 클록 신호
    reg reset;          // 리셋 신호
    wire [3:0] count;   // 카운터 출력

    // 테스트할 모듈 인스턴스화
    stopwatch_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // 클록 신호 생성 (50MHz 기준, 20ns 주기)
    initial clk = 0;
    always #10 clk = ~clk;  // 10ns마다 클록 토글 (20ns 주기 = 50MHz)

    // 테스트 시나리오
    initial begin
        $display("Starting simulation...");

        // 초기화
        reset = 1;       // 리셋 활성화
        #50;             // 50ns 대기
        reset = 0;       // 리셋 비활성화

        // 카운터 동작 테스트
        #200;            // 200ns 동안 클록 펄스 대기
        $display("Count after 200ns: %d", count);

        #1000;           // 1us 동안 클록 펄스 대기
        $display("Count after 1us: %d", count);

        #100000;         // 100us 동안 클록 펄스 대기
        $display("Count after 100us: %d", count);

        // 시뮬레이션 종료
        $stop;
    end
endmodule
