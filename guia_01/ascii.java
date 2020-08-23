/*

Autor: Diego Da Silva Ferreira
Matricula: 71 06 78

*/

public class ascii {


public static int[] octodec (String[] x){

	int p = x.length;
	int[] r = new int[p];
	double resp = 0;
	int f;
	

	for(int a = 0 ; a < x.length; a++){
		f = x[a].length() -1 ;
		for(int s = 0; s < x[a].length(); s++){
			resp = resp + (Character.getNumericValue(x[a].charAt(f)) * Math.pow(8, s)); 
			f--;
		}
		r[a] = (int) resp;
		resp = 0;
	
	}	

	return r;

}



public static void print (int[] x){

	for(int s = 0; s < x.length; s++){
		System.out.print(x[s] + " ");
	}
	System.out.println();
}


public static int[] ascii (String x){

	int c = x.length();
	int[] n = new int[c];	 

	for(int s = 0; s < c; s++){
		n[s] = (int) x.charAt(s);
	}
	return n;

}

public static void main (String[] args){

	int[] x;
	String[] g = new String[5];

	x = ascii("PUC-Minas");
	print(x);	
	
	x = ascii("2020-2");
	print(x);

	x = ascii("Brasil");
	print(x);

	g[0] = "116";
	g[1] = "157";
	g[2] = "151";
	g[3] = "164";
	g[4] = "145";
	x = octodec(g);
	x = ascii("" + x[0] + x[1] + x[2] + x[3] + x[4]);
	print(x);

	x = new int[7];
	x[0] = Integer.parseInt("42", 16);
	x[1] = Integer.parseInt("2E", 16);
	x[2] = Integer.parseInt("48", 16);
	x[3] = Integer.parseInt("2E", 16);
	x[4] = Integer.parseInt("2D", 16);
	x[5] = Integer.parseInt("4D", 16);
	x[6] = Integer.parseInt("47", 16);
	x = ascii("" + x[0] + x[1] + x[2] + x[3] + x[4] + x[5] + x[6]);
	print(x);


}

}
