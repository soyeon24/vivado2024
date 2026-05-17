`timescale 100fs/100fs
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/06 20:09:53
// Design Name: 
// Module Name: timer_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module timer_tb();

    reg clk;
    reg rst;
    reg start;
    reg stop;
    reg css;
    wire [3:0] b_1;
    wire [3:0] b_0;
    wire [3:0] b__1;
    wire [3:0] b__2;
    wire flag;
    wire [31:0] cnt;
    
    timer u1(clk, rst, start, stop, css, b_1, b_0, b__1, b__2, flag, cnt);
    initial begin
        clk = 0;
        rst = 1;
        start = 0;
        stop = 0;
        css = 0;
        
        # 10 rst = 0;
        
        # 100 start = 1;
        # 100 start = 0;        
        # 665000 stop = 1;
        # 100 stop =10;
        
        # 100 css = 1;
        # 800000 css = 0;
        
        # 320000 start = 1;
        # 100 start = 0;        
        # 300000 stop = 1;
        # 100 stop =10;
        
        # 100 css = 1;
        # 800000 css = 0;
        
        # 100000 start = 1;
        # 100 start = 0;        
        # 450000 stop = 1;
        # 100 stop =10;
        
        # 100 css = 1;
        # 800000 css = 0;
        
        # 200000 start = 1;
        # 100 start = 0;        
        # 200000 stop = 1;
        # 100 stop =10;
        
        # 100 css = 1;
        # 800000 css = 0;
        
         # 10000000 rst = 0;
        
        # 100 start = 1;
        # 100 start = 0;        
        # 132000 stop = 1;
        # 100 stop =10;
        
        # 100 start = 1;
        # 100 start = 0;        
        # 480000 stop = 1;
        # 100 stop =10;
        
        # 100 start = 1;
        # 100 start = 0;        
        # 360000 stop = 1;
        # 100 stop =10;
        
        # 100 start = 1;
        # 100 start = 0;        
        # 800000 stop = 1;
        # 100 stop =10;
        
        
       
    end
    
    always #5 clk = ~clk;
    
endmodule
