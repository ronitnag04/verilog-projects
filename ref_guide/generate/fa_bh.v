module fa_bh(s, c_out, a, b, c_in);
    input a, b, c_in;
    output s, c_out;

    reg s, c_out;
    always @(a, b, c_in) begin
        s = a ^ b ^ c_in;
        c_out = (a&b) | (a&c_in) | (b&c_in);
    end


endmodule