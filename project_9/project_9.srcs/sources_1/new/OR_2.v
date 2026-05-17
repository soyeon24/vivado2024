module sample(a, b, out);
 input a, b;
 output out;
 reg out;
 always @(a or b) begin
 if(a==1 || b==1) out = 1;  // blocking 할당문
else             out = 0;  // blocking 할당문
end
 endmodule