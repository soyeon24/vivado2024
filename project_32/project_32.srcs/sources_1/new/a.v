module bcd_up(
    input wire clock, start,stop,
    output reg [3:0] count 

    );

    reg stopped;

initial begin
    count = 4'b0000;
    stopped = 1;
end

always @(negedge start) begin
    stopped <= 0; 
    count <= 4'b0000;
end

always @(posedge stop) begin
    stopped = 1; 
end
always @(posedge clock) begin
        if(!stopped) begin
            if(count<4'b1001) begin
                count <= count+4'b0001;
                stopped <= 0; 
            end
            else begin
                count <= 4'b0000;
                stopped <= 0; 
            end        
        end 
        
end
endmodule