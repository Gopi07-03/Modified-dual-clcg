module three_operand_adder(a,b,c,Cin,sum,carry);


input [15:0] a,b,c ;
input Cin ;

output [16:0] sum;
output carry;

wire [16:0] p, g ; 
wire [15 :0] s , cr ;

///bit addition logic
bit_addition_logic bal1(.a(a[0]),.b(b[0]),.c(c[0]),.sum(s[0]),.carry(cr[0])) ;
bit_addition_logic bal2(.a(a[1]),.b(b[1]),.c(c[1]),.sum(s[1]),.carry(cr[1])) ;
bit_addition_logic bal3(.a(a[2]),.b(b[2]),.c(c[2]),.sum(s[2]),.carry(cr[2])) ;
bit_addition_logic bal4(.a(a[3]),.b(b[3]),.c(c[3]),.sum(s[3]),.carry(cr[3])) ;

bit_addition_logic bal5(.a(a[4]),.b(b[4]),.c(c[4]),.sum(s[4]),.carry(cr[4])) ;
bit_addition_logic bal6(.a(a[5]),.b(b[5]),.c(c[5]),.sum(s[5]),.carry(cr[5])) ;
bit_addition_logic bal7(.a(a[6]),.b(b[6]),.c(c[6]),.sum(s[6]),.carry(cr[6])) ;
bit_addition_logic bal8(.a(a[7]),.b(b[7]),.c(c[7]),.sum(s[7]),.carry(cr[7])) ;

bit_addition_logic bal9(.a(a[8]),.b(b[8]),.c(c[8]),.sum(s[8]),.carry(cr[8])) ;
bit_addition_logic bal10(.a(a[9]),.b(b[9]),.c(c[9]),.sum(s[9]),.carry(cr[9])) ;
bit_addition_logic bal11(.a(a[10]),.b(b[10]),.c(c[10]),.sum(s[10]),.carry(cr[10])) ;
bit_addition_logic bal12(.a(a[11]),.b(b[11]),.c(c[11]),.sum(s[11]),.carry(cr[11])) ;

bit_addition_logic bal13(.a(a[12]),.b(b[12]),.c(c[12]),.sum(s[12]),.carry(cr[12])) ;
bit_addition_logic bal14(.a(a[13]),.b(b[13]),.c(c[13]),.sum(s[13]),.carry(cr[13])) ;
bit_addition_logic bal15(.a(a[14]),.b(b[14]),.c(c[14]),.sum(s[14]),.carry(cr[14])) ;
bit_addition_logic bal16(.a(a[15]),.b(b[15]),.c(c[15]),.sum(s[15]),.carry(cr[15])) ;

//base logic
base_logic bl1 (.s(s[0]),.c(Cin),.p(p[0]),.g(g[0])) ;
base_logic bl2 (.s(s[1]),.c(cr[0]),.p(p[1]),.g(g[1])) ;
base_logic bl3 (.s(s[2]),.c(cr[1]),.p(p[2]),.g(g[2])) ;
base_logic bl4 (.s(s[3]),.c(cr[2]),.p(p[3]),.g(g[3])) ;

base_logic bl5 (.s(s[4]),.c(cr[3]),.p(p[4]),.g(g[4])) ;
base_logic bl6 (.s(s[5]),.c(cr[4]),.p(p[5]),.g(g[5])) ;
base_logic bl7 (.s(s[6]),.c(cr[5]),.p(p[6]),.g(g[6])) ;
base_logic bl8 (.s(s[7]),.c(cr[6]),.p(p[7]),.g(g[7])) ;

base_logic bl9 (.s(s[8]),.c(cr[7]),.p(p[8]),.g(g[8])) ;
base_logic bl10 (.s(s[9]),.c(cr[8]),.p(p[9]),.g(g[9])) ;
base_logic bl11 (.s(s[10]),.c(cr[9]),.p(p[10]),.g(g[10])) ;
base_logic bl12 (.s(s[11]),.c(cr[10]),.p(p[11]),.g(g[11])) ;

