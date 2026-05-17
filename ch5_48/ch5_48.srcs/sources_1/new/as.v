module mealy_fsm (
    input wire clk,
    input wire reset,
    input wire x,
    output reg z
);
    // State encoding
    typedef enum reg [1:0] {
        S_A = 2'b00, // State a
        S_B = 2'b01, // State b
        S_C = 2'b10, // State c
        S_D = 2'b11  // State d
    } state_t;

    state_t current_state, next_state;

    // State transition and output logic
    always @(*) begin
        // Default values
        next_state = current_state;
        z = 0;

        case (current_state)
            S_A: begin
                if (x) begin
                    next_state = S_D;
                    z = 1;
                end else begin
                    next_state = S_B;
                    z = 1;
                end
            end
            S_B: begin
                if (x) begin
                    next_state = S_C;
                    z = 1;
                end else begin
                    next_state = S_B;
                    z = 0;
                end
            end
            S_C: begin
                if (x) begin
                    next_state = S_D;
                    z = 1;
                end else begin
                    next_state = S_C;
                    z = 0;
                end
            end
            S_D: begin
                if (x) begin
                    next_state = S_D;
                    z = 1;
                end else begin
                    next_state = S_A;
                    z = 0;
                end
            end
        endcase
    end

    // Sequential state update
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S_A;
        else
            current_state <= next_state;
    end

endmodule