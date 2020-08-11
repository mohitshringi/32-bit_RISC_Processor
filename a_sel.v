`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2020 02:21:09
// Design Name: 
// Module Name: a_sel
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


module a_sel(A,rd1,pc_const,asel);
output reg [31:0] A;  // ALU ke pehle reg ka pehla operand A
input [4:0] pc_const; // pc value from offset adder
input [31:0] rd1; // from reg file
input asel;
always @ (rd1,pc_const,asel)
case(asel)
1'b0: A <= rd1;
1'b1: A <= {27'b0,pc_const};
endcase
endmodule
