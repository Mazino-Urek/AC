/*

Nome: Diego Da silva Ferreira
Matricula: 71 06 78

*/

module fsm1 ( y , x, clk, reset );
	output [2:0] y;
	input x;
	input clk;
	input reset;
	reg [2:0] y;
	parameter

	// state identifiers
	start = 3'b000,
	id1 =   3'b001,
	id11 =  3'b010,
	id110 = 3'b011,
	final = 3'b100;
	reg [2:0] E1; // current state variables
	reg [2:0] E2; // next state logic output

	// next state logic
	always @( x or E1 )
	begin
		case ( E1 )
		start:
			if ( x )
			begin
				E2 = start;
				y  = start; 
			end
			else
			begin
				E2 = id1;
				y  = id1;
			end
		id1:
			if ( x )
			begin
				E2 = id11;
				y  = id11;
			end
			else
			begin
				E2 = id1;
				y  = id1;
			end
		id11:
			if ( x )
			begin
				E2 = start;
				y  = start;
			end
			else
			begin
				E2 = id110;
				y  = id110;
			end
		id110:
			if ( x )
			begin
				E2 = final;
				y  = final;
			end
			else
			begin
				E2 = id1;
				y  = id1;
			end
		final:
		begin
			E2 = final;
			y  = final;
		end
		default: // undefined state
			E2 = 2'bxx;
		endcase
	end // always at signal or state changing

	// state variables
	always @( posedge clk or negedge reset )
	begin
		if ( reset )
			E1 = E2; // updates current state
		else
			E1 = 0; // reset
	end // always at signal changing
endmodule // mealy_1101


module principal;
	reg clk, reset, x;
	wire [2:0] m1;

	fsm1 teste ( m1 , x, clk, reset );

	initial
	begin
		$display ( "Time    X  Estado ");

		// initial values
		clk = 1;
		reset = 0;
		 x = 0;
	
		// input signal changing
		#5 reset = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#5 $finish;
		end // initial
	
		always
		#5 clk = ~clk;

		always @( posedge clk )
		begin
			$display ( "%4d %4b    q%d", $time, x, m1 );
		end // always at positive edge clocking changing
endmodule // Exemplo_1102
/*

Time    X  Estado 
  10    0    q1
  20    1    q2
  30    0    q3
  40    1    q4
  50    0    q4
  60    1    q4
  70    0    q4
  80    1    q4
  90    0    q4
 100    1    q4
 110    0    q4

*/
