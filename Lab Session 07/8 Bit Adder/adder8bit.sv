module adder8bit (s, cout, a, b, cin);
output [7:0] s;
output cout;
input  [7:0] a, b;
input cin;

assign {cout, s} = a + b + cin;

endmodule