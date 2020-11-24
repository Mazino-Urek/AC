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

module assincouter(output [4:0]y, input pulse, input clear);

	wire tmp;

	jkff jjkk1 (tmp, y[0], 1'b1, 1'b1, pulse, 1'b0, clear);
	jkff jjkk2 (tmp, y[1], 1'b1, 1'b1, y[0] , 1'b0, clear);
	jkff jjkk3 (tmp, y[2], 1'b1, 1'b1, y[1] , 1'b0, clear);
	jkff jjkk4 (tmp, y[3], 1'b1, 1'b1, y[2] , 1'b0, clear);
	jkff jjkk5 (tmp, y[4], 1'b1, 1'b1, y[3] , 1'b0, clear);


endmodule// end assincouter


module principal;

	wire [4:0]out;
	reg clk, clear, aux;

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
		 #3 aux = 1;

		#62 $finish;
	
	
	end 

	always
	#1 clk = ~clk;

	always @( posedge clk & aux )
		begin
			$display ( "%4d %5b", $time, out );
		end 
endmodule//end principal
/*
teste:

Time couter
   4 11111
   6 11110
   8 11101
  10 11100
  12 11011
  14 11010
  16 11001
  18 11000
  20 10111
  22 10110
  24 10101
  26 10100
  28 10011
  30 10010
  32 10001
  34 10000
  36 01111
  38 01110
  40 01101
  42 01100
  44 01011
  46 01010
  48 01001
  50 01000
  52 00111
  54 00110
  56 00101
  58 00100
  60 00011
  62 00010
  64 00001
  66 00000

*/
