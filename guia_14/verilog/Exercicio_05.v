/*
* Nome: Diego Da Silva Ferreira
* Matricula:71 06 78
*/

module dff ( output q, output qnot,
	     input d, input clk,
    	     input clear, input preset);

     reg q, qnot;
	always @( posedge clk )
	begin
		if(clear)
		begin
			q <= 1'b0;
			qnot <= 1'b1;
		end
		else
		begin
			if(preset)
			begin
				q <= 1'b1;
				qnot <= 1'b0;
			end
			else
			begin
				q <= d;
				qnot <= ~d;
			end
		end
	end
endmodule // dff


module Exe (output [5:0]s, input clk, input x, 
	    input clear,input [5:0]pre, input ld);

	wire [5:0]tmp;
	wire [5:0]and1;

	and ad6(and1[5], pre[5], ld);
	and ad5(and1[4], pre[4], ld);
	and ad4(and1[3], pre[3], ld);
	and ad3(and1[2], pre[2], ld);
	and ad2(and1[1], pre[1], ld);
	and ad1(and1[0], pre[0], ld);

	dff ddf1 (s[5], tmp[0],  x      , clk, clear, and1[5]);
	dff ddf2 (s[4], tmp[1], s[5]    , clk, clear, and1[4]);
	dff ddf3 (s[3], tmp[2], s[4]    , clk, clear, and1[3]);
	dff ddf4 (s[2], tmp[3], s[3]    , clk, clear, and1[2]);
	dff ddf5 (s[1], tmp[4], s[2]    , clk, clear, and1[1]);
	dff ddf6 (s[0], tmp[5], s[1]    , clk, clear, and1[0]);
	
endmodule

module principal;

	wire [5:0]out;
	reg clk, in, clear, ld;
	reg [5:0]pre;

	Exe exe1 (out, clk, in, clear, pre, ld);

	initial
	begin : main 

		$display ( "Time Saida");

		 clear = 1;
		 pre = 6'b010101;
		 in = 0;
		 ld = 1;
		 clk = 1;
		#1 clear = 0;
		#14 ld = 0;

		#59 $finish;
	end 

	always
	#5 clk = ~clk;

	always @( posedge clk & ~ld )
		begin
			$display ( "%4d %5b", $time, out );
		end 
endmodule//end principal
/*
teste:

Time Saida
  20 010101
  30 001010
  40 000101
  50 000010
  60 000001
  70 000000

*/
