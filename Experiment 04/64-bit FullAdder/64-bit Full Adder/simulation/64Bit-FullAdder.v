`timescale 1ns/1ps

module fulladder64 (
    input [63:0] a,
    input [63:0] b,
    input cin,
    output [63:0] sum,
    output cout
);

assign {cout, sum} = a + b + cin;

endmodule

