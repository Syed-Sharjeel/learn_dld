module SequenceDetector (
    input clk,
    input reset,
    input w,
    output reg z
);

reg [2:0] curr_st, nxt_st;


localparam IDLE = 3'd0,
           A = 3'd1,
           B = 3'd2,
           C = 3'd3,
           D = 3'd4,
           E = 3'd5,
           F = 3'd6,
           G = 3'd7;

always @(posedge clk or posedge reset) begin
    if (reset)
        curr_st <= IDLE;
    else
        curr_st <= nxt_st;
end

always @(*) begin
    case (curr_st)
        IDLE: nxt_st = (w == 1'b0) ? A : IDLE;
        A:    nxt_st = (w == 1'b1) ? B : A;
        B:    nxt_st = (w) ? C : A;
        C:    nxt_st = (w) ? D : A;
        D:    nxt_st = (w) ? E : A;
        E:    nxt_st = (w) ? F : A;
        F:    nxt_st = (w) ? G : A;
        G:    nxt_st = (w == 1'b0) ? A : IDLE;
        default: nxt_st = IDLE;
    endcase
end

always @(*) begin
    if (curr_st == G && w == 1'b0)
        z = 1'b1;
    else
        z = 1'b0;
end

endmodule