`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2020 00:36:45
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(pc_val,id);
input [4:0] pc_val;  //value coming from pc counter
output reg [31:0] id; // instruction data 
    
    reg [31:0] instruction_mem[0:31];  // can be any number of registers but all have to be 32 bit
      // here we have capacity of 32 instructions
    initial
    $readmemh("D:/instruction.txt",instruction_mem,0,8);// end address badal sakte hai according to number of instructions
   
 always @(pc_val)
    begin
   id<=instruction_mem[pc_val]; // byte bit ka chakkar hata diya, 1 bit badhana matlab 1 memory location aage, 32 bit = 4 byte = 1 stored value waala raag khatam
    // jyada locations chahiye hi nhi 32 location se kaam ho jayega kyuki ek location ek 32 bit value ko store kar leti hai
    $monitor("instruction- %h", instruction_mem[pc_val]);
    end
endmodule
