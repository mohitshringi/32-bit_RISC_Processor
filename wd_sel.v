`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2020 04:35:13
// Design Name: 
// Module Name: wd_sel
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


module wd_sel(wd_to_reg,rd,adr,pc_plus_4,wdsel);
output reg [31:0] wd_to_reg; // write data to reg file
input [31:0] rd; // read data port from data memory
input [31:0] adr; // output from ALU
input [4:0] pc_plus_4; // the next pc value
input wdsel;    


always @ (wdsel,rd,adr,pc_plus_4)
case(wdsel)
2'b00: wd_to_reg<= {27'b0,pc_plus_4};
2'b01: wd_to_reg<= adr;
2'b10: wd_to_reg<= rd;
endcase

endmodule
