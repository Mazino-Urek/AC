/*
* nome: Diego S. F.
* 
* */


module jkff ( output q, output qnot,
              input j, input k,
	      input clk, input preset, 
	      input clear );
	
      reg q, qnot;
	
	always @( posedge clk or preset or clear )
	begin
		if ( clear )
		begin 
			q <= 0; 
			qnot <= 1; 
		end
		else
			if ( preset ) 
			begin 
				q <= 1; 
				qnot <= 0; 
			end
			else
				if ( j & ~k ) 
				begin 
					q <= 1; 
					qnot <= 0; 
				end
				else
					if ( ~j & k ) 
					begin 
						q <= 0; 
						qnot <= 1; 
					end
					else
						if ( j & k )
						begin 
							q <= ~q; 
							qnot <= ~qnot; 
						end
	end
endmodule // jkff

module ram (output y, input rw, input clk, input clear, input endereco, input inp);

	wire end1, out, out2, notinp;

	and ed (end1, rw, clk, endereco);

	not(notinp, inp);
	
	jkff jjkk (out1, out2, inp, notinp, end1, 1'b0 , clear);

	and (y, out1, endereco);


endmodule

module ram1x4 (output [3:0]y, input rw, 
	       input clk, input clear, 
	       input endereco, input [3:0]inp );


       ram ram1(y[0], rw, clk, clear, endereco, inp[0]);
       ram ram2(y[1], rw, clk, clear, endereco, inp[1]);
       ram ram3(y[2], rw, clk, clear, endereco, inp[2]);
       ram ram4(y[3], rw, clk, clear, endereco, inp[3]);

endmodule


module principal;

	reg  [3:0]inp;
	wire [3:0]out;
	reg clk, rw, clear, endereco;

	ram1x4 ram1 (out, rw, clk, clear, endereco, inp);

	initial
	begin : main 

		//valores iniciais
		#1 clk = 1;
		#1 rw = 1;
		#1 clear = 0;
		#1 endereco = 1;
		#10 inp = 4'b1101;

		#10 rw = 0;

		$display("clk = %b", clk);
		$display("rw = %b" , rw);
		$display("ende = %b" , endereco);
		$display("clear = %b" , clear);
		$display("in = %4b" , inp);
		$display("out = %4b" , out);

		#5 $finish;

	end 

	always
	#5 clk = ~clk;

endmodule
