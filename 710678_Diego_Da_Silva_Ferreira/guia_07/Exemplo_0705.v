/*
 
 Nome : Diego Da Siva Ferreira
 Matricula : 71 06 78


*/

/*
* 000 --> not //atua em cima do x
* 001 --> nand
* 010 --> nor
* 100 --> or
* 101 --> xor
* 110 --> and
* 111 --> xnor
* */
module mux (output s, input x , y, selec1, selec2, selec3);

	wire vnot, vand, vor, vnor, vnand, vxor, vxnor;
	wire and1, and2, and3, and4,  and5,  and6,
	     and7, and8, and9, and10, and11, and12;
	wire or1, or2, or3, or4, or5;
	wire nselec1, nselec2, nselec3;

	not(nselec1, selec1);
	not(nselec2, selec2);
	not(nselec3, selec3);

	not(vnot, x);
	or(vor, x, y);
	nor(vnor, x, y);
	and(vand, x, y);
	nand(vnand, x, y);
	xor(vxor, x, y);
	xnor(vxnor, x, y);

	and(and1, vnot, nselec1);
	and(and2, vor, selec1);
	and(and3, vnor, nselec1);
	and(and4, vand, selec1);
	and(and5, vnand, nselec1);
	and(and6, vxor, selec1);

	or(or1, and1, and2);
	or(or2, and3, and4);
	or(or3, and5, and6);

	and(and7, or1, nselec2);
	and(and8, or2, selec2);
	and(and9, or3, nselec2);
	and(and10, vxnor, selec2);

	or(or4, and7, and8);
	or(or5, and9, and10);

	and(and11, or4, nselec3);
	and(and12, or5, selec3);

	or(s, and11, and12);
	



endmodule

module exercicio;

	reg x , y, w, z, v;
	wire s;

	mux novo (s  , x , y, w, z, v);
	
	initial
	begin : main


		#1 w = 1'b0; z = 1'b0; v = 1'b0;

		#1 x = 1'b0; y = 1'b0;

		$display("x y selec1 selec2 saida");
		$monitor("%1b %1b   %1b     %1b       %1b" , x , y, w, z, s);

		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;	


		#1 w = 1'b0; z = 1'b0; v = 1'b1;

		#1 x = 1'b0; y = 1'b0;
		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;


		#1 w = 1'b0; z = 1'b1; v = 1'b0;

		#1 x = 1'b0; y = 1'b0;
		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;

		#1 w = 1'b1; z = 1'b0; v = 1'b0;

		#1 x = 1'b0; y = 1'b0;
		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;

		#1 w = 1'b1; z = 1'b0; v = 1'b1;

		#1 x = 1'b0; y = 1'b0;
		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;

		#1 w = 1'b1; z = 1'b1; v = 1'b0;

		#1 x = 1'b0; y = 1'b0;
		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;

		#1 w = 1'b1; z = 1'b1; v = 1'b1;

		#1 x = 1'b0; y = 1'b0;
		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;

	end//main
endmodule//exercicio
/*

x y selec1 selec2 saida
0 0   0     0       1
0 1   0     0       1
1 1   0     0       0
1 0   0     0       0
1 0   0     0       1
0 0   0     0       1
0 1   0     0       1
1 1   0     0       0
1 0   0     0       1
1 0   0     1       0
0 0   0     1       1
0 1   0     1       0
1 1   0     1       0
1 0   0     1       0
1 0   1     0       1
0 0   1     0       0
0 1   1     0       1
1 1   1     0       1
1 0   1     0       1
0 0   1     0       0
0 1   1     0       1
1 1   1     0       0
1 0   1     0       1
1 0   1     1       0
0 0   1     1       0
0 1   1     1       0
1 1   1     1       1
1 0   1     1       0
0 0   1     1       1
0 1   1     1       0
1 1   1     1       1
1 0   1     1       0


*/
