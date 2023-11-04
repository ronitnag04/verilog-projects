`timescale 1ns/1ps
`include "flip_flop.v"



module flip_flop_tb;
    parameter real period = 1.2;
    wire q;
    reg d, clk = 0, reset = 0;

    flip_flop dut(
        .q(q),
        .reset(reset),
        .clk(clk),
        .d(d)
    );

    always #(period/2.0) clk <= ~clk;

    initial begin
        $dumpfile("flip_flop_tb.vcd");
        $dumpvars(0, flip_flop_tb);


        d = 1'b1;
        repeat (2) @(posedge clk);

        @(negedge clk)
        #(0.01:0.05:0.10)
        
        d = 1'b0;
        repeat (3) @(posedge clk);
        $finish;
    end

    


    


endmodule