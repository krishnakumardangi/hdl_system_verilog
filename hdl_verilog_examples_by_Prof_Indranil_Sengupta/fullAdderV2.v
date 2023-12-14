/*
 * Author: Krishna Kumar
 * File Name: fullAdder.v
 * Objective: Full Adder and Test Bench
 * Description: Writing a verilog code for full adder implementation with test bench using $display function.
 * Date: 14-12-2023
 * Version: 1.0.02
 * Other files: Not required
 * Status: 
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
			a = 0; b = 0; c = 1;
			$display ("T=%2d, a=%b, b=%b, c=%b, sum=%b, cout=%b", $time, a, b, c, sum, cout);
			#5 a = 1;
			$display ("T=%2d, a=%b, b=%b, c=%b, sum=%b, cout=%b", $time, a, b, c, sum, cout);
			#5 b = 1;
			$display ("T=%2d, a=%b, b=%b, c=%b, sum=%b, cout=%b", $time, a, b, c, sum, cout);
			#5 a = 0; b = 0; c = 0;
			$display ("T=%2d, a=%b, b=%b, c=%b, sum=%b, cout=%b", $time, a, b, c, sum, cout);
			#5 $finish;
		end
endmodule
