// Modeling Combinational Circuits
// A 4-input AND function

primitive udp_and4 (f, a, b, c, d);
    input a, b, c, d;
    output f;
    table
    // a b c d : f;
       0 ? ? ? : 0;
       ? 0 ? ? : 0;
       0 ? 0 ? : 0;
       ? ? ? 0 : 0;
       1 1 1 1 : 1;
    endtable
endprimitive

module b4_AND(a, b, c, d, o);
    input a, b, c, d;
    output o;
     
    udp_and4 AND4 (o, a, b, c, d);
endmodule
