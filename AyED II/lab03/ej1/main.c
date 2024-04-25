#include <stdlib.h>
#include <stdio.h>
#include "helpers.h"
#define MAX_SIZE 1000

static void dump(char a[], unsigned int length) {
    printf("\"");
    for (unsigned int j=0u; j < length; j++) {
        printf("%c", a[j]);
    }
    printf("\"");
    printf("\n\n");
}

void print_help(char *program_name) {
    /* Print the usage help of this program. */
    printf("Usage: %s <path/to/file.in>\n\n"
        "Loads a file from its path and prints it on the screen.\n"
        "The input file must have the following format:\n"
        "Each line must consist of an integer and a letter, matching the pattern described below:\n\n"
        "<integer> -> *<letter>*\n\n"
        "Then, every following pair of integer and letter must be wrote in a new line.\n"
        "Finally, the file should look like this:\n\n"
        "<integer 1> -> *<letter 1>*\n"
        "<integer 2> -> *<letter 2>*\n"
        "(...)\n"
        "<integer n> -> *<letter n>*\n",program_name);
}

char *parse_filepath(int argc, char *argv[]) {
    /* Parse the filepath given by command line argument. */
    char *result = NULL;

    if (argc < 2) {
        print_help(argv[0]);
        exit(EXIT_FAILURE);
    }

    result = argv[1];

    return result;
}

int main(int argc, char *argv[]) {
    char *path = NULL;
    unsigned int indexes[MAX_SIZE];
    char letters[MAX_SIZE];
    char sorted[MAX_SIZE];
    unsigned int length; 

    path = parse_filepath(argc, argv);

    length=data_from_file(path,indexes,letters,MAX_SIZE);
    
    for (unsigned int i = 0; i < length; i++){
        sorted[indexes[i]]= letters[i];
    }
    
    dump(sorted, length);

    return EXIT_SUCCESS;
}

