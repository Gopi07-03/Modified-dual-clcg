
module MODIFIED_DUALCLCG_32BIT_USING_CS3A(clk,start,x0,y0,p0,q0,Zi);

input clk,start;
input [31:0]x0,y0,p0,q0;

output  Zi ;

wire [31:0] lcg_out1,lcg_out2,lcg_out3,lcg_out4;
wire Cout1,Cout2 ;

parameter a1 = 32'd65,a2 = 32'd33,a3 = 32'd17,a4 = 32'd5;
parameter b1 = 32'd43,b2 = 32'd19,b3 = 32'd23,b4 = 32'd59;

LCG lcg1(.x0(x0),.start(start),.clk(clk),.a(a1),.b1(b1),.xip1(lcg_out1));
LCG lcg2(.x0(y0),.start(start),.clk(clk),.a(a2),.b1(b2),.xip1(lcg_out2));
LCG lcg3(.x0(p0),.start(start),.clk(clk),.a(a3),.b1(b3),.xip1(lcg_out3));
LCG lcg4(.x0(q0),.start(start),.clk(clk),.a(a4),.b1(b4),.xip1(lcg_out4));


//comparator1

comparator32bit comp1(.A(lcg_out1),.B(lcg_out2),.Y(Cout1));

//comparator2
comparator32bit comp2(.A(lcg_out3),.B(lcg_out4),.Y(Cout2));


mux mux1( .A(Cout1) , .B(Cout2) , .Sel(lcg_out2[0]) ,.Y(Zi) ) ;


endmodule

//MUX
module mux ( A , B , Sel ,Y ) ;

input  A , B , Sel   ;
output reg Y ;

always @ *

begin
	if(Sel) Y = A ;
	else Y = B ;
end

endmodule 
//LCG

module LCG(x0,start,clk,a,b1,xip1);
input [31:0]x0;
input [31:0]a,b1;
input start,clk;
output reg [31:0]xip1;
wire [31:0]xi,lsr,add3 ;
wire [4:0]r ;
//parameter b1 = 8'd1;
assign xi = start ? x0 : xip1 ;//mux4 logic
//a= 2^r+1 --> a=5;r=2
rgen rg1(.a(a),.r(r));
assign lsr = xi<<r ;//r bit logical shifting

//assign add3 = xi + lsr + b1 ;
carry_save_adder csa(.a(xi),.b(lsr),.c(b1),.s(add3));

always @(posedge clk)
begin 
	if(start) xip1 <= 32'd0 ;
	else xip1 <= add3 ;
end
endmodule 
//r genaration 

//r generation
module rgen(a,r);
input [31:0]a;
output reg [4:0]r;//32
always @(a)
begin 
	case (a)//0,1
	32'd5   : r = 2 ;
	32'd9   : r = 3 ;
	32'd17  : r = 4 ;
	32'd33  : r = 5 ;
	32'd65  : r = 6 ;
	32'd129 : r = 7 ;
	32'd257 : r = 8 ;
	32'd513 : r = 9 ;
	32'd1025 : r = 10 ;
	32'd2025 : r = 11 ;
	32'd4097 : r = 12 ;
	32'd8193 : r = 13 ;
	32'd16385 : r = 14 ;
	32'd32769 : r = 15 ;
	32'd65537 : r = 16 ;
	32'd131073 : r = 17 ;
	32'd262145 : r = 18 ;
	32'd524289 : r = 19 ;
	32'd1048577 : r = 20 ;
	32'd2097153 : r = 21 ;
	32'd4194305 : r = 22 ;
	32'd8388609 : r = 23 ;
	32'd16777219 : r = 24 ;
	32'd33554437 : r = 25 ;
	32'd67108873 : r = 26 ;
	32'd134217745 : r = 27 ;
	32'd268435489 : r = 28 ;
	32'd536870977 : r = 29 ;
	32'd1073741953 : r = 30 ;
	
	default : r = 0 ; 
	endcase
