package utility;

import java.util.Random;

public class Numero {

	
	//Esta clase nos permite generar un numero random entre 0 y el pasado por parámetro
	
	public static int generateNumber(int numMax) {
		
		Random rand = new Random();
		int newRandom = rand.nextInt(numMax + 1);
		
		return newRandom;
	}
	
}
