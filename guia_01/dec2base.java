/*

Autor: Diego Da Silva Ferreira
Matricula: 71 06 78

*/

public class dec2base{

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

public static void main(String[] args){

	conversor(4,  71);
	System.out.println();
	conversor(8,  43);
	System.out.println();
	conversor(16, 67);
	System.out.println();
	conversor(16, 175);
	System.out.println();
	conversor(16, 151);
	System.out.println();

}
}
