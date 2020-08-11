`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2020 00:27:12
// Design Name: 
// Module Name: pc_adder1
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


module pc_adder1(pc_plus_4,pc_val);
output reg [4:0] pc_plus_4; // naam reltate karno ko likh diya pv plus 4 , asal mein to 1 bit add karne pe hi next location ka address mil jayega
input [4:0] pc_val;
always @ (pc_val)
pc_plus_4 <= pc_val+5'b00001;
endmodule
