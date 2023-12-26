// Inference: Oredr matter a lot in blocking procedural assignment
// Order is not imoportant in non-blocking procedural assignment


// This module will generate 4 bit shift register using D flip-flop
module shiftreg_4bit (clock, clear, A, E);
    input clock, clear, A;
    output reg E;
    reg B, C, D;
    
    always @ (posedge clock or negedge clear)
        begin
          if (!clear)
              begin
                  B = 0;
                  C = 0;
                  D = 0;
                  E = 0;
              end
          else
            begin
                E = D;
                D = C;
                C = B;
                B = A;
            end
          end
endmodule

// This module will generate 1 bit shift register using D flip-flop with A as input and E as output state
module shiftreg_1bit (clock, clear, A, E);
    input clock, clear, A;
    output reg E;
    reg B, C, D;
    
    always @ (posedge clock or negedge clear)
        begin
          if (!clear)
              begin
                  B = 0;
                  C = 0;
                  D = 0;
                  E = 0;
              end
          else
            begin
                B = A;
                C = B;
                D = C;
                E = D;
            end
          end
endmodule

