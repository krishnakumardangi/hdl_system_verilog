/*
• The	event	expression	in	the	
“always”	block	triggers	whenever	at	
least	one	of	“in1”,	“in0”	or	“s”	
changes.	
• The	“or”	keyword	specifies	the	
condi>on.	
*/
// A combinational logic example
module mux21 (in1, in0, s, f);
    input in1, in0, s;
    output reg f;
    always @(in1 or in0 or s)
    if (s)
        f = in1;
    else
        f = in0;
endmodule
