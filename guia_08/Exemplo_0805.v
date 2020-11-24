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


module soma(output [4:0]resp, input [4:0]a, input [4:0]b);

	wire c1, c2, c3, c4, c5;
	
	fullAdder ADDER1( c1,    resp[0], a[0], b[0],  1'b0   );
	fullAdder ADDER2( c2,    resp[1], a[1], b[1], c1 );
	fullAdder ADDER3( c3,    resp[2], a[2], b[2], c2 );
	fullAdder ADDER4( c4,    resp[3], a[3], b[3], c3 );
	fullAdder ADDER5( c5,    resp[4], a[4], b[4], c4 );
	
	

	endmodule // end main

module complemento (output [4:0] resp, input [4:0]a);
	
	soma ss (resp, ~a, 5'b00001);

endmodule

module principal;
	
	reg [4:0] a;

        wire [4:0]com;
	complemento cc ( com, a);

	initial 
	begin:main
		
		#1 a = 5'b11101;

		$display("Exemplo0801 - Diego Da silva Ferreira - 71 06 78 \n");
		$display("   A  complemento");
		$monitor(" %5b  %5b", a, com);

		#1 a = 5'b00000; 
		#1 a = 5'b11011; 
		#1 a = 5'b11110; 
	end
endmodule // end principal
/*

Exemplo0801 - Diego Da silva Ferreira - 71 06 78 

   A  complemento
 11101  00011
 00000  00000
 11011  00101
 11110  00010

*/
