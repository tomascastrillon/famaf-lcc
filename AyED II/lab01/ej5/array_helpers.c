#include "array_helpers.h"
#include <stdio.h>
#include <stdlib.h>
#include "mybool.h"

unsigned int array_from_file(int array[],unsigned int max_size,const char *filepath) {
    unsigned int length;
    FILE *file = fopen(filepath,"r");
    fscanf(file,"%u",&length);
    if(length>max_size){
        printf("error");
        fclose(file);
    }else{
        for (unsigned int i=0; i<length;i++){
            fscanf(file, "%d", &array[i]);
        }
    fclose(file);
    }
    return length;
}   

void array_dump(int a[], unsigned int length) {   

    if (length<100000){    
    printf("[");
    for(unsigned int i=0;i<length;i++){
        printf("%i",a[i]);
        if(i<(length-1)){
            printf(",");
        }
    }
    printf("]\n");
    }
    else{
        printf("El arreglo es mayor al tam maximo asignado.\n");
    }
}


mybool array_is_sorted(int a[], unsigned int length){
    mybool sorted=true;
    unsigned int i=0;
    while((i<(length-1) && sorted)){
        if(a[i]>a[i+1]){
            sorted=false;
        }
        i=i+1;
    }
    return sorted;
}