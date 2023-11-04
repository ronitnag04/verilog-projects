`timescale 1ns / 1ps
`include "buffer.v"

module buffer_tb;

reg A;
wire B;

buffer dut(
    .A(A),
    .B(B)
);

initial begin
    $dumpfile("buffer_tb.vcd");
    $dumpvars(0, buffer_tb);
    A = 1'b0;
    #20;

    A = 1'b1;
    #20;

    A = 1'b0;
    #20;
    $display("Test Complete");
end


endmodule