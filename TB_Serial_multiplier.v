`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 16:40:27
// Design Name: 
// Module Name: TB_Serial_multiplier
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


module TB_Serial_multiplier();
reg CLK = 0, Start = 1;
reg[3:0] A = 10, B = 13;
wire[7:0]P;
wire Done;

Serial_multiplier DUT (.clk(CLK), .Start(Start), .A(A), .B(B), .P(P), .Done(Done));

always begin 
    #5 CLK = ~CLK;
    end
  
initial begin
    #1 Start = 0;
    #5 Start = 1;
    end
    
endmodule
