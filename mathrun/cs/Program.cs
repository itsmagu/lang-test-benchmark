using System;
using static System.Console;

public static class Program{
	public static void Main(string[] args){
		float x = 0;
		float y = 0;
		float z = 0;
		int dim = 0;
		int offset = 0;
for (int j = 0; j < 6;j++){
		for (int i = 0; i < 12;i++){
			x++;
			y+=x;
			z*=(x*y);
		}
		dim = (int)(x + y);
		offset = (int)(x * dim);
		z = dim + (2/dim);

		WriteLine($"{x} {y} {z} {dim} {offset}");
}
	}
}
