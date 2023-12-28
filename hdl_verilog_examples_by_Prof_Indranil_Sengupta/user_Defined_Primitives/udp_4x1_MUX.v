// Modeling Combinational Circuit

// A 4-to-1 multiplexer 
primitive udp_mux4x1 (f, s0, s1, i0, i1, i2, i3); 
    input s0, s1, i0, i1, i2, i3; 
    output f; 
    table 
    // s0 s1 i0 i1 i2 i3 : f 
       0 0 0 ? ? ? : 0; 
       0 0 1 ? ? ? : 1; 
       1 0 ? 0 ? ? : 0; 
       1 0 ? 1 ? ? : 1; 
       0 1 ? ? 0 ? : 0; 
       0 1 ? ? 1 ? : 1; 
       1 1 ? ? ? 0 : 0; 
       1 1 ? ? ? 1 : 1; 
    endtable
endprimitive

module mux_4x1 (S0, S1, I0, I1, I2, I3, Y);
    input S0, S1, I0, I1, I2, I3;
    output Y;
    
     udp_mux4x1 M (Y, S0, S1, I0, I1, I2, I3);
endmodule
