// Modeling of COmbinatinal circuits using User Defined Primitives
// Full adder sum generation using UDP 

primitive udp_sum (sum, a, b, c); 
    input a, b, c; 
    output sum; 
    table 
    // a b c sum 
       0 0 0 : 0; 
       0 0 1 : 1; 
       0 1 0 : 1; 
       0 1 1 : 0; 
       1 0 0 : 1; 
       1 0 1 : 0; 
       1 1 0 : 0; 
       1 1 1 : 1; 
    endtable
endprimitive

/*
The	truth	table	is	specified	for	
all	input	combinaDons.	
We	can	also	specify	don’t	care	
input	combinaDons	as	“?”.
*/

// Full adder carry generation 
primitive udp_full_cy (cout, a, b, c); 
    input a, b, c; 
    output cout; 
    table 
    // a b c cout
       0 0 0 : 0; 
       0 0 1 : 0; 
       0 1 0 : 0; 
       0 1 1 : 1; 
       1 0 0 : 0; 
       1 0 1 : 1; 
       1 1 0 : 1; 
       1 1 1 : 1; 
    endtable
endprimitive

// Full adder carry generation 
// Using don’t care (“?”) 
primitive udp_cy (cout, a, b, c); 
    input a, b, c; 
    output cout; 
    table 
    // a b c cout
    0 0 ? : 0; 
    0 ? 0 : 0; 
    ? 0 0 : 0; 
    1 1 ? : 1; 
    1 ? 1 : 1; 
    ? 1 1 : 1; 
 endtable
endprimitive

// Instantiating UDP’s 
// A full adder description 
module full_adder (sum, cout, a, b, c); 
    input a, b, c; 
    output sum, cout; 
    udp_sum SUM (sum, a, b, c); 
    udp_cy CARRY (cout, a, b, c); 
endmodule

//UDP can be instantiated just like any other Verilog module.
