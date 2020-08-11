`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2020 01:16:01
// Design Name: 
// Module Name: branch_or_not
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


module branch_or_not(z,rd1);
output reg z;
input [31:0] rd1;
always @(rd1)
if(rd1==32'b0) z<=1'b1;
else z<=1'b0;
endmodule
