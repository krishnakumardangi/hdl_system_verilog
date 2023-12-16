/*
 * Author: Krishna Kumar
 * File Name: verilogExampleT1.v
 * Objective: Writing a verilog example
 * Description: In this example, we can observed that last module get compile first and top module get compile at end (compile mean produce display first). 
 * And $monitor produce output at end of program and only one $monitor can be use in a verilog code. 
 * $monitor is used when we want to output due to change variables.
 * Date: 16-12-2023
 * Version: 1.0.01
 * Other files: Not required
 * Status: OK
 */

module exampleUsingGate;
    reg a, b;
    wire c;
    initial begin a=1'b0; b=1'b1; end
    
    and g1 (c, a, b);
    
    initial begin $monitor("This example module using AND Gate with monitor, here A = %b, B = %b and A.B = %b", a, b, c); end
    initial begin $display("This example module using AND Gate with display, here A = %b, B = %b and A.B = %b", a, b, c); end
    
endmodule

module exampleAssign;
    reg A, B;
    wire C;
    initial begin A=1'b0; B=1'b1; end
    
    assign C = A & B;
    
    initial begin $monitor("This example module using Assign with monitor, here A = %b, B = %b and A.B = %b", A, B, C); end
    initial begin $display("This example module using Assign with display, here A = %b, B = %b and A.B = %b", A, B, C); end


endmodule

/*
module main;
    initial
      begin
        $display("Happy");
      end
endmodule
*/
