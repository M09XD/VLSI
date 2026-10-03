`timescale 1ns/1ps
module fulladder16_test;

reg [15:0] a; reg [15:0] b; reg cin;
wire [15:0] sum; wire cout;

fulladder16 uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin

    $monitor("Time = %0t | a = %b | b = %b | cin = %b | sum = %b | cout = %b",
             $time, a, b, cin, sum, cout);

    a   = 16'h00FF; b   = 16'h0001; cin = 0; #10;
    a   = 16'hFFFF; b   = 16'h0000; cin = 1; #10;
    a   = 16'h7FFF; b   = 16'h0001; cin = 0; #10;
    a   = 16'h8000; b   = 16'h8000; cin = 0; #10;
    a   = 16'hFFFF; b   = 16'hFFFF; cin = 1; #10;
    a   = 16'h0000; b   = 16'h0000; cin = 0; #10;
    $finish;

end

endmodule

