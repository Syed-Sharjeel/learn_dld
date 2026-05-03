module MUX6_1 (
    input [5:0] d,
    input [2:0] sel,
    output reg y
);

always @(*) begin
    case (sel)
        3'd0: y = d[0];
        3'd1: y = d[1];
        3'd2: y = d[2];
        3'd3: y = d[3];
        3'd4: y = d[4];
        3'd5: y = d[5];
        default: y = 1'b0;
    endcase
end

endmodule