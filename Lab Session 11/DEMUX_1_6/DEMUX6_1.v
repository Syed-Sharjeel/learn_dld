module DEMUX6_1 (
    input d,
    input [2:0] sel,
    output reg [5:0] y
);

always @(*) begin
    y = 6'b000000;
    case (sel)
        3'd0: y[0] = d;
        3'd1: y[1] = d;
        3'd2: y[2] = d;
        3'd3: y[3] = d;
        3'd4: y[4] = d;
        3'd5: y[5] = d;
        default: y = 6'b000000;
    endcase
end

endmodule