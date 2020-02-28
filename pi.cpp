#include<stdio.h>
#include<stdlib.h>

int inside_circle(int x, int y, int radius){
	if(x*x+y*y < radius*radius){
		return 1;
	}
	else{
		return -1;
	}
}

int main(){
	int x, y, iter, radius, i, count;
	float num_inside;
	char c;
	
	while(1){
		printf("\nEnter 'S' to stop else type any  to continue: ");
		scanf(" %c", &c);
		if((int)c == 83){
			printf("Ending the process\n");
			break;
		}
		
		printf("Enter the radius and number of iterations:\n");
		scanf("%d %d", &radius, &iter);
		count = 0;
		
		for(i = 0; i < iter; i++){
			x = -1*radius + rand()%(2*radius);
			y = -1*radius + rand()%(2*radius);
			if(inside_circle(x,y,radius) == 1){
				count++;
			}
		}
		
		num_inside = (float)count/iter;
		printf("The value of pi for radius = %d and iterations = %d is %f", radius, iter, num_inside*4);
	}
	return 0;
}
