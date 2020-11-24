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

module assincouter(output [5:0]y, input pulse, input clear, input in);

	wire [5:0]tmp , inp;

	jkff jjkk1 (y[0], tmp[0], in | y[5], ~in |  ~y[5], pulse  , 1'b0, clear);
	jkff jjkk2 (y[1], tmp[1],      y[0],        ~y[0], pulse  , 1'b0, clear);
	jkff jjkk3 (y[2], tmp[2],      y[1],        ~y[1], pulse  , 1'b0, clear);
	jkff jjkk4 (y[3], tmp[3],      y[2],        ~y[2], pulse  , 1'b0, clear);
	jkff jjkk5 (y[4], tmp[4],      y[3],        ~y[3], pulse  , 1'b0, clear);
	jkff jjkk6 (y[5], tmp[5],      y[4],        ~y[4], pulse  , 1'b0, clear);


endmodule// end assincouter


module principal;

	wire [5:0]out;
	reg clk, clear , aux, in;

	assincouter ass (out, clk, clear, in);//função para contar 

	initial
	begin : main 

	$display ( "Time couter");

		//valores iniciais
		 aux = 0;
		 clear = 1;
		 clk = 0;
		 #2 clear = 0;
		 #3 aux = 1;

		 #10 in = 1;
		 #10 in = 0;
		 #10 in = 1;
		 #10 in = 0;
		 

		#200 $finish;
	
	
	end 

	always
	#5 clk = ~clk;

always @( posedge clk)
		begin
			$display ( "%4d %5b", $time, out );
		end 
endmodule//end principal
/*
teste:

Time couter
   5 000000
  15 000000
  25 000001
  35 000010
  45 000101
  55 001010
  65 010100
  75 101000
  85 010001
  95 100010
 105 000101
 115 001010
 125 010100
 135 101000
 145 010001
 155 100010
 165 000101
 175 001010
 185 010100
 195 101000
 205 010001
 215 100010
 225 000101
 235 001010
 245 010100


*/
