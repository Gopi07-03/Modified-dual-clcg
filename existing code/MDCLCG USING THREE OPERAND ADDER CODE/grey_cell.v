
module grey_cell (p1,g1,g0,g) ;

input p1,g1,g0 ;

output  g ;

assign A1 = g0 & p1 ;
assign g = g1 | A1 ;

endmodule
