/* First, the standard lib includes, alphabetically ordered */
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

/* Maximum allowed length of the array */
#define MAX_SIZE 100000

void print_help(char *program_name) {
    /* Print the usage help of this program. */
    printf("Usage: %s <input file path>\n\n"
           "Loads an array given in a file in disk and prints it on the screen."
           "\n\n"
           "The input file must have the following format:\n"
           " * The first line must contain only a positive integer,"
           " which is the length of the array.\n"
           " * The second line must contain the members of the array"
           " separated by one or more spaces. Each member must be an integer."
           "\n\n"
           "In other words, the file format is:\n"
           "<amount of array elements>\n"
           "<array elem 1> <array elem 2> ... <array elem N>\n\n",
           program_name);
}

unsigned int array_from_file(int array[],unsigned int max_size) {
    unsigned int length;
    FILE *file = stdin;
    fscanf(file,"%u",&length);
    if(length>max_size){
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
    printf("\n[");
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

int main() {
     /* create an array of MAX_SIZE elements */
    int array[MAX_SIZE];
    
    /* parse the file to fill the array and obtain the actual length */
    unsigned int length = array_from_file(array, MAX_SIZE);
    
    array_dump(array, length);
    return EXIT_SUCCESS;
}
