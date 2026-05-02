module ALU_5Bit_tb;

    reg  [4:0] A1;
    reg  [4:0] A2;
    reg  [1:0] op;
    wire [9:0] Y;

    // Instantiate DUT
    ALU_5Bit uut (
        .A1(A1),
        .A2(A2),
        .op(op),
        .Y(Y)
    );

    // Stimulus block
    initial begin
        // Initialize
        A1 = 5'd0;
        A2 = 5'd0;
        op = 2'b00;

        // Test Addition
        #10 A1 = 5'd7;  A2 = 5'd3;  op = 2'b00;
        #10 A1 = 5'd15; A2 = 5'd10; op = 2'b00;

        // Test Subtraction
        #10 A1 = 5'd20; A2 = 5'd5;  op = 2'b01;
        #10 A1 = 5'd9;  A2 = 5'd12; op = 2'b01;

        // Test Multiplication
        #10 A1 = 5'd4;  A2 = 5'd3;  op = 2'b10;
        #10 A1 = 5'd6;  A2 = 5'd7;  op = 2'b10;

        // Edge cases
        #10 A1 = 5'd0;  A2 = 5'd31; op = 2'b10;
        #10 A1 = 5'd31; A2 = 5'd31; op = 2'b00;

        #10 $stop;
    end

endmodule