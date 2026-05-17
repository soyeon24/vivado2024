
module mealy_fsm(
    input clk,
    input reset,
    input in,
    output reg out
);


    localparam A = 2'b00,
               B = 2'b01,
               C = 2'b10,
               D = 2'b11;

    reg [1:0] current_state, next_state;


    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= A;
        else
            current_state <= next_state;
    end


    always @(*) begin
        case (current_state)
            A: begin
                if (in) begin
                    next_state = D;
                    out = 1'b0;
                end else begin
                    next_state = B;
                    out = 1'b1;
                end
            end
            B: begin
                if (in) begin
                    next_state = C;
                    out = 1'b1;
                end else begin
                    next_state = B;
                    out = 1'b0;
                end
            end
            C: begin
                if (in) begin
                    next_state = D;
                    out = 1'b1;
                end else begin
                    next_state = C;
                    out = 1'b0;
                end
            end
            D: begin
                if (in) begin
                    next_state = A;
                    out = 1'b0;
                end else begin
                    next_state = D;
                    out = 1'b0;
                end
            end
            default: begin
                next_state = A;
                out = 1'b0;
            end
        endcase
    end

endmodule
