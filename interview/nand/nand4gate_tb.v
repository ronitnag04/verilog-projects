`timescale 1ps/1ps
`include "nand4gate.v"

module nand4gate_tb;
    reg [3:0] A = 0;
    reg [3:0] B = 0;
    wire [3:0] Y;

    nand4gate dut (.A(A), .B(B), .Y(Y));

    initial begin
        $dumpfile("nand4gate_tb.vcd");
        $dumpvars(0, nand4gate_tb);

        #2;
        A <= 4'b1010;
        B <= 4'b1111;

        #2;
        A <= 4'b1010;
        B <= 4'b0000;

        $finish;
    end

endmodule