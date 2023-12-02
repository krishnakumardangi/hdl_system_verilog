/*
* Author: Krishna Kumar
* File Name: ram.v
* Objective: Memory modeling using verilog
* Description: It is an example of memory initialization in verilog language with write and select features.
* Date: 2-12-2023
* Version: 1.0.01
* Status: Ok
* Other files: test bench is already written in same code.
*
*/

module ram_3(data_out, data_in, addr, wr, cs);
    
    parameter addr_size = 10, word_size = 8, memory_size = 1025;
    
    input [addr_size-1:0] addr;
    input [word_size-1:0] data_in;
    input wr, cs;
    output [word_size-1:0] data_out;
    reg [word_size-1:0] mem [memory_size-1:0];
    
    assign data_out = mem[addr];
    
    always @(wr or cs)
        if (wr) mem[addr] = data_in;
    
endmodule


module ram_test;
    reg [9:0] address;
    wire [7:0] data_out;
    reg [7:0] data_in;
    reg write, select;
    integer k, myseed, data;
    ram_3 RAM(data_out, data_in, address, write, select);
    
    initial
      begin
          for(k=0; k<=1023; k=k+1)
            begin
              address = k;
              data = (k+k) % 256; write = 1; select = 1;
              #2 write = 0; select = 0;
            end
          repeat(20)
            begin
              #2 address = $random(myseed) % 1024;
              write = 0; select = 1;
              $display("Address: %5d, Data: %4d", address, data);
              #2 select = 0;
            end
          end
     initial myseed = 35;
endmodule
