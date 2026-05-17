module ones_counter (
    input wire clk,        
    input wire reset,     
    input wire x,          
    output reg y           
);

    parameter S0 = 2'b00; 
    parameter S1 = 2'b01; 
    parameter S2 = 2'b10; 
    parameter S3 = 2'b11;
    
    reg [1:0] current_state, next_state;

    always @(*) begin

        next_state = current_state;
        y = 0;

        case (current_state)
            S0: begin
                if (x) next_state = S1;
            end
            S1: begin
                if (x) next_state = S2;
                else next_state = S0;
            end
            S2: begin
                if (x) begin
                    next_state = S3;
                    y = 1; 
                end else begin
                    next_state = S0;
                end
            end
            S3: begin
                if (x) begin
                    next_state = S3;
                    y = 1; 
                end else begin
                    next_state = S0;
                end
            end
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

endmodule
