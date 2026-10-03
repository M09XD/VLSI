`timescale 1ns/1ps

module cntr4bit (
    output reg [3:0] count,
    input clk,
    input rst
);

always @(posedge clk or negedge rst) begin
    if (!rst)
        count <= 4'b0000;
    else
        count <= count + 1'b1;
end

endmodule

