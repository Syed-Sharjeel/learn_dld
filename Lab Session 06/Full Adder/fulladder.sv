module fulladder (s,cout, a,b,cin);
output s, cout;
input a,b,cin;
assign s = a^b^cin;
assign cout = (a & b) | (a & cin)|(b & cin);
endmodule