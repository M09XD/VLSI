`timescale 1ns/1ps

module Adder_32bit_8_stage (
    input wire clk, input wire rst, input wire [31:0] a, input wire [31:0] b, input wire cin, 
    output wire [31:0] sum, output wire cout
);

localparam STAGES = 8; 
localparam WIDTH = 4;

reg [31:0] a_pipe [0:STAGES]; reg [31:0] b_pipe [0:STAGES]; reg [31:0] sum_pipe [0:STAGES]; reg c_pipe [0:STAGES];

integer k;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        for (k = 0; k <= STAGES; k = k + 1) begin
            a_pipe[k]   <= 32'b0;
            b_pipe[k]   <= 32'b0;
            sum_pipe[k] <= 32'b0;
            c_pipe[k]   <= 1'b0;
        end
    end else begin
        a_pipe[0]   <= a;
        b_pipe[0]   <= b;
        sum_pipe[0] <= 32'b0;
        c_pipe[0]   <= cin;
    end
end

genvar g;
generate
    for (g = 0; g < STAGES; g = g + 1) begin : ADD_STAGE
        wire [WIDTH-1:0] nibble_sum;
        wire nibble_cout;

        assign {nibble_cout, nibble_sum} = a_pipe[g][g*WIDTH +: WIDTH] + b_pipe[g][g*WIDTH +: WIDTH] + c_pipe[g];

        always @(posedge clk or negedge rst) begin
            if (!rst) begin
                a_pipe[g+1]   <= 32'b0;
                b_pipe[g+1]   <= 32'b0;
                sum_pipe[g+1] <= 32'b0;
                c_pipe[g+1]   <= 1'b0;
            end else begin
                a_pipe[g+1]   <= a_pipe[g];
                b_pipe[g+1]   <= b_pipe[g];
                sum_pipe[g+1] <= sum_pipe[g] | (nibble_sum << (g*WIDTH));
                c_pipe[g+1]   <= nibble_cout;
            end
        end
    end
endgenerate

assign sum  = sum_pipe[STAGES];
assign cout = c_pipe[STAGES];

endmodule

