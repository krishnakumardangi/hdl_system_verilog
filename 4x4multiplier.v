/*
 * Author: Krishna Kumar
 * File Name: 4x4multiplier.v
 * Objective: Writing a verilog example
 * Description: 4 bit multiplier using behavioral statement.
 * Date: 17-12-2023
 * Version: 1.0.01
 * Other files: Not required
 * Status: OK
 */

module multiplier_4x4(input [3:0] a, b, output reg [7:0] product);
    always @(*)
    begin
        product = a * b;
    end
endmodule

module testbench;
    reg [3:0] a, b;
    wire [7:0] product;

    // Instantiate the multiplier
    multiplier_4x4 uut (
        .a(a),
        .b(b),
        .product(product)
    );

    initial begin
        // Initialize inputs
        a = 4'b0000;
        b = 4'b0000;

        // Apply test vectors
        #10 a = 4'b0010; b = 4'b0011;  // 2 * 3 = 6
        #10 a = 4'b0100; b = 4'b0101;  // 4 * 5 = 20
        #10 a = 4'b0110; b = 4'b0111;  // 6 * 7 = 42
        #10 a = 4'b1000; b = 4'b1001;  // 8 * 9 = 72
        #10 a = 4'b1010; b = 4'b1011;  // 10 * 11 = 110
        #10 a = 4'b1100; b = 4'b1101;  // 12 * 13 = 156
        #10 a = 4'b1110; b = 4'b1111;  // 14 * 15 = 210

        // End the simulation
        #10 $finish;
    end

    initial begin
        $monitor("At time %d, a = %b, b = %b, product = %b", $time, a, b, product);
    end
endmodule
