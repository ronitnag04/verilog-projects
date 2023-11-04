module flip_flop (
    output reg q,
    
    input d,
    input clk,
    input reset    
);

always @(posedge clk) begin
    if (reset) q <= 1'b0;
    else q <= d;
end


endmodule