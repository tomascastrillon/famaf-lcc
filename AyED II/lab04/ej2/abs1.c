#include <stdlib.h>
#include <stdio.h>

void absolute(int x, int y) {
    if (x>=0){
        y=x;
    }else{
        y=-x;
    } 
}

int main(void) {
    int a=0, res=0;
    a=-10;
    absolute(a,res);
    printf("%i\n",res);
    return EXIT_SUCCESS;
}

// El valor mostrado por pantalla es 0, No coincide en el lenguaje del teorico el resultado seria 10.
