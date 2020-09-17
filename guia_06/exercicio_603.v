/*
 * Nome: Diego Da Silva Ferreira
 * Matricula: 71 06 78
 *
 * Construir os mapas de Veitch-Karnaugh e simplificar as funções lógicas abaixo
 * e verificar pelas respectivas tabelas-verdades implementadas em Verilog: 
 * 
 *
 * Notas: todas as questão da primeira questôes(a,b,c,...) estão contidas 
 *        neste programa incluido seus respectivos mapas de Veitch-Karnaugh. 
 * */

//a) f(x,y,w,z) = ∑ m ( 1, 3, 6, 7, 11, 15 )
module letra_a (output resp, input x , input y , input w , input z);

	assign resp = (~x & ~y & z) | (~x & y & w) | (x & w & z);

/*
mapa de karnaugh

------------------------------------
    wz |      |      |      |      |
 xy    |  00  |  01  |  11  |  10  |
------------------------------------
   00  |      |  1   |  1   |      |
------------------------------------
   01  |      |      |  1   |  1   |
------------------------------------
   11  |      |      |  1   |      |  
------------------------------------
   10  |      |      |  1   |      |
------------------------------------


*/

endmodule//end letra_a

//b) f(x,y,w,z) = ∑ m ( 0, 2, 3, 5, 9, 13 )
module letra_b (output resp, input x , input y , input w , input z);

	assign resp = (y & ~w & z) | (x & ~w & z) | (~x & ~y & w) | (~x & ~y & ~z);

/*
mapa de karnaugh

------------------------------------
    wz |      |      |      |      |
 xy    |  00  |  01  |  11  |  10  |
------------------------------------
   00  |  1   |      |  1   |  1   |
------------------------------------
   01  |      |  1   |      |      |
------------------------------------
   11  |      |  1   |      |      |  
------------------------------------
   10  |      |  1   |      |      |
------------------------------------


*/

endmodule//end letra_b

//c) f(x,y,w,z) = ∑ m ( 0, 1, 2, 3, 5, 8, 10, 12 )
module letra_c (output resp, input x , input y , input w, input z);

	assign resp = (~x & ~y) | (~x & ~w & z) | (x & ~w & ~z) | (x & ~y & ~z);

/*
mapa de karnaugh

------------------------------------
    wz |      |      |      |      |
 xy    |  00  |  01  |  11  |  10  |
------------------------------------
   00  |  1   |  1   |  1   |  1   |
------------------------------------
   01  |      |  1   |      |      |
------------------------------------
   11  |  1   |      |      |      |  
------------------------------------
   10  |  1   |      |      |  1   |
------------------------------------


*/

endmodule//end letra_c

//d) f(x,y,w,z) = ∑ m ( 2, 4, 5, 8, 10, 12, 13 )
module letra_d (output resp, input x , input y , input w , input z);

	assign resp = (y & ~z) | (x & y) | (~x & ~y & z);

/*
mapa de karnaugh

------------------------------------
    wz |      |      |      |      |
 xy    |  00  |  01  |  11  |  10  |
------------------------------------
   00  |      |      |      |      |
------------------------------------
   01  |      |      |      |      |
------------------------------------
   11  |      |      |      |      |  
------------------------------------
   10  |      |      |      |      |
------------------------------------


*/

endmodule//end letra_d

//e) f(x,y,w,z) = ∑ m ( 0, 1, 2, 7, 9, 11, 13, 15 )
module letra_e (output resp, input x , input y , input w , input z);

	assign resp = (~x & ~z) | (y & z) ;

/*
mapa de karnaugh

------------------------------------
    wz |      |      |      |      |
 xy    |  00  |  01  |  11  |  10  |
------------------------------------
   00  |      |      |      |      |
------------------------------------
   01  |      |      |      |      |
------------------------------------
   11  |      |      |      |      |  
------------------------------------
   10  |      |      |      |      |
------------------------------------


*/

endmodule//end letra_d




module principal;

	integer cont;
	reg x , y, w , z;
	wire a, b, c, d, e;
	letra_a novo1 (a , x, y, w , z);
	letra_b novo2 (b , x, y, w , z);
	letra_c novo3 (c , x, y, w , z);
	letra_d novo4 (d , x, y, w , z);
	letra_e novo5 (e , x, y, w , z);

	initial 
	begin : main

		cont = 0; x = 1'b0; y = 1'b0; w = 1'b0; z = 1'b0;


		$display (" *  | x | y | w | z | A | B | C | D | E |");
		$monitor (" %2d | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b |" 
		, cont, x, y, w, z, a, b, c, d, e);



		#1 cont = 1; x = 1'b0; y = 1'b0; w = 1'b0; z = 1'b1;
		#1 cont = 2; x = 1'b0; y = 1'b0; w = 1'b1; z = 1'b0;
		#1 cont = 3; x = 1'b0; y = 1'b0; w = 1'b1; z = 1'b1;


		#1 cont = 4; x = 1'b0; y = 1'b1; w = 1'b0; z = 1'b0;
		#1 cont = 5; x = 1'b0; y = 1'b1; w = 1'b0; z = 1'b1;
		#1 cont = 6; x = 1'b0; y = 1'b1; w = 1'b1; z = 1'b0;
		#1 cont = 7; x = 1'b0; y = 1'b1; w = 1'b1; z = 1'b1;


		#1 cont = 8;  x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b0;
		#1 cont = 9;  x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b1;
		#1 cont = 10; x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b0;
		#1 cont = 11; x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b1;


		#1 cont = 12; x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b0;
		#1 cont = 13; x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b1;
		#1 cont = 14; x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b0;
		#1 cont = 15; x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b1;



	end//end main
endmodule//end principal
/*
teste:

 * | x | y | z | A | B | C | D | E |
 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 |
 1 | 0 | 0 | 1 | 1 | 0 | 1 | 1 | 0 |
 2 | 0 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
 3 | 0 | 1 | 1 | 1 | 0 | 1 | 0 | 1 |
 4 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
 5 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
 6 | 1 | 1 | 0 | 0 | 1 | 1 | 1 | 0 |
 7 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 1 |

*/











