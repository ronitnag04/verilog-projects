primitive nandgate(q, a, b, en);
    output q;
    input a, b, en;
    table 
    //  a b en : q
        ? ? 0 : 0;
        0 0 1 : 1;
        1 0 1 : 1;
        0 1 1 : 1;
        1 1 1 : 0;
    endtable 
endprimitive


module nand4gate(
    input[3:0] A,
    input[3:0] B,
    output[3:0] Y
);

    nandgate gate0(Y[0], A[0], B[0], 1'b1);
    nandgate gate1(Y[1], A[1], B[1], 1'b1);
    nandgate gate2(Y[2], A[2], B[2], 1'b1);
    nandgate gate3(Y[3], A[3], B[3], 1'b1);

endmodule