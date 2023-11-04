module traffic_light(
    output reg[1:0] state,
    input clk
);

    parameter r2g = 7;
    parameter g2y = 10;
    parameter y2r = 4;

    reg[3:0] cur_time = 4'd0;

    parameter red = 2'b00;
    parameter yellow = 2'b10;
    parameter green = 2'b11;

    initial begin
        state <= 2'b00;
    end

    always @(posedge clk) begin
        cur_time = cur_time + 1;
        if ((state == red) & (cur_time >= r2g)) begin
            state <= green;
            cur_time <= 0;
        end else if ((state == green) & (cur_time >= g2y)) begin
            state <= yellow;
            cur_time <= 0;
        end else if ((state == yellow) & (cur_time >= y2r)) begin
            state <= red;
            cur_time <= 0;
        end
    end
endmodule