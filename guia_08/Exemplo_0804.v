/*

 Nome: Diego Da Silva Ferreira
 Matricula: 71 06 78

*/ 

module igual (output resp, input [4:0]a, input [4:0]b);

	wire c1, c2, c3, c4, c5;
	wire d1, d2, d3, d4, d5;

	xor aa ( c1 , a[0] , b[0]);
	xor bb ( c2 , a[1] , b[1]);
	xor cc ( c3 , a[2] , b[2]);
	xor dd ( c4 , a[3] , b[3]);
	xor ee ( c5 , a[4] , b[4]);

	and (resp , c1, c2, c3, c4, c5);
	
endmodule // end igual


module principal;
	
	reg [4:0] a;
	reg [4:0] b;

        wire resp;
	igual teste( resp, a , b);

	initial 
	begin:main
		
		#1 a = 5'b11111; b = 5'b00000;

		$display("Exemplo0801 - Diego Da silva Ferreira - 71 06 78 \n");
		$display("  A     B     resp");
		$monitor("%5b %5b  %3b", a, b, resp);

		#1 a = 5'b00000; b = 5'b00000;
		#1 a = 5'b11111; b = 5'b11111;
		#1 a = 5'b01010; b = 5'b01010;

	end
endmodule // end principal
/*

Exemplo0801 - Diego Da silva Ferreira - 71 06 78

  A     B     resp
11111 00000    1
00000 00000    0
11111 11111    0
01010 01010    0

*/







