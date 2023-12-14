/*
 * Author: Krishna Kumar
 * File Name: fullAdder.v
 * Objective: Full Adder
 * Description: Writing a verilog code for full adder implementation with test bench using $display function and for loop.
 * Date: 14-12-2023
 * Version: 1.0.03
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
	integer i;
	
	full_adder FA (.a(a), .b(b), .c(c), .s(sum), .c0(cout));
	
	initial
	begin
		$dumpfile ("fullAdder.vcd");
		$dumpvars (0, testbench);
		for (i=0; i<8; i = i+1)
		begin
			{a,b,c} = i; #5;
			$display ("T=%2d, a=%b, b=%b, c=%b, sum=%b, cout=%b", $time, a, b, c, sum, cout);
		end
		#5 $finish;
	end
endmodule
