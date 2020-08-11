`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.06.2020 00:30:14
// Design Name: 
// Module Name: reg_file
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


module reg_file(ra1,ra2,wa,wd,werf,clk,rd1,rd2);
input [4:0] ra1,ra2,wa; //read address 1,2 and write address
input [31:0] wd;   // write data from wdsel
input clk,werf;   // clock and write enable
output reg [31:0] rd1,rd2; // the register values that were read and will be used for operation
reg [31:0] reg_file[0:31];   // the 32 registers of 32 bit each
      // i was thinking of making a txt file for these 32 register but this way is better
integer i,f;  // may not work, might need to use reg[5:0] i
initial   // we need 6 bits as i needs to go upto 32
for(i=0;i<32;i=i+1) reg_file[i]=32'b0;
initial  f=$fopen("D:/reg.txt","w");
always @(ra1,ra2)
begin 
case(ra1)
 5'b11111: rd1<=5'b0; 
 default: rd1<=reg_file[ra1];
  endcase
case(ra2) 
5'b11111: rd2<=5'b0; 
default: rd2<=reg_file[ra2];
 endcase
end


always @( wa,wd)  // I wrote werf & clk, i could have used if condition, i.e., at every posedge if(werf) then reg_file<=wd;
begin
if(werf)
reg_file[wa]<=wd;
$monitor("reg value - %b", reg_file[wa]);
for(i=0;i<32;i=i+1)
$fwrite(f,"reg value- %d location %d\n",reg_file[i],i);
end
endmodule
