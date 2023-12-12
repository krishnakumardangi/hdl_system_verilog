/*
 * Author: Krishna Kumar
 * File Name: and.v
 * Objective: AND gate
 * Description: testing verilog code like examples or new ways
 * Date: 1-12-2023
 * Version: 1.0.01
 * Other files: Not required
 * Status: Ok
 */

module my_add(A, B, C);
    input A, B;
    output C;
    wire C;
    
    and G1 (C, A, B);

endmodule


module test_bench;
    reg x, y;
    wire z;
    
    my_add DUT (.A(x), .B(y), .C(z));
    
    initial
      begin
        $monitor ($time," A=%b , B=%b , C=%b", x, y, z);
        
        x=0; y=0;
        #2 x=0; y=1;
        #2 x=1; y=0;
        #2 x=1; y=1;
        #4 $finish;
      end

endmodule

