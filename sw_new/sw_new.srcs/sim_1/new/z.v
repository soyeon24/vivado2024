


module bcd_4bit(
    input wire clk, start, stop,
    output wire [15:0] count,
    output wire overflow
    );
    
   // 각 BCD 카운터의 출력 및 carry
    wire [3:0] bcd_2, bcd_1, bcd0, bcd1;
    wire carry_2, carry_1, carry0, carry1;
   

    // 첫 번째 자리 (-2의 자리)
    bcd_counter counter_2 (
        .clk(clk),
        .start(start),
        .stop(stop),
        .count(bcd_2),
        .y(carry_2)   // carry_2: 다음 자리로의 carry
    );

    // 두 번째 자리 (-1의 자리)
    bcd_counter counter_1 (
        .clk(carry_2),  // 이전 자리의 carry가 clock 역할
        .start(start),
        .stop(stop),
        .count(bcd_1),
        .y(carry_1)
    );

    // 세 번째 자리 (1의 자리)
    bcd_counter counter0 (
        .clk(carry_1),  // 이전 자리의 carry가 clock 역할
        .start(start),
        .stop(stop),
        .count(bcd0),
        .y(carry0)
    );

    // 네 번째 자리 (10의 자리)
    bcd_counter counter1 (
        .clk(carry0),  // 이전 자리의 carry가 clock 역할
        .start(start),
        .stop(stop),
        .count(bcd1),
        .y(carry1)
    );
    
        assign count = {bcd1, bcd0, bcd_1, bcd_2};
        assign overflow = carry1;
        
endmodule


