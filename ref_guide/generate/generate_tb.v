`include "fa_n.v"
`timescale 1ps/1ps

module generate_tb;
    localparam W = 16;
    reg[W-1:0] a, b;
    reg c_in;
    wire[W-1:0] s;
    wire c_out;

    fa_n #(.W(16)) dut(
        a, b, c_in,
        s, c_out
    );

    initial begin
        $dumpfile("generate_tb.vcd");
        $dumpvars(0, generate_tb);

        a = {W{1'b1}};
        b = {W{1'b1}};
        c_in = 1'b0;
        #20;

        a = 16'd10;
        b = 16'd23;
        c_in = 1'b0;
        #20;

        a = 16'd42;
        b = 16'd5;
        c_in = 1'b1;
        #20;

        a = 16'd90;
        b = 16'd170;
        c_in = 1'b1;
        #20;
    end 



endmodule