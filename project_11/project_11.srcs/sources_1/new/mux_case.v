module enc_for(in, out);
 input [7:0] in;
 output [2:0] out;
 reg [2:0] out;
 integer i;
 always @(in) begin : LOOP
 out = 0;
 for(i = 7; i >= 0; i = i -1) begin
 if(in[i]) begin
 out = i;
 disable LOOP;
 end
 end
 end
 endmodule