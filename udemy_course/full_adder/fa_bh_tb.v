`timescale 1ns/1ns
`include "fa_bh.v"

module fa_bh_tb;
    reg a, b, c_in;
    wire s, c_out;

    fa_bh dut(
        .a(a),
        .b(b),
        .c_in(c_in),

        .s(s),
        .c_out(c_out)
    );

    initial begin
        $dumpfile("fa_bh_tb.vcd");
        $dumpvars(0, fa_bh_tb);
        $monitor("time=%d \t a=%b \t b=%b \t c_in=%b \t s=%b \t c_out=%b", $time, a, b, c_in, s, c_out);

        a = 1'b1;
        b = 1'b1;
        c_in = 1'b0;
        #20;

        
        a = 1'b0;
        b = 1'b1;
        c_in = 1'b1;
        #20;

        
        a = 1'b1;
        b = 1'b1;
        c_in = 1'b1;
        #20;

        
        a = 1'b0;
        b = 1'b1;
        c_in = 1'b0;
        #20;
        $display("Test Complete!");
        $finish;
    end
endmodule