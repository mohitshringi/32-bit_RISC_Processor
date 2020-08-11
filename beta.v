`timescale 1ns / 1ps

module beta(clk);
//output reg [512:0] data;
input clk;
//wire [512:0] send;
wire [31:0] id, rd1, rd2, wd, a, b, adr, rd;
wire [5:0] alufn;
wire [4:0] pc_val, pc_plus_4, pc_from_pcsel, pc_const, ra2;
wire [1:0] pcsel, wdsel;
wire asel, bsel, werf, mwr, moe, ra2sel, z;

pc_adder1          m1(pc_plus_4, pc_val);
pc_offset_adder    m2(pc_const, pc_plus_4, id[15:0]);
pc_sel             m3(pc_from_pcsel, pc_plus_4, pc_const, rd1, pcsel);
pc                 m4(pc_val,pc_from_pcsel, clk );
instruction_memory m5(pc_val, id);
control_logic      m6(id, z, alufn, asel, bsel, moe, mwr, pcsel, ra2sel, wdsel, werf);
ra2_sel            m7(ra2, id[15:11], id[25:21], ra2sel);
reg_file           m8(id[20:16], ra2, id[25:21], wd, werf, clk, rd1, rd2);
branch_or_not      m9(z, rd1);
a_sel              m10(a,rd1,pc_const,asel);
b_sel              m11(b,rd2,id[15:0],bsel);
ALU                m12(adr,a,b,alufn);
data_memory        m13(rd,adr,rd2,mwr,moe);
wd_sel             m14(wd,rd,adr,pc_plus_4,wdsel);

//always @(clk)
//data<=send;



endmodule
