`timescale 1ns/1ps
module jk_ff_test;

reg j; reg k; reg clk; reg rst;
wire q; wire qbar;

jk_ff uut (.q(q), .qbar(qbar), .j(j), .k(k), .clk(clk), .rst(rst));

always begin
    #5 clk = ~clk;
end

initial begin

    $monitor("Time = %0t | rst = %b | clk = %b | j = %b | k = %b | q = %b | qbar = %b",
             $time, rst, clk, j, k, q, qbar);

    clk = 0; rst = 0; j   = 0; k   = 0; #10;
    rst = 1; #10;
    j   = 1; k   = 0; #10;
    j   = 0; k   = 0; #10;
    j   = 0; k   = 1; #10;
    j   = 1; k   = 1; #10;
    j   = 1; k   = 1; #10;
    $finish;
end
endmodule

