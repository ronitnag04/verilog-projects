`include "fa_bh.v"

module fa_n #(parameter W = 4) (
    input[W-1:0] a,
    input[W-1:0] b,
    input c_in,

    output[W-1:0] s,
    output c_out
);

wire[W:0] ripple_c;
assign ripple_c[0] = c_in;

genvar bit_fa;
generate
    for (bit_fa = 0; bit_fa < W; bit_fa = bit_fa + 1) begin
        wire s_bit, c_out_bit;
        fa_bh fa(
            .s(s[bit_fa]),
            .c_out(ripple_c[bit_fa+1]),
            .a(a[bit_fa]),
            .b(b[bit_fa]),
            .c_in(ripple_c[bit_fa])
        );
    end
endgenerate

assign c_out = ripple_c[W];


endmodule
