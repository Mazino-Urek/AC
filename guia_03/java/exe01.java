


public class exe01{

	/* 
	 * realiza o complemento em binario
	 * @param String in - binario a ser 
	 * @param int c - complemento
	 * @param int b - numero de bits
	 * @retunr String in - binario convertido
	 * */
	public static String coplementa(String in, int c , int b){

		String resp = "";
		int x;

		if(c == 1 || c == 2){
		
			for(int s = 0; s < (b - in.length());    ){
				
				resp += '0';
			}

			resp += in;
			in = "";

			for(int s = 0; s < resp; s++){
			
				if(resp.charAt(s) == 0){ in += '1';}
				else( in += '0';)
			}
			
					
		
		
		}
		return in;
	}




	public static void main(String[] args){

		String[] resp = new String[5];

		resp[] = "1001"; 
		resp[] = "1110";
		resp[] = "111011";
		resp[] = "10101";
		resp[] = "110001";
	
		System.out.println(complementa(resp[x] , 1 , 6 ));
		System.out.println(complementa(resp[x] , 1 , 8 ));
		System.out.println(complementa(resp[x] , 2 , 6 ));
		System.out.println(complementa(resp[x] , 2 , 7 ));
		System.out.println(complementa(resp[x] , 2 , 8 ));
		

	}
}

