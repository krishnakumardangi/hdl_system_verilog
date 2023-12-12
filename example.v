/*
* Author: Krishna Kumar
* Objective: Using inbuit gates in Verilog
* Date: 1-12-2023
* Version: 1.0.01
* Status: It is ok to run and test is passed.
* File Name: example.v
* Other files: Not required
* Status: Ok
*/

module example(A, B, C, D, E, F, Y);
	input A, B, C, D, E, F;
	output Y;
	wire t1, t2, t3, Y;
	nand #1 G1(t1, A, B);
	and #2 G2(t2, C, ~B, D);
	nor #1 G3(t3, E, F);
	nand #1 G4(Y, t1, t2, t3);
endmodule

module testbench;
	reg A, B, C, D, E, F;
	wire Y;
	example DUT(A, B, C, D, E, F, Y);

	initial
	begin
		$dumpfile("example.vcd");
		$dumpvars(0,testbench);
		$monitor ($time, "A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, Y=%b", A, B, C, D, E, F, Y);
		#5 A=1; B=0; C=0; D=1; E=0; F=0;
		#5 A=0; B=0; C=1; D=1; E=0; F=0;
		#5 A=1; C=0;
		#5 F=1;
		#5 $finish;
	end

endmodule
