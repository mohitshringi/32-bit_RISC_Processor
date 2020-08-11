`timescale 1ns / 1ps

module ALU(adr,a,b,alufn);
input [31:0] a,b;
input [5:0] alufn;
output reg [31:0] adr;
//reg [31:0] t;

always @ (a,b,alufn)
begin
$monitor("A %d B %d",a,b);
case (alufn)

6'b100000: adr<=a+b; //ADD
6'b110000: adr<=a+b; //ADDC;
6'b101000: adr<=a&b; //AND
6'b111000: adr<=a&b; //ANDC
6'b100100: begin if(a==b) adr<=32'b1; else adr<=32'b0;end //CMPEQ compare equal
6'b110100: begin if(a==b) adr<=32'b1; else adr<=32'b0;end //CMPEQC 
6'b100110: begin if(a<=b) adr<=32'b1; else adr<=32'b0;end //CMPLE  compare less than equal
6'b110110: begin if(a<=b) adr<=32'b1; else adr<=32'b0;end //CMPLEC  
6'b100101: begin if(a<b) adr<=32'b1; else adr<=32'b0; end //CMPLT compare less than
6'b110101: begin if(a<b) adr<=32'b1; else adr<=32'b0; end //CMPLTC
6'b011000: adr<=a+b; // LD
6'b011111: adr<=a;   // LDR  ***VERY IMPORTANT***: its control logic should be such that from 'a' pc+4 + sext value comes, and that comes from offset adder 
                     // in the document the address for LDR instruction is given as PC + 4 + 4*sext this one is similar
                     // to the branch instrution's value, and we do not need to access any value from a Rb, so only value from 'a' viz pc+4+4*sext is sent as 'adr' 
6'b100010: adr<=a*b; //MUL
6'b110010: adr<=a*b; //MULC
6'b101001: adr<=a|b; //OR
6'b111001: adr<=a|b; //ORC
6'b101100: adr<=a<<b[4:0]; //SHL shift left
6'b111100: adr<=a<<b[4:0]; //SHLC
6'b101101: adr<=a>>b[4:0]; // SHR shift right
6'b111101: adr<=a>>b[4:0]; // SHRC
6'b101110: adr<= ({32{a[31]}}<<(32-b[4:0]))^(a>>b[4:0]); // SRA arithmetic right shift
// ****** IMPORTANT  ****** use of brackets 
6'b101110: adr<= ({32{a[31]}}<<(32-b[4:0]))^(a>>b[4:0]); //SRAC
6'b011001: adr<= a+b; //ST store
6'b100001: adr<=a-b; //SUB
6'b110001: adr<=a-b; //SUBC
6'b101010: adr<=a^b; //XOR
6'b111010: adr<=a^b; //XORC
6'b011011: adr<=a&{30'b1,2'b0}; // JMP, explanation see document "I-Chip" udyam2018.
6'b011101: adr<=a; //BEQ branch equal to, needed value is pc+4+4*sext, provided by Ra, no need of Rb
6'b011110: adr<=a; //BNE branh not equal 

endcase
end
endmodule
