/*
Guia_0301

Nome: Diego Da Silva Ferreira
Matricula: 71 06 78

*/
module Guia_0301;
// define data
reg [3:0] a = 4'b1001 ;   // (A)
reg [3:0] b = 4'b1110 ;   // (B)
reg [5:0] c = 6'b111011 ; // (C)
reg [4:0] d = 5'b10101 ;  // (D)
reg [5:0] e = 6'b110001 ; // (E)

reg [5:0] aa = 0 ; //(A)
reg [7:0] bb = 0 ; //(B)
reg [5:0] cc = 0 ; //(C)
reg [6:0] dd = 0 ; //(D)
reg [7:0] ee = 0 ; //(E)

// actions
initial
begin : main

	aa = ~a;
	bb = ~b;
	cc = ~c+1;
	dd = ~d+1;
	ee = ~e+1;

	$display ( "Guia_0301" );

	$display( "(A) = %6b", aa  );
	$display( "(B) = %8b", bb  );
	$display( "(C) = %6b", cc  );
	$display( "(D) = %7b", dd  );
	$display( "(E) = %8b", ee  );

end // main
endmodule // Guia_0301
