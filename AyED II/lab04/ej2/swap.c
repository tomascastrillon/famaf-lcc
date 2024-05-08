#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

void swap(int *a, int *b) {
    int aux;
    aux=*a;
    *a=*b;
    *b=aux;
}

int main(void) {
    int x, y; 
    x=6;
    y=4;
    printf("%i,%i\n",x,y);
    swap(&x,&y);
    printf("%i,%i\n",x,y);
    return EXIT_SUCCESS;
}