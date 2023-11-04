module uart_transmitter(
    input clk,
    input rst,
    input [7:0] data,
    input load,
    output wire tx
);
    reg[8:0] tx_queue = 9'b111111111;
    reg[4:0] transmit = 5'd9;
    reg tx_reg = 1'b1;
    assign tx = tx_reg;
    always @(negedge clk) tx_reg = (transmit > 0) ? tx_queue[0] : 1'b1;

    always @(posedge clk) begin
        if (rst) begin
            transmit <= 0;
            tx_queue <= 9'b111111111;
        end else if (load) begin
            transmit <= 9;
            tx_queue <= {data, 1'b0};
        end else if (transmit > 0) begin
            tx_queue <= {1'b1, tx_queue[8:1]};
            transmit <= transmit - 1;
        end
    end

endmodule