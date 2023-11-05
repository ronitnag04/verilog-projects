`timescale 1ns/1ps
`include "uart_transmitter.v"

module uart_transmitter_tb;
    reg clk, rst, load;
    reg[7:0] data;

    always @(*) #1 clk <= ~clk;


    wire tx;

    uart_transmitter dut(
        .clk(clk),
        .rst(rst),
        .load(load),
        .data(data),
        .tx(tx)
    );

    initial begin
        $dumpfile("uart_transmitter_tb.vcd");
        $dumpvars(0, uart_transmitter_tb);
        $monitor("Time:%t | tx: %b", $time, tx);

        clk = 0;
        rst = 0;
        load = 0;

        

        @(posedge clk);
        rst <= 1;
        @(posedge clk);
        rst <= 0;
        @(posedge clk);

        @(negedge clk);
        load <= 1;
        data <= 8'b10101010;

        @(negedge clk);
        load <= 0;
        
        repeat(15) @(posedge clk);
        
        @(negedge clk);
        load <= 1;
        data <= 8'b01011100;

        @(negedge clk);
        load <= 0;
        
        repeat(15) @(posedge clk);

        $finish;

    end



endmodule
