/*
• An	alternate	way	to	specify	the	
event	condi>on	by	using	a	“*”	
instead	of	naming	the	variables.	
• “*”	is	ac>vated	whenever	any	of	
the	variables	change.
*/
// A combinational logic example
module mux21 (in1, in0, s, f);
    input in1, in0, s;
    output reg f;
    always @(*)
        if (s)
            f = in1;
        else
            f = in0;
endmodule
