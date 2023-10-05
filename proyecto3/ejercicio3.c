#include <stdio.h>

int main() {
    int x;
    printf("Ingrese un valor para x\n");
    scanf("%d",&x);
    
    x=5;
    printf("x=%d",x);
    
    return 0;
}
/*
    Ejecucion 1, Ingrese un valor para x
    usuario ingrsa un 3
    produce salida x=5
    Ejecucion 2, Ingrese un valor para x
    usuario ingrsa un -2
    produce salida x=5
    Ejecucion 3, Ingrese un valor para x
    usuario ingrsa un 12
    produce salida x=5
*/