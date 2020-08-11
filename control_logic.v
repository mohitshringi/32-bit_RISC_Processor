`timescale 1ns / 1ps



module control_logic(id,z,alufn,asel,bsel,moe,mwr,pcsel,ra2sel,wdsel,werf);
input [31:0] id; //instruction data
input z;
output reg [5:0] alufn;
output reg asel,bsel,moe,mwr,ra2sel,werf;
output reg [1:0] wdsel,pcsel;

always @ (id,z)
begin
$monitor("alufn %b",alufn);
alufn<=id[31:26];
case (id[31:26])
//add
6'b100000: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b0; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end 
//addc
6'b110000: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//and
6'b101000: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end 
//andc
6'b111000: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end 
//cmpeq
6'b100100: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end 
//cmpeqc
6'b110100: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end 
//cmple
6'b100110: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end 
//cmplec
6'b110110: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end 
//cmplt
6'b100101: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end 
//cmpltc
6'b110101: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end 
//ld
6'b011000: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b1; mwr<=1'b0; wdsel=2'b10; werf=1'b1; end
//ldr
6'b011111: begin asel<=1'b1; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b1; mwr<=1'b0; wdsel=2'b10; werf=1'b1; end
//mul
6'b100010: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//mulc
6'b110010: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//or
6'b101001: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//orc
6'b111001: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//shl
6'b101100: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//shlc
6'b111100: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//shr
6'b101101: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//shrc
6'b111101: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//sra
6'b101110: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//srac
6'b111110: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//st
6'b011001: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b1; pcsel=2'b00; moe<=1'b0; mwr<=1'b1; wdsel=2'b00; werf=1'b0; end
//sub
6'b100001: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//subc
6'b110001: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//xor
6'b101010: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//xorc
6'b111010: begin asel<=1'b0; bsel<=1'b1;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b01; werf=1'b1; end
//jmp
6'b011011: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b10; moe<=1'b0; mwr<=1'b0; wdsel=2'b00; werf=1'b1; end
//beq
6'b011101: begin asel<=1'b1; bsel<=1'b0; ra2sel<=1'b0; if(z) pcsel=2'b01; else pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b00; werf=1'b1; end
//bne
6'b011110: begin asel<=1'b1; bsel<=1'b0; ra2sel<=1'b0; if(z) pcsel=2'b00; else pcsel=2'b01; moe<=1'b0; mwr<=1'b0; wdsel=2'b00; werf=1'b1; end 

// default case like reset
default: begin asel<=1'b0; bsel<=1'b0;  ra2sel<=1'b0; pcsel=2'b00; moe<=1'b0; mwr<=1'b0; wdsel=2'b00; werf=1'b0; end
endcase



end
endmodule
