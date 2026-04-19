module multibitadder (s, cout, a, b, cin);
output [3:0] s;
output cout;
input  [3:0] a, b;
input cin;

assign {cout, s} = a + b + cin;

endmodule