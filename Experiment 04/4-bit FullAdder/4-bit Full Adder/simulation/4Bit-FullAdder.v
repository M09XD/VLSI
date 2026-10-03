`timescale 1ns/1ps

module fulladder4 (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output carry
);

assign {carry, sum} = a + b + cin;

endmodule

