`timescale 1ns/1ns
`include "counter.v"


module counter_tb;
    
    reg clk=1'b0, reset_n=1'b0, enable=1'b0, up_down=1'b0;

    wire [3:0] count;

    counter dut(
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .up_down(up_down),

        .count(count)
    );

    always #1 clk <= ~clk;

    always @(posedge clk)
        $monitor("Time: %t, reset_n: %b, enable: %b, up_down: %b, count: %b / %d", 
                        $time,  reset_n,     enable,     up_down, count,    count);

    initial begin
        @(negedge clk);
        reset_n <= 1'b1;
        @(negedge clk);
        reset_n <= 1'b0;
        @(negedge clk);
        up_down <= 1'b1;
        repeat(2) @(negedge clk);
        enable <= 1'b1;
        repeat(5) @(negedge clk);
        enable <= 1'b0;
        repeat(3) @(negedge clk);
        @(negedge clk);
        enable <= 1'b1;
        repeat(20) @(negedge clk);
        up_down <= 1'b0;
        repeat(20) @(negedge clk);
        reset_n <= 1'b1;
        @(negedge clk);
        reset_n <= 1'b0;
        enable <= 1'b0;
        repeat (2) @(negedge clk);
        $finish;
    end
endmodule