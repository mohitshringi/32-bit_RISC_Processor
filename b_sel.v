`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2020 03:56:48
// Design Name: 
// Module Name: b_sel
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


module b_sel(B,rd2,const,bsel);
output reg [31:0] B;   // ALU ke pehle reg ka B input
input [31:0] rd2;
input [15:0] const;  // 16 bit constant 
input bsel;
   
    
always @ (const,bsel,rd2)
begin
case(bsel)
1'b0: B<=rd2;
1'b1: B<={{16{const[15]}},const};   
endcase
end 
    
endmodule
