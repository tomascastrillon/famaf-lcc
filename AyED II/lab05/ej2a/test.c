#include <stdlib.h>
#include <stdio.h>
#include "stack.h"

int main(void){
    stack s=stack_empty();
    s=stack_push(s,4);
    s=stack_pop(s);
    s=stack_push(s,5);
    stack_elem *a=stack_to_array(s);
    for(int i=0 ; i < stack_size(s) ; i++ ) {
      printf("%d ",a[i]);
    }
    printf("%u\n",stack_size(s));
    free(a);
    stack_destroy(s);
    return 0;
}
