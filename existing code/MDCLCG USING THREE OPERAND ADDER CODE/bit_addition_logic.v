
module bit_addition_logic(a,b,c,sum,carry) ;

input a,b,c ;

output sum,carry ;

assign A1 = b & c ;
assign X1 = b  ^ c ;

assign A2 =X1 & a ;
assign sum  = X1  ^ a;

assign carry = A1 | A2 ;

endmodule

