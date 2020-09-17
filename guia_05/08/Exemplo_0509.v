/*
 * Nome : Diego Da Silva Ferreira
 * Matricula : 71 06 78
 * */

/*
 * recria a espressão (~a | ~b) apenas com portas nand
 * @input a - booleano a ser utilizado na expressão
 * @input b - booleano a ser utilizado na expressão
 * @output s - resulatado da expressão
 * */
module expressao (output s , input a , input b);

	wire resp , not_b;

	nand (s , a , b);
	

endmodule // disjuncao

module Exemplo;

	reg p, q;
	wire resp;
	expressao ou (resp , p, q);
		
	initial
	begin : main

		   p = 1'b0 ; q = 1'b0;
	
		$monitor ("(~(%1b) | ~(%1b)) -> %1b", p , q ,resp ) ;
	
		#1 p = 1'b1 ; q = 1'b1;
		#1 p = 1'b0 ; q = 1'b1;
		#1 p = 1'b1 ; q = 1'b0;

	end //main
endmodule //Exemplo
/*
teste : 

(~(0) | ~(0)) -> 1
(~(1) | ~(1)) -> 0
(~(0) | ~(1)) -> 1
(~(1) | ~(0)) -> 1

*/
