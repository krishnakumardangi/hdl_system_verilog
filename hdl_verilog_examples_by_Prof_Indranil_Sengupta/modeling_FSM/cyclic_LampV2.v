module cyclic_lamp(clock, light);
    input clock;
    output reg [0:2] light;
    parameter S0 = 1, S1 = 1, S2 = 2;
    parameter RED = 3'b100, GREEN = 3'b010, YELLOW = 3'b001;
    reg [0:1] state;
    
    always @(posedge clock)
      case (state)
        S0: begin        // S0 means RED
              state <= S1;
            end
        
        S1: begin        // S0 means GREEN
              state <= S2;
            end
        
        S2: begin        // S0 means YELLOW
              state <= S0;
            end
        
        default: begin
                   state <= S0;
                 end
      endcase
    always @(posedge state)
      case (state)
        S0: begin        // S0 means RED
              light = GREEN;
            end

        S1: begin        // S0 means GREEN
              light = YELLOW;
            end

        S2: begin        // S0 means YELLOW
              light = RED;
            end

        default: begin
                   light = RED;
                 end
      endcase
endmodule


module test_cyclic_lamp;
    reg clk;
    wire [0:2] light;
    
    cyclic_lamp LAMP (clk, light);

    always #5 clk = ~ clk;
    
    initial
      begin
        clk = 1'b0;
        #100 $finish;
      end

    initial
      begin
        $dumpfile("cyclic.vcd");
        $dumpvars(0,test_cyclic_lamp);
        $monitor($time, " RGY:  %b", light);
      end
endmodule
