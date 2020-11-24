/* 

Nome: Diego da Silva Ferreira
Matricula: 71 06 78

*/




module tff ( output q, output qnot,
             input t, input clk,
             input preset, input clear );

     reg q, qnot;

     always @( posedge clk or ~preset or ~clear)

     begin
	if ( clear )
	begin 
		q <= 0; qnot <= 1; 
	end
	else
		if ( preset )
		 begin 
		 	q <= 1; qnot <= 0; 
		 end
		 else
		 begin
			 if ( t ) 
			 begin 
			 q <= ~q; qnot <= ~qnot; 
		 	end
		 end
end
endmodule // tff


module couter(output [2:0]y, input pulse, input clear);

	wire [2:0]yy;
        wire [2:0]tmp;

	tff tt1 (y[0], tmp[0], 1'b1, pulse  , 1'b0, clear);
	tff tt2 (y[1], tmp[1], 1'b1, tmp[0] , 1'b0, clear);
	tff tt3 (y[2], tmp[2], 1'b1, tmp[1] , 1'b0, clear);

endmodule// end assincouter


module principal;

	wire [2:0]out;
	reg clk, clear , aux;

	couter cou (out, clk, clear); 

	initial
	begin : main 

	$display ( "Time couter");

		//valores iniciais
		aux = 0;
		clear = 1;
		clk = 1;
		#1 clear = 0;
		#2 aux = 1;

		#17 $finish;
	
	
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
   4   000
   6   001
   8   010
  10   011
  12   100
  14   101
  16   110
  18   111
  20   000

*/
