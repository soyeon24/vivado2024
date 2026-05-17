module logic_gates (
 input wire a,
 input wire b,
 output wire c_or,
 output wire c_and,
 output wire c_not,
 output wire c_xor
 );
 assign c_or = a | b;
 assign c_and = a & b;
 assign c_not = ~a;
 assign c_xor = a ^ b;
 endmodule