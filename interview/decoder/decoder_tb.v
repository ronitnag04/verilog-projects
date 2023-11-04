`timescale 1ns/1ns
`include "decoder.v"

module decoder_tb;

    reg[3:0] in;
    reg[1:0] sel;

    wire out;

    decoder dut(
        .A(in),
        .sel(sel),
        .Y(out)
    );

    initial begin
        $dumpfile("decoder_tb.vcd");
        $dumpvars(0, decoder_tb);

        #1;

        in = 4'b1010;
        sel = 2'b11;
        repeat(4) #2 sel = sel - 1;

        in = 4'b0011;
        sel = 2'b11;
        repeat(4) #2 sel = sel - 1;

        in = 4'b1000;
        sel = 2'b11;
        repeat(4) #2 sel = sel - 1; 
    end
    
endmodule
