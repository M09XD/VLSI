`timescale 1ns/1ps
module fulladder8_test;

reg [7:0] a; reg [7:0] b; reg cin;
wire [7:0] sum; wire cout;

fulladder8 uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin

    $monitor("Time = %0t | a = %b | b = %b | cin = %b | sum = %b | cout = %b",
             $time, a, b, cin, sum, cout);

    a   = 8'h0A; b   = 8'h05; cin = 0; #10;
    a   = 8'hFF; b   = 8'h00; cin = 1; #10;
    a   = 8'h7F; b   = 8'h01; cin = 0; #10;
    a   = 8'h80; b   = 8'h80; cin = 0; #10;
    a   = 8'hFF; b   = 8'hFF; cin = 1; #10;
    a   = 8'h00; b   = 8'h00; cin = 0; #10;
    $finish;

end

endmodule

