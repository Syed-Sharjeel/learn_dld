module Count4B_tb;

reg clk;
reg reset_n;
reg load_n;
reg enp;
reg ent;
reg [3:0] d;

wire [3:0] q;
wire rco;

Count4B uut (
    .clk(clk),
    .reset_n(reset_n),
    .load_n(load_n),
    .enp(enp),
    .ent(ent),
    .d(d),
    .q(q),
    .rco(rco)
);

always #5 clk = ~clk;

initial begin
	 clk = 0;
    reset_n = 0;
    load_n = 1;
    enp = 0;
    ent = 0;
    d = 4'd0;

    #20;
    reset_n = 1;

    enp = 1;
    ent = 1;

    #120;

    load_n = 0;
    d = 4'd7;
    #10;
    load_n = 1;

    #100;

    enp = 0;
    ent = 0;

    #50;
    $stop;
end

endmodule