`timescale 1ns/1ps
module fulladder32_test;

reg [31:0] a; reg [31:0] b; reg cin;
wire [31:0] sum; wire cout;

fulladder32 uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin

    $monitor("Time = %0t | a = %b | b = %b | cin = %b | sum = %b | cout = %b",
             $time, a, b, cin, sum, cout);

    a   = 32'h0000_FFFF; b   = 32'h0000_0001; cin = 0; #10;
    a   = 32'hFFFF_FFFF; b   = 32'h0000_0000; cin = 1; #10;
    a   = 32'h7FFF_FFFF; b   = 32'h0000_0001; cin = 0; #10;
    a   = 32'h8000_0000; b   = 32'h8000_0000; cin = 0; #10;
    a   = 32'hFFFF_FFFF; b   = 32'hFFFF_FFFF; cin = 1; #10;
    a   = 32'h0000_0000; b   = 32'h0000_0000; cin = 0; #10;
    $finish;

end

endmodule

