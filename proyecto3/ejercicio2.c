#include <stdio.h>

int main () {
    int x,y,z,b,w;
    printf("Ingrese valor para x\n");
    scanf("%d", &x);
    
    printf("Ingrese valor para y\n");
    scanf("%d", &y);
    
    printf("Ingrese valor para z\n");
    scanf("%d", &z);
    
    printf("Ingrese valor para b\n");
    scanf("%d", &b);
    
    printf("Ingrese valor para w\n");
    scanf("%d", &w);

    printf("x %% 4 == 0, si x=%d; entonces %d\n", x, x % 4 == 0);
    printf("x + y == 0 && y - x == (-1) * z; si x=%d, y=%d,z=%d, entonces %d\n",x,y,z,x + y == 0 && y - x == (-1) * z);
    printf("not b && w; si b=%d y w=%d, entonces %d\n", b,w, !b && w);
    
    return 0;
}
/*
x % 4 == 0, si x=4; entonces 1
x + y == 0 && y - x == (-1) * z; si x=4, y=-4,z=8, entonces 1
not b && w; si b=1 y w=1, entonces 0
*/