module parityencoder (p, a, b, c);
output p;
input a, b, c;

assign p = a ^ b ^ c;
endmodule