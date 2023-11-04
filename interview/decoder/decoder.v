module decoder (
    output Y,
    input[3:0] A,
    input[1:0] sel
);

assign Y = A[sel];

endmodule