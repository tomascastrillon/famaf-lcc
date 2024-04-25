#include <stdbool.h>
#include <assert.h>

#include "fixstring.h"

unsigned int fstring_length(fixstring s) {
    int lenght=0;
    for (int i = 0; s[i]!='\0'; i++){
        lenght++;
    }
    return lenght;
}


bool fstring_eq(fixstring s1, fixstring s2) {
    bool eq=false;
    if(s1==s2){
        eq=true;
    }
    return eq;
}


bool fstring_less_eq(fixstring s1, fixstring s2) {
    bool less=true;
    if (fstring_length(s1)>=fstring_length(s1)&& less){
        for (unsigned int i = 0; i < fstring_length(s2); i++){
            if(s1[i]!=s2[i]){
                less=s1[i]>=s2[i];
        }
    }
    }else{
        for (unsigned int i = 0; i < fstring_length(s1)&& less; i++){
            if(s1[i]!=s2[i]){
                less=s1[i]>=s2[i];
            }
        }
    }   
    return less;
}

