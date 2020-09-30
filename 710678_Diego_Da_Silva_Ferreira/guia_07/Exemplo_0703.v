/*
 
 Nome : Diego Da Siva Ferreira
 Matricula : 71 06 78


 NOTA: mux simplificado atraves da tabela verdade (metodo de karnaugh);

*/

/*w = 0 = or/nor
* w = 1 = and/nand
* z = 1 = or/and
* z = 0 = nor/nand
* */
module mux (output s, input x , y, w, z);

	assign s = (~x & ~y & ~z) | 
		   (~w & z & y)   |  
		   (x & y & z)    | 
		   (~w & z & x)   | 
		   (w & ~z & ~x)  | 
		   (w & ~z & ~y)  ; 

endmodule

module exercicio;

	reg x , y, w, z;
	wire s;

	mux novo (s  , x , y, w, z);
	
	initial
	begin : main

		    x = 1'b0; y = 1'b0; w = 1'b0; z = 1'b0;

		$display("x y selec1 selec2 saida");
		$monitor("%1b %1b   %1b     %1b     %1b" , x , y, w, z, s);


		#1  x = 1'b0; y = 1'b0; w = 1'b0; z = 1'b1;
		#1  x = 1'b0; y = 1'b0; w = 1'b1; z = 1'b0;
		#1  x = 1'b0; y = 1'b0; w = 1'b1; z = 1'b1;


		#1  x = 1'b0; y = 1'b1; w = 1'b0; z = 1'b0;
		#1  x = 1'b0; y = 1'b1; w = 1'b0; z = 1'b1;
		#1  x = 1'b0; y = 1'b1; w = 1'b1; z = 1'b0;
		#1  x = 1'b0; y = 1'b1; w = 1'b1; z = 1'b1;


		#1  x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b0;
		#1  x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b1;
		#1  x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b0;
		#1  x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b1;


		#1  x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b0;
		#1  x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b1;
		#1  x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b0;
		#1  x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b1;

	end//main
endmodule//exercicio
/*

x y selec1 selec2 saida
0 0   0     0     1
0 0   0     1     0
0 0   1     0     1
0 0   1     1     0
0 1   0     0     0
0 1   0     1     1
0 1   1     0     1
0 1   1     1     0
1 0   0     0     0
1 0   0     1     1
1 0   1     0     1
1 0   1     1     0
1 1   0     0     0
1 1   0     1     1
1 1   1     0     0
1 1   1     1     1


*/
