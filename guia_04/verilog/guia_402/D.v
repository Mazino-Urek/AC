/*
* Nome : Diego Da Silva Ferreira
* Matricula : 71 06 78
*
**/

module fxy (output s,
input x, y, z);
assign s = ~(x & y ) | ~(x | y);
endmodule // fxy

module guia_A;
reg x, y, z;
wire s1; 
// instancias
fxy FXY1 (s1, x, y, z);

// valores iniciais
initial begin: start
x=1'b0; y=1'b0; z = 1'b0; // indefinidos
end

// parte principal
initial begin: main

// identificacao
$display("Guia-04 - Diego Da Silva Ferreira - 71 06 78 ");
$display("Expressão : ( x . y )' + ( x + y )' \n ");
$display(" x  y  z | ( x . y )' + ( x + y )'  " );
$monitor("%2b %2b %2b |    %2b" , x , y , z ,  s1);

// sinalizacao
#1 x=0; y=0; z=1;
#1 x=0; y=1; z=0;
#1 x=0; y=1; z=1;
#1 x=1; y=0; z=0;
#1 x=1; y=0; z=1;
#1 x=1; y=1; z=0;
#1 x=1; y=1; z=1;

end
endmodule // test_module
/*
teste :  

Guia-04 - Diego Da Silva Ferreira - 71 06 78 
Expressão : ( x . y )' + ( x + y )' 
 
 x  y  z | ( x . y )' + ( x + y )'  
 0  0  0 |     1
 0  0  1 |     1
 0  1  0 |     1
 0  1  1 |     1
 1  0  0 |     1
 1  0  1 |     1
 1  1  0 |     0
 1  1  1 |     0

*/
