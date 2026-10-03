`timescale 1ns/1ps

module jk_ff (
    output reg q,
    output wire qbar,
    input j,
    input k,
    input clk,
    input rst
);

assign qbar = ~q;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        q <= 0;
    end else begin
        case ({j, k})
            2'b00: q <= q;   // Hold
            2'b01: q <= 0;   // Reset
            2'b10: q <= 1;   // Set
            2'b11: q <= ~q;  // Toggle
        endcase
    end
end

endmodule

