/*
• An	alternate	way	to	specify	the	
event	condi>on	by	using	comma	
instead	of	“or”.	
• Supported	in	later	versions	of	
Verilog.
*/
// A combinational logic example
module mux21 (in1, in0, s, f);
    input in1, in0, s;
    output reg f;
    always @(in1, in0, s)
        if (s)
            f = in1;
        else
            f = in0;
endmodule
