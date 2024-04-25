#include <stdio.h>
#include <stdlib.h>


unsigned int data_from_file(const char *path,
                            unsigned int indexes[],
                            char letters[],
                            unsigned int max_size){
    FILE *file;
    int ultimo_index;

    file = fopen(path, "r");
    ultimo_index=0;

    if (file == NULL) {
        fprintf(stderr, "File does not exist.\n");
        exit(EXIT_FAILURE);
    }

    while (feof(file)==0) {
        unsigned int index;
        char letter;

        fscanf(file,"%u -> *%c*\n",&index, &letter);

        if (index>max_size){
            fprintf(stderr, "Allowed size is %d.\n", max_size);
            exit(EXIT_FAILURE);
        }

        indexes[ultimo_index]= index;
        letters[ultimo_index]= letter;
        
        ultimo_index++;
    }

    fclose(file);
    return ultimo_index;
}