end
endmodule

///Three-operand modulo-2^n carry-save adder.
module carry_save_adder(a,b,c,s);
input [31:0]a,b,c;
output [31:0]s ;

fulladder fa1(.a(a[0]),.b(b[0]),.c(c[0]),.sum(s[0]),.carry(c1));

fulladder fa2(.a(a[1]),.b(b[1]),.c(c[1]),.sum(is1),.carry(c2));
fulladder fa3(.a(a[2]),.b(b[2]),.c(c[2]),.sum(is2),.carry(c3));
fulladder fa4(.a(a[3]),.b(b[3]),.c(c[3]),.sum(is3),.carry(c4));
fulladder fa5(.a(a[4]),.b(b[4]),.c(c[4]),.sum(is4),.carry(c5));
fulladder fa6(.a(a[5]),.b(b[5]),.c(c[5]),.sum(is5),.carry(c6));
fulladder fa7(.a(a[6]),.b(b[6]),.c(c[6]),.sum(is6),.carry(c7));
fulladder fa8(.a(a[7]),.b(b[7]),.c(c[7]),.sum(is7),.carry(c8));
fulladder fa9(.a(a[8]),.b(b[8]),.c(c[8]),.sum(is8),.carry(c9));
fulladder fa10(.a(a[9]),.b(b[9]),.c(c[9]),.sum(is9),.carry(c10));
fulladder fa11(.a(a[10]),.b(b[10]),.c(c[10]),.sum(is10),.carry(c11));
fulladder fa12(.a(a[11]),.b(b[11]),.c(c[11]),.sum(is11),.carry(c12));
fulladder fa13(.a(a[12]),.b(b[12]),.c(c[12]),.sum(is12),.carry(c13));
fulladder fa14(.a(a[13]),.b(b[13]),.c(c[13]),.sum(is13),.carry(c14));
fulladder fa15(.a(a[14]),.b(b[14]),.c(c[14]),.sum(is14),.carry(c15));
fulladder fa16(.a(a[15]),.b(b[15]),.c(c[15]),.sum(is15),.carry(c16));
fulladder fa17(.a(a[16]),.b(b[16]),.c(c[16]),.sum(is16),.carry(c17));
fulladder fa18(.a(a[17]),.b(b[17]),.c(c[17]),.sum(is17),.carry(c18));
fulladder fa19(.a(a[18]),.b(b[18]),.c(c[18]),.sum(is18),.carry(c19));
fulladder fa20(.a(a[19]),.b(b[19]),.c(c[19]),.sum(is19),.carry(c20));
fulladder fa21(.a(a[20]),.b(b[20]),.c(c[20]),.sum(is20),.carry(c21));
fulladder fa22(.a(a[21]),.b(b[21]),.c(c[21]),.sum(is21),.carry(c22));
fulladder fa23(.a(a[22]),.b(b[22]),.c(c[22]),.sum(is22),.carry(c23));
fulladder fa24(.a(a[23]),.b(b[23]),.c(c[23]),.sum(is23),.carry(c24));
fulladder faa25(.a(a[24]),.b(b[24]),.c(c[24]),.sum(is24),.carry(c25));
fulladder faa26(.a(a[25]),.b(b[25]),.c(c[25]),.sum(is25),.carry(c26));
fulladder faa27(.a(a[26]),.b(b[26]),.c(c[26]),.sum(is26),.carry(c27));
fulladder faa28(.a(a[27]),.b(b[27]),.c(c[27]),.sum(is27),.carry(c28));
fulladder faa29(.a(a[28]),.b(b[28]),.c(c[28]),.sum(is28),.carry(c29));
fulladder faa30(.a(a[29]),.b(b[29]),.c(c[29]),.sum(is29),.carry(c30));
fulladder faa31(.a(a[30]),.b(b[30]),.c(c[30]),.sum(is30),.carry(c31));
fulladder faa32(.a(a[31]),.b(b[31]),.c(c[31]),.sum(is31),.carry(c32));

