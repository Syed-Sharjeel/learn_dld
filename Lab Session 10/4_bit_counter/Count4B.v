module Count4B (
    input clk,
    input reset_n,  
    input load_n,   
    input enp,      
    input ent,      
    input [3:0] d,  
    output reg [3:0] q,
    output rco         
);

assign rco = (q == 4'd9) & ent;

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        q <= 4'd0;

    else if (!load_n)
        q <= d;

    else if (enp & ent) begin
        if (q == 4'd9)
            q <= 4'd0;
        else
            q <= q + 1;
    end
end

endmodule