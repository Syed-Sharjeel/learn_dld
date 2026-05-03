module MUX6_1_tb;

reg [5:0] d;
reg [2:0] sel;
wire y;

MUX6_1 uut (
    .d(d),
    .sel(sel),
    .y(y)
);

initial begin
    d = 6'b101011;

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

    $stop;
end

endmodule