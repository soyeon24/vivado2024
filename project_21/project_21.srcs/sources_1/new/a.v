module Stopwatch(
    input wire clk_10kHz,
    input wire reset,
    input wire start,
    input wire stop,
    input wire css,
    output reg [15:0] lcd_display, // BCD format: B1B0.B-1B-2
    output reg [15:0] least_time  // Stores the least time in BCD
);

    // Internal signals
    reg [15:0] timer;            // Timer register
    reg running;                 // Indicates if stopwatch is running
    reg [15:0] last_time;        // Stores the last timer value

    // BCD representation for 99.99
    localparam [15:0] MAX_TIME_BCD = 16'b10011001_10011001;

    // Reset logic
    always @(posedge clk_10kHz or posedge reset) begin
        if (reset) begin
            timer <= 16'b0;
            running <= 0;
            least_time <= MAX_TIME_BCD;
            lcd_display <= 16'b0;
        end else if (start) begin
            timer <= 16'b0;
            running <= 1;
        end else if (stop) begin
            running <= 0;
            last_time <= timer;
            lcd_display <= timer;
        end else if (css) begin
            if (last_time < least_time) begin
                least_time <= last_time;
            end
            lcd_display <= least_time;
        end else if (running) begin
            if (timer != MAX_TIME_BCD) begin
                timer <= timer + 1;
            end
        end
    end

endmodule
