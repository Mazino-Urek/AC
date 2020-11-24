/* 

Nome: Diego da Silva Ferreira
Matricula: 71 06 78

*/


module jkff ( output q, output qnot,
              input j, input k,
	      input clk, input preset, 
	      input clear );
	
      reg q, qnot;
	
	always @( posedge clk or preset or clear )
	begin
		if ( clear )
		begin 
			q <= 0; 
			qnot <= 1; 
		end
		else
			if ( preset ) 
			begin 
				q <= 1; 
				qnot <= 0; 
			end
			else
				if ( j & ~k ) 
				begin 
					q <= 1; 
					qnot <= 0; 
				end
				else
					if ( ~j & k ) 
					begin 
						q <= 0; 
						qnot <= 1; 
					end
					else
						if ( j & k )
						begin 
							q <= ~q; 
							qnot <= ~qnot; 
						end
	end
endmodule // jkff

module assincouter(output [3:0]y, input pulse, input clear);

	wire [3:0]yy;
        wire [3:0]tmp;
        wire nand1, nand2;

	jkff jjkk1 (yy[0], tmp[0], 1'b1, 1'b1, pulse  , 1'b0, clear | ~nand1);
	jkff jjkk2 (yy[1], tmp[1], 1'b1, 1'b1, tmp[0] , 1'b0, clear | ~nand1);
	jkff jjkk3 (yy[2], tmp[2], 1'b1, 1'b1, tmp[1] , 1'b0, clear | ~nand1);
	jkff jjkk4 (yy[3], tmp[3], 1'b1, 1'b1, tmp[2] , 1'b0, clear | ~nand1);


	nand n1 (nand1, ~yy[0], yy[1], ~yy[2], yy[3]);

	assign y = yy;

endmodule// end assincouter


module principal;

	wire [3:0]out;
	reg clk, clear , aux;

	assincouter ass (out, clk, clear);//função para contar 
					  //em ordem decrescente

	initial
	begin : main 

	$display ( "Time couter");

		//valores iniciais
		 aux = 0;
		  clear = 1;
		  clk = 1;
		 #1 clear = 0;
		 #39;
		 aux = 1;

		#119 $finish;
	
	
	end 

	always
	#5 clk = ~clk;

always @( posedge clk & aux)
		begin
			$display ( "%4d %5b", $time, out );
		end 
endmodule//end principal
/*
nota: função apresenta problemas ao resetar os valores(instante 140);

teste:

Time couter
  40  0000
  50  0001
  60  0010
  70  0011
  80  0100
  90  0101
 100  0110
 110  0111
 120  1000
 130  1001
 140  1111
 150  0000


*/
