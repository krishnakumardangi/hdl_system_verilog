// Up-Down counter (synchronous clear)
module counter (mode, clr, ld, d_in, clk, count);
    input mode, clr, ld, clk;
    input [0:7] d_in;
    output reg [0:7] count;
    
    always @ (posedge clk)
      begin
        if (ld)
            count <= d_in;
        else if (clr)
            count <= 0;
        else if (mode)
            count <= count + 1;
        else 
            count <= count - 1;
      end
endmodule



// Parameterized design: An N-bit counter
module counter_N ( clear, clock, count);
    parameter N = 7;
    input clear, clock;
    output reg [0:N] count;
    
    always @ (negedge clock)
      begin
        if (clear)
            count <= 0;
        else
            count <= count + 1;
      end
endmodule
