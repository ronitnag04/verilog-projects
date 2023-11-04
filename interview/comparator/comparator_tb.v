`timescale 1ns/1ns
`include "comparator.v"

module comparator_tb;
    parameter W = 8;

    reg[W-1:0] a=0, b=0;

    wire g, e, l;

    comparator #(W) dut(
        .a(a),
        .b(b),

        .g(g),
        .e(e),
        .l(l)
    );

    initial begin
        $dumpfile("comparator_tb.vcd");
        $dumpvars(0, comparator_tb);

        a = 5;
        b = 10;

        #2;

        a = 5;
        b = 5;

        #2;

        a = 5;
        b = 2;

        #2;

        a = 3;
        b = 3;

        #2;

        a = 1;
        b = 6;

        #2;

        $finish;
        
    end
    
endmodule
