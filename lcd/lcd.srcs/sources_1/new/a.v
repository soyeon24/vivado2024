module lcd_display (
    input wire clk,           // 시스템 클럭
    input wire rst,           // 리셋 신호
    output reg rs,            // Register Select 신호
    output reg rw,            // Read/Write 신호
    output reg e,             // Enable 신호
    output reg [7:0] data     // 데이터 핀
);

    reg [3:0] number;         // 출력할 숫자 (0~9)
    reg [7:0] ascii_code;     // ASCII 변환값
    reg [15:0] clk_divider;   // 클럭 분주용
    reg [1:0] state;          // 상태 머신

    // 상태 정의
    localparam IDLE  = 2'b00;
    localparam LOAD  = 2'b01;
    localparam SEND  = 2'b10;
    localparam WAIT  = 2'b11;

    // 초기화 및 클럭 분주
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_divider <= 0;
        end else begin
            clk_divider <= clk_divider + 1;
        end
    end

    wire slow_clk = clk_divider[15]; // 분주된 클럭 (느리게 만듦)

    // 상태 머신
    always @(posedge slow_clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            number <= 0;
            e <= 0;
            rs <= 0;
            rw <= 0;
            data <= 8'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (number <= 9) begin
                        ascii_code <= number + 8'h30; // 숫자를 ASCII로 변환
                        state <= LOAD;
                    end
                end
                LOAD: begin
                    rs <= 1;        // 데이터 모드
                    rw <= 0;        // 쓰기 모드
                    data <= ascii_code;
                    state <= SEND;
                end
                SEND: begin
                    e <= 1;         // Enable 신호 설정
                    state <= WAIT;
                end
                WAIT: begin
                    e <= 0;         // Enable 신호 해제
                    if (number < 9)
                        number <= number + 1; // 다음 숫자로 이동
                    else
                        number <= 0;          // 숫자 반복
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule
