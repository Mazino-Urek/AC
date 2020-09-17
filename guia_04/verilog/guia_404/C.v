/*
* Nome : Diego Da Silva Ferreira
* Matricula : 71 06 78
*
**/


module PoS (output s, input x, y, w  ,  z);
assign s =   (x|y|~w|z) & (x|y|~w|~z) & (x|y|w|z) & (x|y|w|~z) &
             (x|~y|~w|~z) & (~x|y|~w|z) & (~x|y|w|~z) & (~x|~y|~w|~z) 	;

endmodule // SoP

module guia_A;
reg x, y, w , z;
wire s1; 
// instancias
PoS FXY1 (s1, x, y,w , z);

// valores iniciais
initial begin: start
x=1'b0; y=1'b0; z = 1'b0; w = 1'b1; // indefinidos
end

// parte principal
initial begin: main

// identificacao
$display("Guia-04 - Diego Da Silva Ferreira - 71 06 78 ");
$display(" x  y  w  z |  PoS(0,1,2,3,5,8,11,13)  " );
$monitor("%2b %2b %2b %2b |    %2b" , x , y, w , z ,  s1);

// sinalizacao
#1 x=0; y=0; w=1; z=1;
#1 x=0; y=0; w=0; z=0;
#1 x=0; y=0; w=0; z=1;
#1 x=0; y=1; w=1; z=0;
#1 x=0; y=1; w=1; z=1;
#1 x=0; y=1; w=0; z=0;
#1 x=0; y=1; w=0; z=1;
#1 x=1; y=0; w=1; z=0;
#1 x=1; y=0; w=1; z=1;
#1 x=1; y=0; w=0; z=0;
#1 x=1; y=0; w=0; z=1;
#1 x=1; y=1; w=1; z=0;
#1 x=1; y=1; w=1; z=1;
#1 x=1; y=1; w=0; z=0;
#1 x=1; y=1; w=0; z=1;




end
endmodule // test_module
/*

teste:

Guia-04 - Diego Da Silva Ferreira - 71 06 78 
 x  y  w  z |  PoS(0,1,2,3,5,8,11,13)  
 0  0  1  0 |     0
 0  0  1  1 |     0
 0  0  0  0 |     0
 0  0  0  1 |     0
 0  1  1  0 |     1
 0  1  1  1 |     0
 0  1  0  0 |     1
 0  1  0  1 |     1
 1  0  1  0 |     0
 1  0  1  1 |     1
 1  0  0  0 |     1
 1  0  0  1 |     0
 1  1  1  0 |     1
 1  1  1  1 |     0
 1  1  0  0 |     1
 1  1  0  1 |     1



*/
