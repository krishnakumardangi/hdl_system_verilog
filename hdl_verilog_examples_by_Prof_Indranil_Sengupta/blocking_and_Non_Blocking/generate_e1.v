module xor_bitwise (f, a, b);
    parameter N = 16;
    input [N-1:0] a, b;
    output [N-1:0] f;
    genvar p;
    
    generate
      for ( p = 0; p < N; p = p+1)
        begin
          xor XG (f[p], a[p], b[p]);
        end
    endgenerate
endmodule


module generate_test;
    reg [15:0] x, y;
    wire [15:0] out;
    
    xor_bitwise DUT (.f(out), .a(x), .b(y));
    
    initial
      begin
        $monitor ($time, "X: %b,  Y: %b,  Output: %b", x, y, out);
        x = 16'haaaa; y = 16'h00ff;
        #10 x = 16'h0f0f; y = 16'h3333;
        #20 $finish;
      end
endmodule
