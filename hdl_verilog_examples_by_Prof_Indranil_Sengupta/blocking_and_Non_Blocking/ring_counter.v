// Ring counter 

module ring_counter_v1 (clk, init, count);
/*
• This	soluDon	is	wrong.	
• count[7]	will	get	
overwrijen	in	the	first	
statement.	
	• RotaDon	of	the	bits	
will	not	happen.
*/
    input clk, init;
    output reg [7:0] count;
    
    always @ (posedge clk)
      begin
        if (init) count = 8'b10000000;
        else begin
               count = count << 1;
               count[0] = count [7];
             end
      end
endmodule


// A ring counter (Modified version of v1)
/*
• This	is	the	correct	
version.	
• Since	non-blocking	
assignments	are	used,	
rotaDon	will	take	place	
correctly.	
*/
module ring_counter_v2 (clk, init, count);
    input clk, init;
    output reg [7:0] count;
    
    always @ (posedge clk)
      begin
        if (init) count = 8'b10000000;
        else begin
               count <= count << 1;
               count[0] <= count [7];
             end
      end
endmodule

// A ring counter (Modified version of v1)
/*
• This	is	a	correct	way	of	
modeling	using	blocking	
assignmenti.
*/
module ring_counter_v3 (clk, init, count);
    input clk, init;
    output reg [7:0] count;
    
    always @ (posedge clk)
      begin
        if (init) count = 8'b10000000;
        else 
            count = {count[6:0], count [7]};
      end
endmodule


