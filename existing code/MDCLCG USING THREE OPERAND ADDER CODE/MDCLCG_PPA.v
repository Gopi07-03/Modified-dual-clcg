
module MODIFIED_DUALCLCG_32BIT_USING_3OPPA(clk,start,x0,y0,p0,q0,Zi);

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
//carry_save_adder csa(.a(xi),.b(lsr),.c(b1),.s(add3));//32
three_operand_adder add1(.a(xi[15:0]),.b(lsr[15:0]),.c(b1[15:0]),.Cin(1'b0),.sum(add3[15:0]),.carry(cr1));
three_operand_adder add2(.a(xi[31:16]),.b(lsr[31:16]),.c(b1[31:16]),.Cin(cr1),.sum(add3[31:16]),.carry(carry));

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
//32 BIT  COMPARATOR


module comparator32bit(A,B,Y);
input [31:0] A,B;
output reg Y ;

always @ *
begin
	if( A > B )  Y = 1 ;
	else Y = 0 ;

end 


endmodule 
