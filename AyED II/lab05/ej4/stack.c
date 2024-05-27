#include <stdlib.h>
#include <assert.h>
#include "stack.h"

struct _s_stack{
    stack_elem elem;
    stack previous;
};

bool invrep(stack s){
    bool b= s!=NULL;
    return b;
}

stack stack_empty(){
    stack s=NULL;
    return s;
}

stack stack_push(stack s, stack_elem e){
    stack st=NULL;
    st=malloc(sizeof(struct _s_stack));
    st->elem=e;
    st->previous=s;
    s=st;
    return s;
}

stack stack_pop(stack s){
    assert(invrep(s));
    stack st=s;
    s=s->previous;
    st->previous=NULL;
    free(st);
    return s;
}

unsigned int stack_size(stack s){
    unsigned int size=0;
    stack st=s;
    for (size_t i = 0; st!=NULL; i++){
        size++;
        st=st->previous;
    }
    return size;
}

stack_elem stack_top(stack s){
    assert(s!=NULL);
    stack_elem e=s->elem;
    return e; 
}

bool stack_is_empty(stack s){
    bool b= s==NULL;
    return b;
}


stack_elem *stack_to_array(stack s){
    stack st=s;
    stack_elem *stack_array=NULL;
    if (!stack_is_empty(s)){
        stack_array=calloc((stack_size(s)-1),sizeof(stack_elem));
        for (int i = (stack_size(s)-1); i >= 0; i--){
            stack_array[i]=st->elem;
            st=st->previous;
        }
    }
    return stack_array;
}

stack stack_destroy(stack s){
    stack st=NULL;
    if (!stack_is_empty(s)){
        st=s;
        while (st!=NULL){
            s=st->previous;
            free(st);
            st=s;
        }
    }
    return s;
}