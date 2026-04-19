module subtractor8bit (d, bout, a, b, bin);
output [7:0] d;
output bout;
input  [7:0] a, b;
input bin;

assign {bout, d} = a - b - bin;

endmodule