/*
 * Author: Krishna Kumar
 * File Name: 7bitBinaryCounter.v
 * Objective: 7-bit Binary Counter
 * Description: A binary counter is made from D-type flip flops configured as divide by 2 counters because each output is worth twice as much as the previous one and therefore should require twice as many clock pulses to make it go HIGH. The outputs from the binary counter represent 0 when they are LOW and 1 when they are HIGH.
 * Date: 16-12-2023
 * Version: 1.0.01
 * Other files: Not required
 * Status: OK
 */

module counter (clear, clock, count);
    parameter N = 7;
    input clear, clock;
    output reg [0:N] count;
    
    always @ (negedge clock)
        if (clear)
            count <= 0;
        else
            count <= count + 1;
endmodule


module test_counter;
    reg clk, clr;
    wire [7:0] out;
    
    counter CNT (clr, clk, out);
    
    initial clk = 1'b0;
    
    always #5 clk = ~clk;
    
    initial
        begin
            clr = 1'b1;
            #15 clr = 1'b0;
            #200 clr = 1'b0;
            #10 $finish;
        end
    initial
        begin
            $dumpfile ("7bitBinaryCounter.vcd");
            $dumpvars (0, test_counter);
            $monitor ($time, " Count: %d", out);
        end
endmodule
