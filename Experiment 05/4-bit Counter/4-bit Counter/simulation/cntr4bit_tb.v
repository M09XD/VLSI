`timescale 1ns/1ps
module counter_4bit_test;

reg clk; reg rst;
wire [3:0] count;

counter_4bit uut (
    .count(count),
    .clk(clk),
    .rst(rst)
);

always begin
    #5 clk = ~clk;
end

initial begin

    $monitor("Time = %0t | rst = %b | clk = %b | count = %b (%0d)",
             $time, rst, clk, count, count);

    clk = 0; rst = 0; #10;
    rst = 1; #170;
    $finish;

end
endmodule

