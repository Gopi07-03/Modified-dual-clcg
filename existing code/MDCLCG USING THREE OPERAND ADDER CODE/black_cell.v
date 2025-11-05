
module black_cell (p1,g1,p0,g0,p,g) ;

input p1,g1,p0,g0 ;

output  p,g ;

assign A1 = g0 & p1 ;
assign p = p1 & p0 ;
assign g = g1 | A1 ;

endmodule
