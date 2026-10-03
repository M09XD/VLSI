`timescale 1ns/1ps

module subtractor4_test;

reg [3:0] a;
reg [3:0] b;
reg bin;

wire [3:0] diff;
wire bout;

subtractor4 uut (
    .a(a),
    .b(b),
    .bin(bin),
    .diff(diff),
    .bout(bout)
);

initial begin

    $monitor("Time = %0t | a = %b | b = %b | bin = %b | diff = %b | bout = %b",
             $time, a, b, bin, diff, bout);

    a   = 4'b0101; b   = 4'b0011; bin = 0; #10;
    a   = 4'b0111; b   = 4'b0010; bin = 1; #10;
    a   = 4'b0100; b   = 4'b0100; bin = 0; #10;
    a   = 4'b0010; b   = 4'b0101; bin = 0; #10;
    a   = 4'b0000; b   = 4'b1111; bin = 0; #10;
    a   = 4'b0000; b   = 4'b0000; bin = 1; #10;

    $finish;

end

endmodule

