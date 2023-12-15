/*
 * Author: Krishna Kumar
 * File Name: 4bitShiftRegister.v
 * Objective: 4 bits Shift Register
 * Description: Writing a verilog code for implementation of 4 bit Shift Register. Shift Register is a group of flip flops used to store multiple bits of data. The bits stored in such registers can be made to move within the registers and in/out of the registers by applying clock pulses. An n-bit shift register can be formed by connecting n flip-flops where each flip-flop stores a single bit of data.
 * Date: 15-12-2023
 * Version: 1.0.01
 * Other files: Not required
 * Status: Ok
 */

module shiftreg_4bit (clock, clear, A, E);
    input clock, clear, A;
    output reg E;
    reg B, C, D;
    always @(posedge clock or negedge clear)
    begin
        if (!clear) begin B <= 0; C <= 0; D <= 0; E <= 0; end
        else
        begin
            E <= 0;
            D <= C;
            C <= B;
            B <= A;
        end
    end
endmodule


module shift_test;
    reg clk, clr, in;
    wire out;
    integer i;
    
    initial
        begin clk = 1'b0; #2 clr = 0; #5 clr = 1; end
    
    always #5 clk= ~clk;
    
    initial
    begin
        #2;
        repeat (2)
            begin #10 in = 0; #10 in = 1; #10 in = 1; end
    end
    
    initial
        begin
            $dumpfile ("shifter.vcd");
            $dumpvars (0, shift_test);
            #200 $finish;
        end
endmodule
