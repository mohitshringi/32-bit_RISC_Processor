`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2020 21:57:46
// Design Name: 
// Module Name: pc
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

module pc( pc_val,pc_from_pcsel,clk );
 output reg [4:0] pc_val;
 input [4:0] pc_from_pcsel; 
 input clk;
 initial pc_val=5'b00000;  // instruction memory mein 32 hi location rakhi hai isliye 5 bit ka pc kaafi hai
 always @ (posedge clk)
 begin   // aur bit byte ka chakkar to khatam kar hi diya hai
 pc_val<=pc_from_pcsel;
 $monitor("program counter- %d" , pc_val);
end
endmodule
