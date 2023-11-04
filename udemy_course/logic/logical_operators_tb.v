`timescale 1ps/1ps
`include "logical_operators.v"

module logical_operators_tb;
    reg a, b;
    wire[3:0] out;

    logical_operators dut(
        .a(a),
        .b(b),
        .out(out)
    );

    initial begin
        $dumpfile("logical_operators_tb.vcd");
        $dumpvars(0, logical_operators_tb);

        a = 1'b1;
        b = 1'b0;
        #20;
        
        a = 1'b1;
        b = 1'b1;
        #20;
        
        a = 1'b0;
        b = 1'b0;
        #20;

        
    end




endmodule