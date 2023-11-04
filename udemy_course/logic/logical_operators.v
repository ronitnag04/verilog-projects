module logical_operators(
    input a,
    input b,
    output[3:0] out
);

    reg[3:0] x;
    assign out = x;
    always begin
        #1 x = -2'b1;
    end

endmodule

