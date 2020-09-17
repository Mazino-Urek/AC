/*
Guia_0303

Nome : Diego Da Silva ferreira
Matricula: 71 06 78


*/
module Guia_0303;
// define data

reg signed [4:0] a = 5'b10110 ; // (A)
reg signed [5:0] b = 6'b110011 ; // (B)
reg signed [5:0] c = 6'b111101 ; // (C)
reg signed [6:0] d = 7'b1010111 ; // (D)
reg signed [7:0] e = 8'b10101001 ; // (E)

// actions
initial
begin : main

	a = ~(a-1);
	b = ~(b-1);
	c = ~(c-1);
	d = ~(d-1);
	e = ~(e-1);

	$display ( "Guia_0303 - Tests" );

	$display ( "(A) = %d" , a);
	$display ( "(B) = %d" , b);
	$display ( "(C) = %6b" , c);
	$display ( "(D) = %7b" , d);
	$display ( "(E) = %h" , e);

end // main end // main
endmodule // Guia_0303
