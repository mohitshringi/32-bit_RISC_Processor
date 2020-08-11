`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2020 01:05:13
// Design Name: 
// Module Name: pc_offset_adder
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

module pc_offset_adder(pc_const,pc_plus_4,const);
output reg [4:0] pc_const;
input [4:0] pc_plus_4;
input [15:0] const;
always @ (pc_plus_4,const)
pc_const <= pc_plus_4 + const[4:0];  // we dont need to multiply constant by 4 kyuki apna bit aur byte waala locha nahi hai
endmodule
