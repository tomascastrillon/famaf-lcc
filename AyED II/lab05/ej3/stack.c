#include <stdlib.h>
#include <assert.h>
#include "stack.h"

struct _s_stack {
    stack_elem *elems;      // Arreglo de elementos
    unsigned int size;      // Cantidad de elementos en la pila
    unsigned int capacity;  // Capacidad actual del arreglo elems
};

bool invrep(stack s){
    return s!=NULL && s->elems!=NULL;
}

stack stack_empty(){
    stack s=malloc(sizeof(struct _s_stack));
    s->elems=NULL;
    s->size=0;
    s->capacity=0;
    return s;
}

stack stack_push(stack s, stack_elem e){
    if(s->elems==NULL){
        s->capacity=1;
        s->elems=calloc(1,sizeof(stack_elem));
    }if (s->size==s->capacity){
        s->capacity*=2;
        s->elems=realloc(s->elems, s->capacity *sizeof(stack_elem));
    }
    for (unsigned int i = s->size; i > 0; i--){
        s->elems[i]=s->elems[i-1];
    }
    s->elems[0]=e;
    s->size++;
    return s;
}

stack stack_pop(stack s){
    assert(invrep(s));
    for (unsigned int i = 0; i < s->size-1; i++){
        s->elems[i]=s->elems[i+1];
    }
    s->size--;
    return s;
}

unsigned int stack_size(stack s){
    return s->size;
}

stack_elem stack_top(stack s){
    assert(!stack_is_empty(s));
    stack_elem e=s->elems[0];
    return e; 
}

bool stack_is_empty(stack s){
    return s->size==0;
}


stack_elem *stack_to_array(stack s){
    stack st=s;
    stack_elem *stack_array=NULL;
    if (!stack_is_empty(s)){
        stack_array=calloc(s->size,sizeof(stack_elem));
        for (int i = (s->size-1); i >= 0; i--){
            stack_array[i]=st->elems[i];
        }
    }
    return stack_array;
}

stack stack_destroy(stack s){
    free(s->elems);
    free(s);
    return s;
}
