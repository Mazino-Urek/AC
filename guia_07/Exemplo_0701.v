/*
 
 Nome : Diego Da Siva Ferreira
 Matricula : 71 06 78



 01.) Projetar e descrever em Verilog, usando portas nativas,
uma unidade lógica (LU) com operações AND e NAND,
com duas saídas simultâneas (paralelas, 2 respostas), para variáveis de entrada 01 com bit cada.
O nome do arquivo deverá ser Exemplo_0701.v,
e poderá seguir o modelo descrito abaixo.
Incluir previsão de testes.
Simular o módulo no Logisim e apresentar layout do circuito e subcircuitos.
*/


module mux (output s, ss, input x , y);

	
	and novo1 (s , x, y);
	not novo2 (ss , s);

endmodule

module exercicio;

	reg x , y;
	wire s , ss;

	mux novo (s , ss , x , y);
	
	initial
	begin : main

		x = 1'b1; y = 1'b1;

		$display("x y and nand");
		$monitor("%1b %1b  %1b   %1b" , x , y, s, ss);

		#1  x = 1'b1; y = 1'b0;
		#1  x = 1'b0; y = 1'b1;
		#1  x = 1'b0; y = 1'b0;
	

	end//main
endmodule//exercicio
/*

x y and nand
1 1  1   0
1 0  0   1
0 1  0   1
0 0  0   1

*/
