module SequenceDetector_tb;

reg clk_sig;
reg rst_sig;
reg in_bit;
wire out_flag;

SequenceDetector dut (
    .clk(clk_sig),
    .reset(rst_sig),
    .w(in_bit),
    .z(out_flag)
);

always #5 clk_sig = ~clk_sig;

initial begin
    clk_sig = 0;
    rst_sig = 1;
    in_bit = 0;

    #15 rst_sig = 0;
end

initial begin
    @(negedge rst_sig);

    repeat (1) @(posedge clk_sig) in_bit = 0;
    repeat (6) @(posedge clk_sig) in_bit = 1;
    @(posedge clk_sig) in_bit = 0;

    #30;
    $finish;
end

endmodule