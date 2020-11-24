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
        wire nand1, or1;

	jkff jjkk1 (yy[0], tmp[0], 1'b1, 1'b1, pulse  , 1'b0, or1);
	jkff jjkk2 (yy[1], tmp[1], 1'b1, 1'b1, tmp[0] , 1'b0, or1);
	jkff jjkk3 (yy[2], tmp[2], 1'b1, 1'b1, tmp[1] , 1'b0, or1);
	jkff jjkk4 (yy[3], tmp[3], 1'b1, 1'b1, tmp[2] , 1'b0, or1);

	and n1 (nand1, ~tmp[0], tmp[1], ~tmp[2], tmp[3]);
	or o1  (or1, nand1, ~clear);	


	assign y = yy;

endmodule// end assincouter


module principal;

	wire [3:0]out;
	reg clk, clear , aux;

	assincouter ass (out, clk, clear); 

	initial
	begin : main 

	$display ( "Time couter");

		//valores iniciais
		 aux = 0;
		  clear = 0;
		  clk = 1;
		 #1 clear = 1;
		 #39;
		 aux = 1;

		#119 $finish;
	
	
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



*/
