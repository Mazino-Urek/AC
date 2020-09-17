/*
 * Nome : Diego Da Silva Ferreira
 * Matricula : 71 06 78
 * */

/*
 * cria uma disjunção apenas com portas nand 
 * @input a - booleano a ser utilizado na disjunção
 * @input b - booleano a ser utilizado na disjunção
 * @output s - resulatado da disjunção
 * */
module disjuncao (output s , input a , input b);

	wire not_a , not_b;
	nand dis1 (not_a ,a , a);
	nand dis2 (not_b ,b , b);
	nand dsi3 (s , not_a, not_b);

endmodule // disjuncao

module Exemplo;

	reg p, q;
	wire resp;
	disjuncao ou (resp , p, q);
		
	initial
	begin : main

		   p = 1'b0 ; q = 1'b0;
	
		$monitor ("(%1b | %1b) -> %1b", p , q ,resp ) ;
	
		#1 p = 1'b1 ; q = 1'b1;
		#1 p = 1'b0 ; q = 1'b1;
		#1 p = 1'b1 ; q = 1'b0;

	end //main
endmodule //Exemplo
/*
teste

(0 | 0) -> 0
(1 | 1) -> 1
(0 | 1) -> 1
(1 | 0) -> 1

*/
