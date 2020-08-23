/*

Autor: Diego Da Silva Ferreira
Matricula: 71 06 78

*/

public class bin2base {

public static char converte (int x ){

	char resp;

	if(x == 10){ resp = 'A';}
	else{
		if(x == 11){ resp = 'B';}
		else{
			if(x == 12){ resp = 'C';}
			else{
				if(x == 13){ resp = 'D';}
				else{
					if(x == 14){ resp = 'E';}
					else{
						resp = 'F';
					}
				}
			}
		}
	}
	
	return resp;
}

public static void conversor (int base , int x){

	int z = 0;

	if(x >= base){
		conversor(base, x/base);
		z = x%base;
		if(z < 10){
			System.out.print(z);
		}
		else{
			System.out.print(converte(z));
		}
	}
	else{
		if(x < 10){
			System.out.print(x);
		}
		else{
			System.out.print(converte(x));
		}
	}

}


public static double bim2dec (String x){

	double resp = 0;
	int f = x.length() - 1;

	for(int s = 0; s < x.length(); s++){
		resp = resp + (Character.getNumericValue(x.charAt(f)) * Math.pow(2, s)); 
		f--;
	}	
	return resp;

}



public static void main (String[] args){

	conversor(4, (int) bim2dec("10111"));
	System.out.println();
	conversor(8, (int) bim2dec("10011"));
	System.out.println();
	conversor(16 , (int) bim2dec("101101"));
	System.out.println();
	conversor(8 , (int) bim2dec("100101"));
	System.out.println();	
	conversor(4 , (int) bim2dec("101111"));
	System.out.println();
}

}
