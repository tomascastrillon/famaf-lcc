#include "array_helpers.h"
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

unsigned int array_from_file(int array[],unsigned int max_size,const char *filepath) {
    unsigned int length;
    FILE *file = fopen(filepath,"r");
    fscanf(file,"%u",&length);
    if(length>max_size){
        printf("error");
        fclose(file);
        return length;
    }
    for (unsigned int i=0; i<length;i++){
        fscanf(file, "%d", &array[i]);
    }
    fclose(file);
    return length;
}   


void array_dump(int a[], unsigned int length) {
    printf("[");
    for(unsigned int i=0;i<length;i++){
        printf("%i",a[i]);
        if(i<4){
            printf(",");
        }
    }
    printf("]\n");
}

bool array_is_sorted(int a[], unsigned int length){
    bool sorted=true;
    unsigned int i=0;
    while((i<(length-1) && sorted)){
        if(a[i]>a[i+1]){
            sorted=false;
        }
        i=i+1;
    }
    return sorted;
}