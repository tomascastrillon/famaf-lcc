#include <stdbool.h>
#include <stdlib.h>

size_t string_length(const char *str){
    size_t length=0;
    for (int i = 0; str[i]!='\0'; i++){
        length++;
    }
    return length;
}

char *string_filter(const char *str, char c){
    char *string=malloc(sizeof(char)*string_length(str));
    int j=0;
    for (int i = 0; str[i]!='\0'; i++){
        if(c!=str[i]){
            string[j]=str[i];
            j++;
        }
    }
    return string;
}

bool string_is_symmetric(const char *str){
    bool b=true;
    int j=string_length(str)-1;
    for (int i = 0; i!=string_length(str)/2 && b; i++){
        if(str[i]!=str[j]){
            b=false;
        }
        j--;
    }
    return b;
}
