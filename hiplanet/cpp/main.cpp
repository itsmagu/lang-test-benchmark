#include <cstdio>

int main(int argc,char *argv[]){
	printf("Hi Planet");
	if (argc > 1) {
		printf("\nAlso passed with %s",argv[1]);
	}
	return 0;
}
