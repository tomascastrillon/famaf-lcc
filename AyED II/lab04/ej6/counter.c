#include <stdbool.h>
#include <stdlib.h>
#include <assert.h>

#include "counter.h"

struct _counter {
    unsigned int count;
};

counter counter_init(void) {
    counter c;
    c=malloc(sizeof(counter));
    c->count=0;
    return c;
}

void counter_inc(counter c) {
    c->count=c->count+1u;
}

bool counter_is_init(counter c) {
    return c->count==0u; 
}

void counter_dec(counter c) {
    assert(!counter_is_init(c));
    c->count=c->count-1u;    
}

counter counter_copy(counter c) {
    counter copy;
    copy=malloc(sizeof(counter));
    copy->count=c->count;
    return copy;
}

void counter_destroy(counter c) {
    free(c);
}
