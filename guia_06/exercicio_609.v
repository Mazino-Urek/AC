/*
 * Nome: Diego Da Silva Ferreira
 * Matricula: 71 06 78
 *
 * Montar o mapa de Veitch-Karnaugh e simplificar as funções lógicas abaixo
 * e verificar pelas respectivas tabelas-verdades implementadas em Verilog:
 * 
 * 09.) Identificar a equação característica do circuito lógicos abaixo e
 * simplifica-la pelo mapa de Veitch-Karnaugh usando mintermos.
 * Descrever e simular o circuito simplificado em Verilog e Logisim. 
 *
 *
 * */


module letra_a (output resp, input x , input y , input z);

	assign resp = (x & ~y) | (x & ~z);

/*
mapa de karnaugh

------------------------------------
    yz |      |      |      |      |
 x     |  00  |  01  |  11  |  10  |
------------------------------------
   0   |      |      |      |      |
------------------------------------
   1   |  1   |  1   |      |  1   |
------------------------------------


*/

endmodule//end letra_a

module principal;

	integer cont;
	reg x , y , z;
	wire a;
	letra_a novo1 (a , x, y , z);

	initial 
	begin : main

		cont = 0; x = 1'b0; y = 1'b0; z = 1'b0;


		$display (" * | x | y | z | A |");
		$monitor (" %1d | %1b | %1b | %1b | %1b |" 
		, cont, x, y, z, a);



		#1 cont = 1; x = 1'b0; y = 1'b0; z = 1'b1;
		#1 cont = 2; x = 1'b0; y = 1'b1; z = 1'b0;
		#1 cont = 3; x = 1'b0; y = 1'b1; z = 1'b1;


		#1 cont = 4; x = 1'b1; y = 1'b0; z = 1'b0;
		#1 cont = 5; x = 1'b1; y = 1'b0; z = 1'b1;
		#1 cont = 6; x = 1'b1; y = 1'b1; z = 1'b0;
		#1 cont = 7; x = 1'b1; y = 1'b1; z = 1'b1;

	end//end main
endmodule//end principal
/*
teste:

 * | x | y | z | A |
 0 | 0 | 0 | 0 | 0 |
 1 | 0 | 0 | 1 | 0 |
 2 | 0 | 1 | 0 | 0 |
 3 | 0 | 1 | 1 | 0 |
 4 | 1 | 0 | 0 | 1 |
 5 | 1 | 0 | 1 | 1 |
 6 | 1 | 1 | 0 | 1 |
 7 | 1 | 1 | 1 | 0 |

	
*/











