/*
 * Nome: Diego Da Siva Ferreira
 * Matricula: 71 06 78
 * 
 * v 1.0
 *
 * */

class Myclass {

	private String binario;
	private String base4;
	private String hexadecimal;
	private octal;


	void setbinario(String binario){

		this.binario = binario;

	}

	void setbase4 (String base4){

		this.base4 = base4;
	}

	void sethexadecimal(String hexadecimal){

		this.hexadecimal = hexadecimal;
	}

	void setoctal (Strinng octal){

		this.octal = octal;
	} 



















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

	String conversor (int base , int x){

		int z = 0;
		string resp = "";

		if(x >= base){
			conversor(base, x/base);
			z = x%base;
			if(z < 10){
				resp += Interger.parseInt(z);
			}
			else{
				resp += converte(z);
			}
		}
		else{
			if(x < 10){
				resp += Interger.parseInt(x);
			}
			else{
				resp += converte(x);
			}
		}

		return resp;
	}





}

