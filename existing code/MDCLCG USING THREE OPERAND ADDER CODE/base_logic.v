
module base_logic (s,c,p,g) ;

input s,c ;

output p,g ;

assign p = s ^ c ;
assign g = s & c ;

endmodule
