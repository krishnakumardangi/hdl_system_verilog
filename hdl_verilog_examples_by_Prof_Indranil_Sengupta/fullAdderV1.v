/*
 * Author: Krishna Kumar
 * File Name: fullAdder.v
 * Objective: Full Adder
 * Description: Writing a verilog code for full adder implementation with test bench using $monitor function.
 * Date: 14-12-2023
 * Version: 1.0.01
 * Other files: Not required
 * Status: Ok
 */

module full_adder(a, b, c, s, c0);
	input a, b, c;
	output s, c0;
	assign s = a^b^c;
	assign c0 = (a & b) | (b & c) | (a & c);
endmodule


module testbench;
	reg a, b, c;
	wire sum, cout;
	
	full_adder FA (.a(a), .b(b), .c(c), .s(sum), .c0(cout));
	
	initial
		begin
			$monitor ($time, " a=%b. b=%b, c=%b, s=%b, co=%b", a, b, c, sum, cout);
			#5 a = 0; b = 0; c = 1;
			#5 a = 1;
			#5 b = 1;
			#5 a = 0; b = 0; c = 0;
			#5 $finish;
		end
endmodule
