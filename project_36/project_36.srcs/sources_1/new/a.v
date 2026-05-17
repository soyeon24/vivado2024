`timescale 100fs/100fs
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/06 19:20:00
// Design Name: 
// Module Name: timer
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


module timer(clk, rst, start, stop, css, b_1, b_0, b__1, b__2, flag, cnt);
    input clk;
    input rst;
    input start;
    input stop;
    input css;
    output [3:0] b_1;
    output [3:0] b_0;
    output [3:0] b__1;
    output [3:0] b__2;
    output flag;
    output cnt;
    
    
    reg [31:0] cnt;
    reg flag;   // if flag = 1, timer on. if flag = 0 timer off.
    reg [3:0] b_1;
    reg [3:0] b_0;
    reg [3:0] b__1;
    reg [3:0] b__2;
    reg [3:0] str_0;
    reg [3:0] str_1;
    reg [3:0] str_2;
    reg [3:0] str_3;
    reg [15:0] compare_1;
    reg [15:0] compare_2;
    
    always @(posedge clk, posedge rst) begin
        if (rst) begin
        str_0 <= 9;
        str_1 <= 9;
        str_2 <= 9;
        str_3 <= 9;  
        end
    end
    
    always @(posedge start) begin
        if(start) begin
        flag <= 1;
        cnt = 0;
        b_1 <= 4'b0000;
        b_0 <= 4'b0000;
        b__1 <= 4'b0000;
        b__2 <= 4'b0000;
        end
    end
    
    always @(posedge clk, posedge stop) begin
        if(stop) begin
        flag <= 0;
        end
    end
    
    always @(posedge clk, posedge css) begin
        if(css) begin
            compare_1 <= {str_0[3:0],str_1[3:0], str_2[3:0], str_3[3:0]};
            compare_2 <= {b_1[3:0], b_0[3:0], b__1[3:0], b__2[3:0]};
            if(compare_1 > compare_2) begin
                str_0 <= b_1;
                str_1 <= b_0;
                str_2 <= b__1;
                str_3 <= b__2;
            end
            else begin
                b_1 <= str_0;
                b_0 <= str_1;
                b__1 <= str_2;
                b__2 <= str_3;
            end   
        end
    end
    
    always @(posedge clk) begin
        if(flag) begin
            cnt <= (cnt + 1) % 100;
            if(cnt == 99) b__2 <= b__2 + 1;
        end
    end
    
    always @(posedge clk) begin
    if(b_1 > 9) begin // if count over 99.99
        
    end 
    else begin
        if(b__2 > 9) begin
            b__1 <= b__1 + 1;
            b__2 <= 0;
         end
         if(b__1 > 9) begin
            b_0 <= b_0 + 1;
            b__1 <= 0;
         end
         if(b_0 > 9) begin
            b_1 <= b_1 + 1;
            b_0 <= 0;
         end
    end
end 
    
endmodule
