module ALU_5Bit (
    input [4:0] A1,
    input [4:0] A2,
    input [1:0] op,
    output reg [9:0] Y
);

    wire [5:0] sum;
    wire [5:0] diff;
    reg  [9:0] prod;

    assign sum  = A1 + A2;
    assign diff = A1 - A2;

    always @(*) begin
        prod = (A2[0] ? (A1 << 0) : 10'd0) +
               (A2[1] ? (A1 << 1) : 10'd0) +
               (A2[2] ? (A1 << 2) : 10'd0) +
               (A2[3] ? (A1 << 3) : 10'd0) +
               (A2[4] ? (A1 << 4) : 10'd0);
    end


    always @(*) begin
        case (op)
            2'b00: Y = {4'd0, sum}; 
            2'b01: Y = {4'd0, diff};
            2'b10: Y = prod;
            default: Y = 10'd0;
        endcase
    end

endmodule