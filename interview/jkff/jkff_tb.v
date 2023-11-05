`timescale 1ps/1ps
`include "jkff.v"

module jkff_tb;
    reg j, k, clk=0, pre, clr;
    wire q;

    always #1 clk <= ~clk;

    task test(input ji, ki, prei, clri);
        begin
            j <= ji;
            k <= ki;
            pre <= prei;
            clr <= clri;
        end
    endtask

    jkff dut(q, j, k, clk, pre, clr);

    initial begin
        $dumpfile("jkff_tb.vcd");
        $dumpvars(0, jkff_tb);

        pre <= 1;
        clr <= 1;

        @(negedge clk);
        test(1, 0, 0, 1);
        @(negedge clk);
        test(0, 0, 0, 0);
        @(negedge clk);
        test(1, 0, 0, 0);
        @(negedge clk);
        test(0, 0, 0, 0);
        @(negedge clk);
        test(0, 0, 0, 0);
        @(negedge clk);
        test(0, 1, 0, 0);
        @(negedge clk);
        test(0, 0, 0, 0);
        @(negedge clk);
        test(0, 0, 0, 0);
        @(negedge clk);
        test(1, 1, 0, 0);
        @(negedge clk);
        test(1, 1, 0, 0);
        @(negedge clk);
        test(1, 1, 0, 0);
        @(negedge clk);
        test(0, 1, 0, 0);
        @(negedge clk);
        test(0, 0, 0, 0);

        $finish;
        
    end

endmodule