module upcounter_for_1ms (
    input clock, start, stop,
    output reg [3:0] count
    );

reg stopped;
initial begin
    stopped = 1;
    count = 4'b0000;
end

always@(posedge clock) begin
    if(start) begin
        stopped = 0;
    end
    if(stopped) begin
        stopped = 1;
    end
    else begin
        if(start)begin
            count = 4'b0000;
        end
        else if (count<4'b1001)
            count=count+1'b1;
        end
   end
   

endmodule