fulladder fa25(.a(c1),.b(is1),.c(1'b0),.sum(s[1]),.carry(cc25));
fulladder fa26(.a(c2),.b(is2),.c(cc25),.sum(s[2]),.carry(cc26));
fulladder fa27(.a(c3),.b(is3),.c(cc26),.sum(s[3]),.carry(cc27));
fulladder fa28(.a(c4),.b(is4),.c(cc27),.sum(s[4]),.carry(cc28));
fulladder fa29(.a(c5),.b(is5),.c(cc28),.sum(s[5]),.carry(cc29));
fulladder fa30(.a(c6),.b(is6),.c(cc29),.sum(s[6]),.carry(cc30));
fulladder fa31(.a(c7),.b(is7),.c(cc30),.sum(s[7]),.carry(cc31));
fulladder fa32(.a(c8),.b(is8),.c(cc31),.sum(s[8]),.carry(cc32));
fulladder fa33(.a(c9),.b(is9),.c(cc32),.sum(s[9]),.carry(c33));
fulladder fa34(.a(c10),.b(is10),.c(c33),.sum(s[10]),.carry(c34));
fulladder fa35(.a(c11),.b(is11),.c(c34),.sum(s[11]),.carry(c35));
fulladder fa36(.a(c12),.b(is12),.c(c35),.sum(s[12]),.carry(c36));
fulladder fa37(.a(c13),.b(is13),.c(c36),.sum(s[13]),.carry(c37));
fulladder fa38(.a(c14),.b(is14),.c(c37),.sum(s[14]),.carry(c38));
fulladder fa39(.a(c15),.b(is15),.c(c38),.sum(s[15]),.carry(c39));
fulladder fa40(.a(c16),.b(is16),.c(c39),.sum(s[16]),.carry(c40));
fulladder fa41(.a(c17),.b(is17),.c(c40),.sum(s[17]),.carry(c41));
fulladder fa42(.a(c18),.b(is18),.c(c41),.sum(s[18]),.carry(c42));
fulladder fa43(.a(c19),.b(is19),.c(c42),.sum(s[19]),.carry(c43));
fulladder fa44(.a(c20),.b(is20),.c(c43),.sum(s[20]),.carry(c44));
fulladder fa45(.a(c21),.b(is21),.c(c44),.sum(s[21]),.carry(c45));
fulladder fa46(.a(c22),.b(is22),.c(c45),.sum(s[22]),.carry(c46));
fulladder fa47(.a(c23),.b(is23),.c(c46),.sum(s[23]),.carry(c47));
fulladder fa48(.a(c24),.b(is24),.c(c47),.sum(s[24]),.carry(c48));
fulladder fa49(.a(c25),.b(is25),.c(c48),.sum(s[25]),.carry(c49));
fulladder fa50(.a(c26),.b(is26),.c(c49),.sum(s[26]),.carry(c50));
fulladder fa51(.a(c27),.b(is27),.c(c50),.sum(s[27]),.carry(c51));
fulladder fa52(.a(c28),.b(is28),.c(c51),.sum(s[28]),.carry(c52));
fulladder fa53(.a(c29),.b(is29),.c(c52),.sum(s[29]),.carry(c53));
fulladder fa54(.a(c30),.b(is30),.c(c53),.sum(s[30]),.carry(c54));
fulladder fa55(.a(c31),.b(is31),.c(c54),.sum(s[31]),.carry(c55));

endmodule 

//full adder

module fulladder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;

assign sum = a ^ b ^ c ;
assign carry = (a & b) | (b & c) | (a & c) ;

endmodule 

//32 BIT MAGNITUDE COMPARATOR


module comparator32bit(A,B,Y);
input [31:0] A,B;
output reg Y ;

always @ *
begin
	if( A > B )  Y = 1 ;
	else Y = 0 ;//A=B ,A<B

end 


endmodule 
