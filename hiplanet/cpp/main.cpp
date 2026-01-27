#include <iostream>

int main(int argc,char *argv[]){
	std::cout << "Hi Planet\n";
	if (argc > 1) {
		std::cout << "Also passed with " << argv[1] << '\n'; 
	}
	return 0;
}
