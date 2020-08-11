`timescale 1ns / 1ps


module data_memory(rd,adr,wd_data_mem,mwr,moe);
output reg [31:0] rd; // the read data port value, for load instruction
input [31:0] adr;  // output from ALU
input [31:0] wd_data_mem; // the write data port of data memory gets i/p from register connected to rd2 of reg file, for store instruction
input mwr, moe;  // memory write and memory output enable 
integer i;
reg [31:0] data_mem [0:255]; //memory

/*initial
 for(i=9'b0;i<255;i=i+1)   // i put 256 zeroes in the data_mem.txt file so i dont need this initialization with zero values
 data_mem[i]=32'b0;
 */
//initial
//$readmemh("D:/data_mem.txt",data_mem,0,255);
//integer f;
//initial
  //f = $fopen("D:/data_mem.txt","r+");
// adr ki 5 bit hi kaafi hai.... kyuki i want to link it with register file, waha adress 5 bit hi kaafi hai

always @ (adr,mwr,moe,wd_data_mem)
begin
$readmemh("D:/data_mem.txt",data_mem,0,255);
$monitor("datamem- %h",data_mem[adr[4:0]]); 
if(mwr) begin data_mem[adr[4:0]]=wd_data_mem; $monitor("datamem- %h",data_mem[adr[4:0]]);  end
if(moe) begin rd=data_mem[adr[4:0]]; $monitor("datamem- %h",data_mem[adr[4:0]]); end

$writememh("D:/data_mem.txt",data_mem,0,255);

end




  


endmodule

