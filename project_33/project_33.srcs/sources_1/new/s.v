// Stopwatch with LCD display in Verilog
module stopwatch(
    input wire clk,          // 10 kHz clock
    input wire start,        // Start button
    input wire stop,         // Stop button
    input wire css,          // Compare and store shortest button
    input wire reset,        // Reset button
    output reg [3:0] B1,     // Tens digit
    output reg [3:0] B0,     // Units digit
    output reg [3:0] Bm1,    // Tenths digit
    output reg [3:0] Bm2     // Hundredths digit
);

    reg [19:0] counter;      // Counter for 0.01 seconds increments (20 bits for 0 to 9999)
    reg [19:0] min_time;     // Register to store minimum time (BCD format)
    reg running;             // Flag for stopwatch state

    // Initialize values
    initial begin
        B1 = 4'd9;
        B0 = 4'd9;
        Bm1 = 4'd9;
        Bm2 = 4'd9;
        counter = 20'd0;
        min_time = 20'h9999; // Initial value equivalent to 99.99
        running = 1'b0;
    end

    // Clock division for 0.01 second increments (assuming 10 kHz clock)
    reg [9:0] clk_div;
    always @(posedge clk) begin
        if (clk_div == 10'd999) begin
            clk_div <= 10'd0;
            if (running) begin
                // Increment counter
                if (counter == 20'd9999) begin
                    counter <= 20'd0; // Reset to 0 after 99.99
                end else begin
                    counter <= counter + 1;
                end

                // Update BCD display
                B1 <= counter / 1000;
                B0 <= (counter / 100) % 10;
                Bm1 <= (counter / 10) % 10;
                Bm2 <= counter % 10;
            end
        end else begin
            clk_div <= clk_div + 1;
        end
    end

    // Button handling
    always @(posedge clk) begin
        if (reset) begin
            // Reset all values
            B1 <= 4'd9;
            B0 <= 4'd9;
            Bm1 <= 4'd9;
            Bm2 <= 4'd9;
            counter <= 20'd0;
            min_time <= 20'h9999;
            running <= 1'b0;
        end else if (start) begin
            // Start stopwatch
            counter <= 20'd0;
            running <= 1'b1;
        end else if (stop) begin
            // Stop stopwatch
            running <= 1'b0;
        end else if (css) begin
            // Compare and store shortest
            if (counter < min_time) begin
                min_time <= counter;
            end
            // Update display to minimum time
            B1 <= min_time / 1000;
            B0 <= (min_time / 100) % 10;
            Bm1 <= (min_time / 10) % 10;
            Bm2 <= min_time % 10;
        end
    end

endmodule
