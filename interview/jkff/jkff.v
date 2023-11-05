primitive jkff (q, j, k, clk, pre, clr);
    output q;
    reg q;
    input j, k, clk, pre, clr;
    table
    // j k clk pre clr : q_0 : q
       ? ?  ?   1   1  :  ?  : 1;
       ? ?  ?   1   0  :  ?  : 1;
       ? ?  ?   0   1  :  ?  : 0;
       0 0  R   0   0  :  ?  : -;
       1 0  R   0   0  :  ?  : 1;
       0 1  R   0   0  :  ?  : 0;
       1 1  R   0   0  :  0  : 1;
       1 1  R   0   0  :  1  : 0;
       ? ?  F   ?   ?  :  ?  : -;
       * ?  ?   ?   ?  :  ?  : -;
       ? *  ?   ?   ?  :  ?  : -;
       ? ?  ?   *   ?  :  ?  : -;
       ? ?  ?   ?   *  :  ?  : -;
    endtable
endprimitive