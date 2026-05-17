`timescale 1ns / 1ps

module tb();

    // 신호 선언
    reg clk;
    reg reset;
    wire [3:0] count;

    // UUT(테스트 대상 모듈) 인스턴스화
    BCD_Counter uut (
        .clk(clk),       // clk를 BCD_Counter의 clk에 연결
        .reset(reset),   // reset를 BCD_Counter의 reset에 연결
        .count(count)    // count를 BCD_Counter의 count에 연결
    );

    initial begin
        clk = 0;         
        reset = 1;      
        #10 reset = 1;   
        #10 reset = 0;  
        #30 reset = 1;  
        #10 reset = 0;   
        
    end

    // clk 신호 생성
    always #5 clk = ~clk; // 10ns 주기의 클럭 생성

endmodule
