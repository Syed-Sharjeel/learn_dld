module halfadder (s, cout, a, b);
output s, cout;
input a, b;

assign s = a ^ b;
assign cout = a & b;

endmodule