base_logic bl13 (.s(s[12]),.c(cr[11]),.p(p[12]),.g(g[12])) ;
base_logic bl14(.s(s[13]),.c(cr[12]),.p(p[13]),.g(g[13])) ;
base_logic bl15 (.s(s[14]),.c(cr[13]),.p(p[14]),.g(g[14])) ;
base_logic bl16 (.s(s[15]),.c(cr[14]),.p(p[15]),.g(g[15])) ;
base_logic bl17 (.s(1'b0),.c(cr[15]),.p(p[16]),.g(g[16])) ;

/////////PG LOGIC
grey_cell gc0 (.p1(p[1]),.g1(g[1]),.g0(g[0]), .g(g10)) ;
black_cell bc1 (.p1(p[3]),.g1(g[3]),.p0(p[2]),.g0(g[2]),.p(p32),.g(g32)) ;
black_cell bc2 (.p1(p[5]),.g1(g[5]),.p0(p[4]),.g0(g[4]),.p(p54),.g(g54)) ;
black_cell bc3 (.p1(p[7]),.g1(g[7]),.p0(p[6]),.g0(g[6]),.p(p76),.g(g76)) ;
black_cell bc4 (.p1(p[9]),.g1(g[9]),.p0(p[8]),.g0(g[8]),.p(p98),.g(g98)) ;
black_cell bc5 (.p1(p[11]),.g1(g[11]),.p0(p[10]),.g0(g[10]),.p(p1110),.g(g1110)) ;
black_cell bc6 (.p1(p[13]),.g1(g[13]),.p0(p[12]),.g0(g[12]),.p(p1312),.g(g1312)) ;
black_cell bc7 (.p1(p[15]),.g1(g[15]),.p0(p[14]),.g0(g[14]),.p(p1514),.g(g1514)) ;

grey_cell gc1 (.p1(p32),.g1(g32),.g0(g10), .g(g30)) ;
black_cell bc01 (.p1(p54),.g1(g54),.p0(p32),.g0(g32),.p(p52),.g(g52)) ;
black_cell bc02 (.p1(p76),.g1(g76),.p0(p54),.g0(g54),.p(p74),.g(g74)) ;
black_cell bc03 (.p1(p98),.g1(g98),.p0(p76),.g0(g76),.p(p96),.g(g96)) ;
black_cell bc04 (.p1(p1110),.g1(g1110),.p0(p98),.g0(g98),.p(p118),.g(g118)) ;
black_cell bc05 (.p1(p1312),.g1(g1312),.p0(p1110),.g0(g1110),.p(p1310),.g(g1310)) ;
black_cell bc06 (.p1(p1514),.g1(g1514),.p0(p1312),.g0(g1312),.p(p1512),.g(g1512)) ;

grey_cell gc2 (.p1(p52),.g1(g52),.g0(g10), .g(g50)) ;
grey_cell gc3 (.p1(p74),.g1(g74),.g0(g30), .g(g70)) ;
black_cell bc11 (.p1(p96),.g1(g96),.p0(p52),.g0(g52),.p(p92),.g(g92)) ;
black_cell bc12 (.p1(p118),.g1(g118),.p0(p74),.g0(g74),.p(p114),.g(g114)) ;
black_cell bc13 (.p1(p1310),.g1(g1310),.p0(p96),.g0(g96),.p(p136),.g(g136)) ;
black_cell bc14 (.p1(p1512),.g1(g1512),.p0(p118),.g0(g118),.p(p158),.g(g158)) ;

grey_cell gc4 (.p1(p92),.g1(g92),.g0(g10), .g(g90)) ;
grey_cell gc5 (.p1(p114),.g1(g114),.g0(g30), .g(g110)) ;
grey_cell gc6 (.p1(p136),.g1(g136),.g0(g50), .g(g130)) ;
grey_cell gc7 (.p1(p158),.g1(g158),.g0(g70), .g(g150)) ;

grey_cell gc8 (.p1(p[2]),.g1(g[2]),.g0(g10), .g(g20)) ;
grey_cell gc9 (.p1(p[4]),.g1(g[4]),.g0(g30), .g(g40)) ;
grey_cell gc10 (.p1(p[6]),.g1(g[6]),.g0(g50), .g(g60)) ;
grey_cell gc11 (.p1(p[8]),.g1(g[8]),.g0(g70), .g(g80)) ;
grey_cell gc12 (.p1(p[10]),.g1(g[10]),.g0(g90), .g(g100)) ;
grey_cell gc13 (.p1(p[12]),.g1(g[12]),.g0(g110), .g(g120)) ;
grey_cell gc14 (.p1(p[14]),.g1(g[14]),.g0(g130), .g(g140)) ;
grey_cell gc15 (.p1(p[16]),.g1(g[16]),.g0(g150), .g(g160)) ;
//grey_cell gc15 (.p1(1'b0),.g1(cr[15]),.g0(g160), .g(g15150)) ;

//sum logic
assign sum[0] = p[0] ;
sum_logic sl1 (.p(p[1]),.g(g[0]),.s(sum[1])) ;
sum_logic sl2 (.p(p[2]),.g(g10),.s(sum[2])) ;
sum_logic sl3 (.p(p[3]),.g(g20),.s(sum[3])) ;
sum_logic sl4 (.p(p[4]),.g(g30),.s(sum[4])) ;
sum_logic sl5 (.p(p[5]),.g(g40),.s(sum[5])) ;
sum_logic sl6 (.p(p[6]),.g(g50),.s(sum[6])) ;
sum_logic sl7 (.p(p[7]),.g(g60),.s(sum[7])) ;
sum_logic sl8 (.p(p[8]),.g(g70),.s(sum[8])) ;
sum_logic sl9 (.p(p[9]),.g(g80),.s(sum[9])) ;
sum_logic sl10 (.p(p[10]),.g(g90),.s(sum[10])) ;
sum_logic sl11 (.p(p[11]),.g(g100),.s(sum[11])) ;
sum_logic sl12 (.p(p[12]),.g(g110),.s(sum[12])) ;
sum_logic sl13 (.p(p[13]),.g(g120),.s(sum[13])) ;
sum_logic sl14 (.p(p[14]),.g(g130),.s(sum[14])) ;
sum_logic sl15 (.p(p[15]),.g(g140),.s(sum[15])) ;
sum_logic sl16 (.p(p[16]),.g(g160),.s(sum[16])) ;

assign carry = g160 ;
endmodule
