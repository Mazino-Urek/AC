/*
 
 Nome : Diego Da Siva Ferreira
 Matricula : 71 06 78

  NOTA: mux simplificado atraves da tabela verdade (metodo de karnaugh);


*/

/*selec = 1 = or;
 *selec = 0 = nor */ 
module mux (output s, input x , y, z);

	assign s = (~x & ~y & ~z) | (x & z) | (y & z);

endmodule

module exercicio;

	reg x , y, selec;
	wire s;

	mux novo (s  , x , y, selec);
	
	initial
	begin : main

		x = 1'b0; y = 1'b0; selec = 1'b1;

		$display("x y selec saida");
		$monitor("%1b %1b   %1b     %1b" , x , y, selec, s);

		#1  x = 1'b1; y = 1'b0; selec = 1'b1;
		#1  x = 1'b0; y = 1'b1; selec = 1'b0;
		#1  x = 1'b0; y = 1'b0; selec = 1'b0;
	
	end//main
endmodule//exercicio
/*

x y selec saida
0 0   1     0
1 0   1     1
0 1   0     0
0 0   0     1

*/
