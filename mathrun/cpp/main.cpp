#include <cstdio>

int main(){
	float x = 0.0f;
	float y = 0.0f;
	float z = 0.0f;
	int dim = 0;
	int offset = 0;
	
	for (int j = 0; j < 6; j++){
		for (int i = 0; i < 12; i++){
			x += 1;
			y += x;
			z *= (x*y);
		}
		dim = (x + y);
		offset = x * dim;
		z = dim + (2/dim);

		printf("%f %f %f %d %d\n",x,y,z,dim,offset);
	}
}
