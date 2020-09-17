/*
Guia_0302
Nome: Diego Da Silva Ferreira
Matricula: 71 06 78

Nota: Não consegui realizar a coverção da base 4 para binario.

*/
module Guia_0302;
// define data

reg [7:0] b = 8'h5e; // (B) 

reg [6:0] d = 7'o127; // (D)
reg [7:0] e = 8'hc7; // (E)

// actions
initial
begin : main

	d = ~d+1;
	e = ~e+1;

	$display ( "Guia_0302 - Tests" );

	$display ( "(B) = %8b" , ~b  );
	
	$display ( "(D) = %7b" , d  );
	$display ( "(E) = %8b" , e  );




end // main
endmodule // Guia_0302
