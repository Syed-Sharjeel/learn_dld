module SR8Bit (
    input clk,             
    input reset,           
    input load,            
    input shift_en,        
    input [7:0] data_in,   
    input serial_in,       
    output reg [7:0] q     
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 8'b00000000;     
    else if (load)
        q <= data_in;            
    else if (shift_en)
        q <= {q[6:0], serial_in};
end

endmodule