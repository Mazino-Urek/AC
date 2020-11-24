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

	wire [4:0]tmp;

	jkff jjkk1 (tmp[0], y[0], 1'b1, 1'b1, pulse  , 1'b0, clear);
	jkff jjkk2 (tmp[1], y[1], 1'b1, 1'b1, tmp[0] , 1'b0, clear);
	jkff jjkk3 (tmp[2], y[2], 1'b1, 1'b1, tmp[1] , 1'b0, clear);
	jkff jjkk4 (tmp[3], y[3], 1'b1, 1'b1, tmp[2] , 1'b0, clear);
	jkff jjkk5 (tmp[4], y[4], 1'b1, 1'b1, tmp[3] , 1'b0, clear);


endmodule// end assincouter


module principal;

	wire [4:0]out;
	reg clk, clear , aux;

	assincouter ass (out, clk, clear);//função para contar 
					  //em ordem decrescente

	initial
	begin : main 

	$display ( "Time couter");

		//valores iniciais
		 aux = 0;
		 clear = 1;
		 clk = 0;
		 #1 clear = 0;
		 #3 aux = 1;

		#65 $finish;
	
	
	end 

	always
	#1 clk = ~clk;

always @( posedge clk & aux)
		begin
			$display ( "%4d %5b", $time, out );
		end 
endmodule//end principal
/*
teste:

Time couter
   5 11111
   7 00000
   9 00001
  11 00010
  13 00011
  15 00100
  17 00101
  19 00110
  21 00111
  23 01000
  25 01001
  27 01010
  29 01011
  31 01100
  33 01101
  35 01110
  37 01111
  39 10000
  41 10001
  43 10010
  45 10011
  47 10100
  49 10101
  51 10110
  53 10111
  55 11000
  57 11001
  59 11010
  61 11011
  63 11100
  65 11101
  67 11110
  69 11111


*/
