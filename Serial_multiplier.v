`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 16:33:58
// Design Name: 
// Module Name: Serial_multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Serial_multiplier(input clk, input Start, input [3:0]A, input [3:0]B, output reg[7:0]P, output Done);
reg [2:0] count = 0;
reg [3:0] M;

always@(posedge clk or negedge Start) begin
    if(~Start) begin
        M <= B;
        count <= 3'b0;
        P <= 8'b0;
    end
    else if (count < 4) begin
    P <= (P<<1) + {M[3]&A[3], M[3]&A[2], M[3]&A[1], M[3]&A[0]};
    M <= M<<1;
    count <= count + 1;
   end
end

assign Done = (count == 4);
endmodule
