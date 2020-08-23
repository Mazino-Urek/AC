/*
   Guia_0202
   Nome: Diego Da Silva Ferreira
   Matricula: 71 06 78
 */
module Guia_0202;
// define data
real x[4:0]; // decimal
integer xx = 0;

integer y = 7 ; // counter
integer yy = 4;

reg [7:0]b[4:0]; // binary
reg [7:0]bb[4:0];
// actions

initial
begin : main
    $display ( "Guia_0202 - Tests" );

    x[4] = 0.625;
    x[3] = 0.8125;
    x[2] = 1.75;
    x[1] = 3.25;
    x[0] = 14.015625; 
  

    while (yy >= 0)
    begin
        
        xx = x[yy];
        if(xx > x[yy])
        begin
            xx = xx - 1;
        end // end if

        bb[yy] = xx;
        x[yy] = x[yy] - xx;  
        b[yy] = 0;
        while ( x[yy] > 0 && y >= 0 )
        begin
            if ( x[yy]*2.0 >= 1 )
            begin
            b[yy][y] = 1;
            x[yy] = x[yy]*2.0 - 1.0;
            end
        
            else
            begin
            b[yy][y] = 0;
            x[yy] = x[yy]*2.0;
            end // end if

        
            y=y-1;
        end // end while
        $display ("%8b.%8b" , bb[yy] , b[yy]);
        y = 7;
        yy = yy - 1;
    end // end while

end // main
endmodule // Guia_0202

/*
teste:

Guia_0202 - Tests
00000000.10100000
00000000.11010000
00000001.11000000
00000011.01000000
00001110.00000100


*/

