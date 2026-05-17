module stopwatch(
    input wire clock,
    input wire start,
    input wire stop,
    input wire reset,
    output reg [3:0] b1,
    output reg [3:0] b0,
    output reg [3:0] b_1,
    output reg [3:0] b_2 
);

    reg running;

    // 초기화
    initial begin
        b1 = 0;
        b0 = 0;
        b_1 = 0;
        b_2 = 0;
        running = 0;
    end

    // 리셋 및 시작/정지 상태 관리
    always @(posedge reset or posedge start or posedge stop) begin
        if (reset) begin
            running <= 0;
            b1 <= 0;
            b0 <= 0;
            b_1 <= 0;
            b_2 <= 0;
        end else if (start) begin
            running <= 1;
        end else if (stop) begin
            running <= 0;
        end
    end

    // 카운터 로직
    always @(posedge clock) begin
        if (running) begin
            if (b_2 < 4'b1001) begin
                b_2 <= b_2 + 1;
            end else begin
                b_2 <= 0;
                if (b_1 < 4'b1001) begin
                    b_1 <= b_1 + 1;
                end else begin
                    b_1 <= 0;
                    if (b0 < 4'b1001) begin
                        b0 <= b0 + 1;
                    end else begin
                        b0 <= 0;
                        if (b1 < 4'b1001) begin
                            b1 <= b1 + 1;
                        end else begin
                            b1 <= 4'b1001; // 최대값 유지
                        end
                    end
                end
            end
        end
    end
endmodule
