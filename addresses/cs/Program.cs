using System;

public static class Program{
	public static void Main(string[] args){
		Console.WriteLine("Hi Planet");
		if (args.Length > 0) {
			Console.WriteLine($"Also passed with {args[0]}");
		}
	}
}
