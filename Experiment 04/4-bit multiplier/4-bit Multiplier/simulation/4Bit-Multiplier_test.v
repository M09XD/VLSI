`timescale 1ns/1ps

module multiplier4_test;

reg [3:0] a;
reg [3:0] b;

wire [7:0] prod;

multiplier4 uut (
    .a(a),
    .b(b),
    .prod(prod)
);

initial begin

    $monitor("Time = %0t | a = %b (%d) | b = %b (%d) | prod = %b (%d)",
             $time, a, a, b, b, prod, prod);

    a = 4'b0000; b = 4'b0101; #10;
    a = 4'b0111; b = 4'b0001; #10;
    a = 4'b0011; b = 4'b0100; #10;
    a = 4'b1100; b = 4'b0101; #10;
    a = 4'b1111; b = 4'b1111; #10;
    a = 4'b1001; b = 4'b1001; #10;

    $finish;

end

endmodule

