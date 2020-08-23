
/*
Autor: Diego Da Silva Ferreira
Matricula: 71 06 78

 */


public class bin2dec {

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
	
	String[] A = new String[5];
	A[0] = "10101";
	A[1] = "10110";
	A[2] = "101101";
	A[3] = "111011";
	A[4] = "111001";
	
	for(int s = 0; s < A.length; s++){
		System.out.println((int) bim2dec(A[s]));
	}

}
}
