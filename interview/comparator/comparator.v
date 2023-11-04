module comparator #(parameter W = 4) (
    input[W-1:0] a, b,
    output g, e, l
);
    reg gr, er, lr;
    assign g = gr;
    assign e = er;
    assign l = lr;

    always @(*) begin
        case(a < b) 
            1'b1: begin gr = 1'b0; er = 1'b0; lr = 1'b1; end
            1'b0: begin gr = a > b; er = a == b; lr = 1'b0; end
            default: begin gr = 1'b0; er = 1'b0; lr = 1'b0; end
        endcase
    end

endmodule