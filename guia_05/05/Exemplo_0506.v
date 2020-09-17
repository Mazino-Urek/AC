/*
 * Nome : Diego Da Silva Ferreira
 * Matricula : 71 06 78
 * */

/*
 * cria uma disjunção exclusiva apenas com portas nor
 * @input a - booleano a ser utilizado na disjunção exclusiva
 * @input b - booleano a ser utilizado na disjunção exclusiva
 * @output s - resultado da disjunção exclusiva
 * */
module disjuncao (output s , input a , input b);

	wire and_1 , and_2, gg, not_a, not_b , or_1;
	nor con1 (and_1 , a , b);

	nor con2 (not_a , a , a);
	nor con3 (not_b , b , b);
	nor con4 (and_2 , not_a , not_b);

	nor dis2 ( s, and_1 , and_2);

endmodule // disjuncao

module Exemplo;

	reg p, q;
	wire resp;
	disjuncao ou (resp , p, q);
		
	initial
	begin : main

		   p = 1'b0 ; q = 1'b0;
	
		$monitor ("(%1b ^ %1b) -> %1b", p , q ,resp ) ;
	
		#1 p = 1'b1 ; q = 1'b1;
		#1 p = 1'b0 ; q = 1'b1;
		#1 p = 1'b1 ; q = 1'b0;

	end //main
endmodule //Exemplo
/*
testes

(0 ^ 0) -> 0
(1 ^ 1) -> 0
(0 ^ 1) -> 1
(1 ^ 0) -> 1


*/
