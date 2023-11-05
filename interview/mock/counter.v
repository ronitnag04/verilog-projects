module counter (
    input clk, up_down, reset_n, enable,
    output reg [3:0] count
);


    always @(posedge clk) begin
        if (reset_n == 1'b1) begin
            count <= 4'b0000;
        end else if (enable) begin
            count <= up_down ? count + 1 : count - 1;
        end
    end
endmodule