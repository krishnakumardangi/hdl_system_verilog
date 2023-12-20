/*
• The	keyword	“negedge”	
means	at	the	nega>ve	going	
edge	of	the	specified	signal.	
• Similarly,	we	can	use	
“posedge”.	
• We	can	combine	various	
triggering	condi>ons	by	
separa>ng	them	by	commas	
or	“or”.	
*/
// A sequential logic example
module dff_negedge (D, clock, Q, Qbar);
    input D, clock;
    output reg Q, Qbar;
    always @(negedge clock)
    begin
        Q = D;
        Qbar = ~D;
    end
endmodule
