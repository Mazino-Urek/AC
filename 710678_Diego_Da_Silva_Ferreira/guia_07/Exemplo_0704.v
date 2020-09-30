/*
 
 Nome : Diego Da Siva Ferreira
 Matricula : 71 06 78


*/

module mux (output s, input x , y, selec1, selec2);

	wire vor1, vxor1, vnor1, vxnor1, nselec1, nselec2;
	wire and1, and2, and3, and4, and5, and6;
	wire or1, or2, or3;

	or(vor1, x ,y);
	xor(vxor1, x , y);
	nor(vnor1, x, y);
	xnor(vxnor1, x, y);

	not(nselec1, selec1);
	not(nselec2, selec2);

	and(and1, vor1, nselec1);
	and(and2, vxor1, selec1);


	and(and3, vnor1, nselec1);
	and(and4, vxnor1, selec1);

	or(or1, and1, and2);
	or(or2, and3, and4);

	and(and5, or1, nselec2);
	and(and6, or2, selec2);

	or(s, and5, and6);


endmodule

module exercicio;

	reg x , y, w, z;
	wire s;

	mux novo (s  , x , y, w, z);
	
	initial
	begin : main


		#1 w = 1'b0; z = 1'b0;

		#1 x = 1'b0; y = 1'b0;

		$display("x y selec1 selec2 saida");
		$monitor("%1b %1b   %1b     %1b     %1b" , x , y, w, z, s);

		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;	


		#1 w = 1'b0; z = 1'b1;

		#1 x = 1'b0; y = 1'b0;
		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;


		#1 w = 1'b1; z = 1'b1;

		#1 x = 1'b0; y = 1'b0;
		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;

		#1 w = 1'b1; z = 1'b0;

		#1 x = 1'b0; y = 1'b0;
		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;


	end//main
endmodule//exercicio
/*

x y selec1 selec2 saida
0 0   0     0     0
0 1   0     0     1
1 1   0     0     1
1 0   0     0     1
1 0   0     1     0
0 0   0     1     1
0 1   0     1     0
1 1   0     1     0
1 0   0     1     0
1 0   1     1     0
0 0   1     1     1
0 1   1     1     0
1 1   1     1     1
1 0   1     1     0
1 0   1     0     1
0 0   1     0     0
0 1   1     0     1
1 1   1     0     0
1 0   1     0     1


*/
