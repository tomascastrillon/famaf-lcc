#include <stdio.h>
    
int main(){
    int y,x,z;
    printf("Ingrese valor para x\n");
    scanf("%d", &x);
    
    printf("Ingrese valor para y\n");
    scanf("%d", &y);
    
    printf("Ingrese valor para z\n");
    scanf("%d", &z);

    printf("Resultado de x + y + 1 = %d\n", x+y+1);
    printf("Resultado de z*z+y*45-15*x=%d\n", z*z+y*45-15*x);
    printf("Resultado de y - 2 == (x * 3 + 1) %% 5=%d\n", y - 2 == (x * 3 + 1) % 5);
    printf("Resultado de y / 2 * x=%d\n", y / 2 * x);
    printf("Resultado de y < x * z=%d\n", y < x * z);
    
    return 0;
}
/*
Con x=7 y=3 z=5+
Resultado de x + y + 1 = 11
Resultado de z*z+y*45-15*x=55
Resultado de y - 2 == (x * 3 + 1) % 5=0
Resultado de y / 2 * x=7
Resultado de y < x * z=1
*/

/*
Con x=1 y=10 z=8
Resultado de x + y + 1 = 12
Resultado de z*z+y*45-15*x=499
Resultado de y - 2 == (x * 3 + 1) % 5=0
Resultado de y / 2 * x=5
Resultado de y < x * z=0
*/