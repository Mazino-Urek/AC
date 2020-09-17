/*
 * Nome : Diego Da Silva Ferreira
 * Matricula : 71 06 78
 * */

/*
 * cria uma conjunção utilizando apenas a porta nand
 * @imput a  - boleano a ser utilizado na espressão
 * @imput b  - boleano a ser utilizado na espressão
 * @output s - sresultado da disjução
 * */ 
module conjuncao (output s , input a , input b);

	wire resp;
	nand con1 (resp ,a, b);
	nand con2 (s , resp, resp);

endmodule // conjuncao

module Exemplo;

	reg p, q;
	wire resp;
	conjuncao ee (resp , p, q);
		
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
