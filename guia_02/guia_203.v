/*
Guia_0203
Nome: Diego Da Silva Ferreira
Matricula: 71 06 78
*/
module Guia_0203;
// define data

reg [7:0]b[4:0]; // binary
// actions
initial
begin : main
    b[4] = 8'b11110000;
    b[3] = 8'b10100100;
    b[2] = 8'b10111000;
    b[1] = 8'b01_111010;
    b[0] = 8'b1001_1011;

    $display ("Guia_0203");
    $display ("0.%8b = 0.%o%o (8)" , b[3] ,b[3][7:5], b[3][4:2]);
    $display ("0.%8b = 0.%x%x (16)" , b[2] , b[2][7:4] , b[2][3:0]);
    $display ("1.%6b = %o.%o%o (8)" , b[1][5:0] , b[1][7:6] , b[1][5:3] , b[1][2:0] );
    $display ("%4b.%4b = %x.%x (16)" , b[0][7:4] , b[0][3:0] , b[0][7:4] , b[0][3:0]);
end // main
endmodule // Guia_0203
/*
teste:
0.10100100 = 0.51 (8)
0.10111000 = 0.b8 (16)
1.111010 = 1.72 (8)
1001.1011 = 9.b (16)


*/
