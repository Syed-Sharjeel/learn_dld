module DEMUX6_1_tb;

reg d;
reg [2:0] sel;
wire [5:0] y;

DEMUX6_1 uut (
    .d(d),
    .sel(sel),
    .y(y)
);

initial begin
    d = 1'b1;

    sel = 3'd0;
    #10;
    sel = 3'd1;
    #10;
    sel = 3'd2;
    #10;
    sel = 3'd3;
    #10;
    sel = 3'd4;
    #10;
    sel = 3'd5;
    #10;
    sel = 3'd6;
    #10;

    d = 1'b0;
    sel = 3'd2;
    #10;

    $stop;
end

endmodule