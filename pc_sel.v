`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2020 22:15:23
// Design Name: 
// Module Name: pc_sel
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


module pc_sel(pc_from_pcsel,pc_plus_4,pc_const,rd1,pcsel);
output reg [4:0] pc_from_pcsel;  //next pc value
 input [31:0] rd1; //rd1 from register file for jt instruction
 input [4:0] pc_plus_4; //  value from the adder pc+4 
 input [4:0] pc_const; // pc plus the given constant
 input [1:0] pcsel;
 
 always @ (pc_plus_4,pc_const,rd1,pcsel)
 case(pcsel)
 2'b00: pc_from_pcsel <= pc_plus_4; 
 2'b01: pc_from_pcsel <= pc_const; 
 2'b10: pc_from_pcsel <= rd1[4:0];  
 endcase
endmodule
