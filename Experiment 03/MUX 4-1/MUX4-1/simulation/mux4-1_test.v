`timescale 1ns/1ps

module mux41_test;

reg i0; reg i1; reg i2; reg i3;
reg [1:0] s;
wire out;

mux41 uut (
    .i({i3, i2, i1, i0}),
    .s(s),
    .out(out)
);

initial begin
    $monitor("Time = %0t | i3 = %b | i2 = %b | i1 = %b | i0 = %b | s = %b | out = %b",
             $time, i3, i2, i1, i0, s, out);

    i0 = 0; i1 = 1; i2 = 1; i3 = 1; s = 2'b00; #10;
    i0 = 1; i1 = 0; i2 = 0; i3 = 0; s = 2'b00; #10;
    i0 = 1; i1 = 0; i2 = 1; i3 = 1; s = 2'b01; #10;
    i0 = 0; i1 = 1; i2 = 0; i3 = 0; s = 2'b01; #10;
    i0 = 1; i1 = 1; i2 = 0; i3 = 1; s = 2'b10; #10;
    i0 = 0; i1 = 0; i2 = 1; i3 = 0; s = 2'b10; #10;
    i0 = 1; i1 = 1; i2 = 1; i3 = 0; s = 2'b11; #10;
    i0 = 0; i1 = 0; i2 = 0; i3 = 1; s = 2'b11; #10;
    $finish;
end
endmodule

