 `timescale 1ns/1ps
 module testbench;
    reg [1:0] a, b;    // 2비트입력신호
reg sel;           // 선택신호
wire [1:0] out;    // 2비트출력신호
mux21_if uut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );
    initial begin
        // 테스트케이스1: sel = 0, a = 2'b01, b = 2'b10
        a = 2'b01;
        b = 2'b10;
        sel = 0; #10;
        $display("sel=%b, a=%b, b=%b -> out=%b", sel, a, b, out);
        // 테스트케이스2: sel = 1, a = 2'b01, b = 2'b10
        sel = 1; #10;
        $display("sel=%b, a=%b, b=%b -> out=%b", sel, a, b, out);
        // 테스트케이스3: sel = 0, a = 2'b11, b = 2'b00
        a = 2'b11;
        b = 2'b00;
        sel = 0; #10;
        $display("sel=%b, a=%b, b=%b -> out=%b", sel, a, b, out);
        // 테스트케이스4: sel = 1, a = 2'b11, b = 2'b00
        sel = 1; #10;
        $display("sel=%b, a=%b, b=%b -> out=%b", sel, a, b, out);
        $finish;
    end
 endmodule