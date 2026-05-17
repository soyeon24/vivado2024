module mux2b_if(in0, in1, sel, out);
 input [1:0] in0, in1;
 input       sel;
 output [1:0] out;
 reg    [1:0] out;
 always @(sel or in0 or in1) begin
 if (sel == 0)
 out = in0;
 else
 out = in1;
 end
 endmodule