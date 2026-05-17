module bcd_counter(
    input wire clk, start, stop,
    output reg [3:0] count,
    output reg y
    );
    
    reg stopped;
    

    
always @(posedge clk) begin
    if (start) begin
        count = 4'b0000;
        y = 0;
        stopped = 0;
    end
    else if(stop) begin
    stopped = 1;
    end 
    else if(!stopped) begin
        if (count < 4'b1001) begin
            count = count + 1'b1;
            y = 0;
        end
        else begin
            count = 4'b0000;
            y = 1;
       end
    end
end

endmodule


