`timescale 1ns/1ps
module d_ff_test;

reg d; reg clk; reg rst;
wire q;

d_ff uut (
    .q(q),
    .d(d),
    .clk(clk),
    .rst(rst)
);

always begin
    #5 clk = ~clk;
end

initial begin

    $monitor("Time = %0t | rst = %b | clk = %b | d = %b | q = %b",
             $time, rst, clk, d, q);
    clk = 0; rst = 0; d   = 0; #10;
    rst = 1; #10;
    d   = 1; #10;
    d   = 0; #10;
    d   = 1; #10;
    $finish;
end
endmodule

