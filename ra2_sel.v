`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2020 05:05:16
// Design Name: 
// Module Name: ra2_sel
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


module ra2_sel(ra2,rb,rc,ra2sel);
output reg [4:0] ra2;
input [4:0] rb;
input [4:0] rc;
input ra2sel;

always @ (ra2sel,rb,rc)
case(ra2sel)
1'b0: ra2<=rb;
1'b1: ra2<=rc;
endcase
    
endmodule
