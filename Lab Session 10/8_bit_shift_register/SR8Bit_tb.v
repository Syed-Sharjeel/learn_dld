`timescale 1ns/1ps

module SR8Bit_tb;

reg clk;
reg reset;
reg load;
reg shift_en;
reg [7:0] data_in;
reg serial_in;
wire [7:0] q;

shift_register_8bit uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .shift_en(shift_en),
    .data_in(data_in),
    .serial_in(serial_in),
    .q(q)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 0;
    load = 0;
    shift_en = 0;
    data_in = 8'b00000000;
    serial_in = 0;

    #2 reset = 1;
    #10 reset = 0;

    #10 load = 1;
    data_in = 8'b10101010;
    #10 load = 0;

    shift_en = 1;

    serial_in = 1; #10;
    serial_in = 0; #10;
    serial_in = 1; #10;
    serial_in = 1; #10;

    shift_en = 0;

    
    #20;
end

initial begin
    $monitor("t=%0t | reset=%b load=%b shift=%b serial_in=%b q=%b",
              $time, reset, load, shift_en, serial_in, q);
end

endmodule