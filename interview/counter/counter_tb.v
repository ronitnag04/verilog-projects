`timescale 1ns/1ps
`include "counter.v"
`ifndef W
    `define W 8
`endif
`ifndef PERIOD
    `define PERIOD 2.5
`endif

module counter_tb;
    wire[`W-1:0] count;
    reg[`W-1:0] load = {`W{1'b1}};

    reg reset=1'b0, clk=1'b0, ce=1'b0, le=1'b0;

    always #(`PERIOD/2.0) clk <= ~clk;

    counter #(.W(`W)) dut(
        .count(count),
        .load(load),
        .reset(reset),
        .clk(clk),
        .le(le),
        .ce(ce)
    );

    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb);

        @(posedge clk);

        reset = 1'b1;
        repeat (3) @(posedge clk);
        reset = 1'b0;

        @(negedge clk);
        load = `W'd13;
        le = 1'b1;
        @(negedge clk);
        le = 1'b0;
        load = `W'd2;
        repeat (2) @(posedge clk);

        @(negedge clk)
        ce = 1'b1;
        repeat(10) @(posedge clk);

        $finish;
    end
    
endmodule