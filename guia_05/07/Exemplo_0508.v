/*
 * Nome : Diego Da Silva Ferreira
 * Matricula : 71 06 78
 * */

/*
 * recria a espressão (a | ~b) apenas com portas nor
 * @input a - booleano a ser utilizado na disjunção
 * @input b - booleano a ser utilizado na disjunção
 * @output s - resulatado da espressão
 * */
module disjuncao (output s , input a , input b);

	wire resp , not_b;

	nor ex1 (not_b , b , b);
	
	nor (resp , a , not_b);

	nor (s , resp, resp);

endmodule // disjuncao

module Exemplo;

	reg p, q;
	wire resp;
	disjuncao ou (resp , p, q);
		
	initial
	begin : main

		   p = 1'b0 ; q = 1'b0;
	
		$monitor ("(%1b | ~(%1b)) -> %1b", p , q ,resp ) ;
	
		#1 p = 1'b1 ; q = 1'b1;
		#1 p = 1'b0 ; q = 1'b1;
		#1 p = 1'b1 ; q = 1'b0;

	end //main
endmodule //Exemplo
/*
teste : 

(0 | ~(0)) -> 1
(1 | ~(1)) -> 1
(0 | ~(1)) -> 0
(1 | ~(0)) -> 1

*/
