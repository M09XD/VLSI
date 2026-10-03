`timescale 1ns/1ps

module d_ff (
    output reg q,
    input d,
    input clk,
    input rst
);

always @(posedge clk or negedge rst) begin
    if (!rst)
        q <= 0;
    else
        q <= d;
end

endmodule

