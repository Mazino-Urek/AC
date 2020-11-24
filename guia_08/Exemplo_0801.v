/*

 Nome: Diego Da Silva Ferreira
 Matricula: 71 06 78

*/ 

module halfAdder (output cOut, output sum, input a, b);

	xor XOR1 ( sum, a, b );
	and AND1 ( cOut,  a, b );

endmodule // halfAdder


module fullAdder ( output cOut, output sum, input a, b, carryIn );

	wire cO1, cOo2, sum1;

	halfAdder ADDER1( cO1, sum1, a, b );
	halfAdder ADDER2( cO2, sum, sum1, carryIn );
	xor  XOR( cOut, cO1, cO2 );

endmodule // fullAdder


module main(output [3:0]resp, input [2:0]a, input [2:0]b);

	wire cOut1, cOut2;
	
	fullAdder ADDER1( cOut1,    resp[0], a[0], b[0],  1'b0   );
	fullAdder ADDER2( cOut2,    resp[1], a[1], b[1], cOut1 );
	fullAdder ADDER3( resp[3], resp[2], a[2], b[2], cOut2 );

endmodule // Fim main


module test_fullAdder;
	
	reg [2:0] a;
	reg [2:0] b;

	wire carryOut;
        wire [3:0]soma;
	main SOMA( soma, a , b);

	initial 
	begin:main
		
		#1 a = 3'b111; b = 3'b000;

		$display("Exemplo0801 - Diego Da silva Ferreira - 71 06 78 \n");
		$monitor("\n-----------\n%7b\n%7b\n-----------\n[%b] %3b", a, b, soma[3], soma[2:0]);

		#1 a = 3'b000; b = 3'b111;
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
    000
    111
-----------
[0] 111

-----------
    110
    010
-----------
[1] 000

-----------
    111
    111
-----------
[1] 110

*/
