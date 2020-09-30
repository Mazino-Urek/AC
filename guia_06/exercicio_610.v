/*
 * Nome: Diego Da Silva Ferreira
 * Matricula: 71 06 78
 *
 * Construir os mapas de Veitch-Karnaugh e simplificar as funções lógicas abaixo
 * e verificar pelas respectivas tabelas-verdades implementadas em Verilog: 
 * 
 *
 * 10.) Identificar as equações características dos circuitos lógicos abaixo e
 * simplifica-las pelo mapa de Veitch-Karnaugh usando MAXTERMOS.
 * Descrever e simular o circuito simplificado em Verilog e Logisim.
 * 
 * */

module letra_a (output resp, input x , input y , input w , input z);

	assign resp = (~x | ~y) & (~x | y) & (~w | ~z | ~y);

/*
mapa de karnaugh

------------------------------------
    wz |      |      |      |      |
 xy    |  00  |  01  |  11  |  10  |
------------------------------------
   00  |      |      |      |      |
------------------------------------
   01  |      |      |  0   |      |
------------------------------------
   11  |  0   |  0   |  0   |  0   |  
------------------------------------
   10  |  0   |  0   |  0   |  0   |
------------------------------------


*/

endmodule//end letra_a

module principal;

	integer cont;
	reg x , y, w , z;
	wire a;
	letra_a novo1 (a , x, y, w , z);	
	
	initial 
	begin : main

		cont = 0; x = 1'b0; y = 1'b0; w = 1'b0; z = 1'b0;


		$display (" *  | x | y | w | z | A |");
		$monitor (" %2d | %1b | %1b | %1b | %1b | %1b |" 
		, cont, x, y, w, z, a);



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

 *  | x | y | w | z | A |
  0 | 0 | 0 | 0 | 0 | 1 |
  1 | 0 | 0 | 0 | 1 | 1 |
  2 | 0 | 0 | 1 | 0 | 1 |
  3 | 0 | 0 | 1 | 1 | 1 |
  4 | 0 | 1 | 0 | 0 | 1 |
  5 | 0 | 1 | 0 | 1 | 1 |
  6 | 0 | 1 | 1 | 0 | 1 |
  7 | 0 | 1 | 1 | 1 | 0 |
  8 | 1 | 0 | 0 | 0 | 0 |
  9 | 1 | 0 | 0 | 1 | 0 |
 10 | 1 | 0 | 1 | 0 | 0 |
 11 | 1 | 0 | 1 | 1 | 0 |
 12 | 1 | 1 | 0 | 0 | 0 |
 13 | 1 | 1 | 0 | 1 | 0 |
 14 | 1 | 1 | 1 | 0 | 0 |
 15 | 1 | 1 | 1 | 1 | 0 |

*/






