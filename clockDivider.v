// File Name: clockDivider.v
// Date: 19-12-2023

/*
A clock divider in Verilog, using the cascading flip-flop method.
*/

`timescale 10ns/1ns

module clock_divider(
  input clk,
  input reset,
  output reg clk_div2 = 1'b0,
  output reg clk_div4 = 1'b0,
  output reg clk_div8 = 1'b0,
  output reg clk_div16 = 1'b0
);

  // simple ripple clock divider
  
  always @(posedge clk)
    clk_div2 <= reset ? 0 : ~clk_div2;

  always @(posedge clk_div2)
    clk_div4 <= ~clk_div4;

  always @(posedge clk_div4)
    clk_div8 <= ~clk_div8;

  always @(posedge clk_div8)
    clk_div16 <= ~clk_div16;

endmodule

module testBench;
    reg clk, reset;
    wire clk_div2, clk_div4, clk_div8, clk_div16;
    
    clock_divider DUT (.clk(clk), .reset(reset), .clk_div2(clk_div2), .clk_div4(clk_div4), .clk_div8(clk_div8), .clk_div16(clk_div16));
    
    initial
        begin
          reset = 1'b1;
          clk = 1'b1;
          $dumpfile ("clockDivider.vcd");
          $dumpvars (0,testBench);
          $monitor ($time, " Clock = %b, Reset = %b, Clock2  = %b, Clock4 = %b, Clock8 = %b, Clock16 = %b", clk, reset, clk_div2, clk_div4, clk_div8, clk_div16);
          #2 reset = 1'b0;
          #200 $finish;
        end
    always
        #5 clk = ~ clk;
endmodule
