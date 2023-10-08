package utility;

import java.util.Random;

public class Numero {

	
	
	public static int generateNumber(int numMax) {
		
		Random rand = new Random();
		int newRandom = rand.nextInt(numMax + 1);
		
		return newRandom;
	}
	
}
