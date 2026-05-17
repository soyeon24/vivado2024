module stopwatch_counter (
    input wire clk,         // 클록 신호
    input wire reset,       // 리셋 신호
    output reg [3:0] count  // 4비트 카운터 출력
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b0000;  // 리셋 시 카운터를 0으로 초기화
        end else if (count == 4'b1001) begin
            count <= 4'b0000;  // 9에서 0으로 롤오버
        end else begin
            count <= count + 1;  // 카운트 증가
        end
    end
endmodule
