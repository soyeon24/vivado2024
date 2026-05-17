module adder_subtractor (
    input [7:0] A,         // 8-bit 입력 A
    input [7:0] B,         // 8-bit 입력 B
    input op,              // 연산 선택 신호 (0: 덧셈, 1: 뺄셈)
    output [7:0] result,   // 8-bit 연산 결과
    output carry_out       // 캐리 아웃 (덧셈의 경우)
);
    wire [7:0] B_mod;      // B를 연산 조건에 맞게 수정
    wire carry_in;         // 캐리 입력 (뺄셈 시 1, 덧셈 시 0)
    
    assign B_mod = op ? ~B : B;        // op=1이면 B의 1의 보수를 사용 (뺄셈)
    assign carry_in = op ? 1'b1 : 1'b0; // op=1이면 캐리 입력을 1로 설정

    // 덧셈기 사용 (A + B_mod + carry_in)
    assign {carry_out, result} = A + B_mod + carry_in;

endmodule
