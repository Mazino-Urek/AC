/*
 * Nome : Diego Da Silva Ferreira
 * Matricula : 71 06 78
 * */


/*
 * cria uma conjunção apenas com portas nor
 * @imput a - booleano a ser utilizado na conjução 
 * @imput b - booleano a ser utilizado na conjução 
 * @output s - resulatado da conjunção
 * */
module conjuncao (output s , input a , input b);

	wire not_a , not_b;
	nor con1 (not_a ,a, a);
	nor con2 (not_b ,b, b);
	nor con3 (s , not_a, not_b);

endmodule // disjuncao

module Exemplo;

	reg p, q;
	wire resp;
	conjuncao ou (resp , p, q);
		
	initial
	begin : main

		   p = 1'b0 ; q = 1'b0;
	
		$monitor ("(%1b & %1b) -> %1b", p , q ,resp ) ;
	
		#1 p = 1'b1 ; q = 1'b1;
		#1 p = 1'b0 ; q = 1'b1;
		#1 p = 1'b1 ; q = 1'b0;

	end //main
endmodule //Exemplo
/*
teste 

(0 & 0) -> 0
(1 & 1) -> 1
(0 & 1) -> 0
(1 & 0) -> 0

*/
