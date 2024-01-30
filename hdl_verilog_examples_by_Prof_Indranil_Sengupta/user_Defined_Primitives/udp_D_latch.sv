primitive latch (q, clock, reset, d);
  //port declaration
  output reg q;
  input clock, reset, d;

  // initialization
  initial q = 0;
  table
    //clock   reset   d  :  q  :  q_next
        ?       1     ?  :  ?  :  0; // reset condition
        1       0     1  :  ?  :  1; // q = data
        1       0     0  :  ?  :  0; // q = data
        0       0     ?  :  ?  :  -; // retain previous state for clock = 0
  endtable
endprimitive

module udp_tb;
  reg clock, reset, d;
  wire q;
  
  latch lch(q, clock, reset, d);
  
  initial clock = 0;
  always #5 clock=~clock;
  
  initial begin
    $monitor("At time = %0t: clock = %b, reset = %b, d = %b, q = %b", $time, clock, reset, d, q);
    reset = 1;
    #10 reset = 0;
    d = 1;
    #20;
    d = 0;
    #10 $finish;
  end
  
endmodule
