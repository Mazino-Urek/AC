/*

 Nome: Diego Da Silva Ferreira
 Matricula: 71 06 78

*/ 

module diferenca1 (output diferenca, input a, b, c);

	wire xor1;

	xor xor2 (xor1 , a, b );
	xor xor3 ( diferenca,  xor1, c);

endmodule


module dife ( output diferenca2, output S, input a, b, c );

	wire and1, and2, and3;

	diferenca1 dd (diferenca2, a, b ,c);

	and an1 (and1, b, c);
	and an2 (and2, (~a), c);
	and an3 (and3, (~a), b);
	
	or or1( S, and1, and2, and3);

endmodule 


module main(output [3:0]resp, input [2:0]a, input [2:0]b);

	wire c1, c2;
	
	dife ADDER1( resp[0], c1      ,a[0], b[0],  1'b0   );
	dife ADDER2( resp[1], c2      ,a[1], b[1], c1 );
	dife ADDER3( resp[2], resp[3] ,a[2], b[2], c2 );

endmodule // Fim main


module test_fullAdder;
	
	reg [2:0] a;
	reg [2:0] b;

	wire carryOut;
        wire [3:0]soma;
	main sub( soma, a , b);

	initial 
	begin:main
		
		#10 a = 3'b111; b = 3'b000;

		$display("Exemplo0801 - Diego Da silva Ferreira - 71 06 78 \n");
		$monitor("\n-----------\n%7b\n%7b\n-----------\n[%b] %3b", 
			  a, b, soma[3], soma[2:0]);

		#1 a = 3'b101; b = 3'b011;
		#1 a = 3'b110; b = 3'b010;
		#1 a = 3'b111; b = 3'b111;
	end
endmodule // test_fullAdder
/*

Exemplo0801 - Diego Da silva Ferreira - 71 06 78 


-----------
    111
    000
-----------
[0] 111

-----------
    101
    011
-----------
[0] 010

-----------
    110
    010
-----------
[0] 100

-----------
    111
    111
-----------
[0] 000


*/
