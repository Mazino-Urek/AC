/*
   Guia_0201
   Nome: Diego Da Silva Ferreira
   Matricula: 71 06 78
 */
module Guia_0201;
// define data
real x      = 0 ; // decimal
real power2 = 1.0; // power of 2
integer y   = 4 ; // counter
integer yy  = 4 ;
real it  = 0.0;
reg [7:0]b[4:0]; 

// actions
initial
begin : main

    $display ( "Guia_0201" );

    b[4] = 8'b00011011; 
    b[3] = 8'b00001110;
    b[2] = 8'b00001001;
    b[1] = 8'b00101011;
    b[0] = 8'b01110010;

    while ( yy >= 0 )
    begin
        while ( y >= 0 )
        begin
            power2 = power2 / 2.0;

            if ( b[yy][y] == 1 )
            begin
            x = x + power2;
            end //end if

            y=y-1;

        end // end while

        it = b[yy][7:5];
        x = it + x;
        $display ("%f", x);
        power2 = 1.0;
        x = 0;
        y = 4;
        yy = yy - 1;
    end // end while
end // main
    endmodule // Guia_0201

/*
teste:
resultados:
Guia_0201
0.843750
0.437500
0.281250
1.343750
3.562500

*/
