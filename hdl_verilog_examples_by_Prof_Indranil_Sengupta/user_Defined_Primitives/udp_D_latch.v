// A level-sensitive D type latch 
primitive Dlatch_udp(q, d, clk, clr); 
    input d, clk, clr; 
    output q;
    table 
        // d clk clr  q  q_new
        ? ? 1 : ? : 0; // latch is cleared 
        0 1 0 : ? : 0; // latch is reset 
        1 1 1 : ? : 1; // latch is set 
        ? 0 0 : ? : -; // retains previous state 
    endtable
endprimitive

/*Some Rules to Follow	
• The “?” symbol can not be specified in an output field.	
• The “-” symbol,	indicating no	change in the	state value,	can	be specified	only in an output field.
• The shortcut “r”, indicating rising edge, can be used instead of (01).	
• The shortcut “f”, indicating falling edge, can be used instead of	(10).	
• The shortcut “*” indicates any value change in the signal.
*/
