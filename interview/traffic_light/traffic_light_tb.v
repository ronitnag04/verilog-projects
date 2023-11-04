`timescale 1ns/1ns
`include "traffic_light.v"

module traffic_light_tb;
    reg clk = 1'b0;

    always #(1) clk <= ~clk;

    wire[1:0] state;

    traffic_light dut(
        .state(state),
        .clk(clk)
    );

    initial begin
        $dumpfile("traffic_light_tb.vcd");
        $dumpvars(0, traffic_light_tb);

        repeat(100) @(posedge clk);
        $finish;

    end



endmodule