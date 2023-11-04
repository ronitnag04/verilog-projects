module counter #(parameter W = 4) (
    output reg[W-1:0] count,
    
    input[W-1:0] load,
    input clk, reset, ce, le
);

    always @(posedge clk) begin
        if (reset) count <= {W{1'b0}};
        else if (le) count <= load;
        else if (ce) count <= count + 1;
    end
endmodule