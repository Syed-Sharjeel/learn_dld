module BCD7S_tb;

reg [3:0] bcd;
wire [6:0] seg;

BCD7S uut (
    .bcd(bcd),
    .seg(seg)
);

initial begin
    bcd = 4'd0;
    #10;
    bcd = 4'd1;
    #10;
    bcd = 4'd2;
    #10;
    bcd = 4'd3;
    #10;
    bcd = 4'd4;
    #10;
    bcd = 4'd5;
    #10;
    bcd = 4'd6;
    #10;
    bcd = 4'd7;
    #10;
    bcd = 4'd8;
    #10;
    bcd = 4'd9;
    #10;
    bcd = 4'd10;
    #10;
    $stop;
end

endmodule