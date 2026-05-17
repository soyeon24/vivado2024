module flip_flop (q, din, clk, rst);
 input din, clk, rst;
 output q;
 reg q;
 always @(posedge clk or posedge rst)
 begin
 if (rst == 1)
 q <= 0;
 else
 q <= din;
 end
 endmodule