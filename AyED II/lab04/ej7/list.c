#include <assert.h>
#include <stdlib.h>
#include <stdbool.h>

#include "list.h"

struct _list{
    list_elem elem;
    list next;
};


list empty(void){
    list l=NULL;
    return l;
}


list addl(list l,list_elem e){
    list p=NULL;
    p=malloc(sizeof(list));
    p->elem= e;
    p->next= l;
    l=p;
    return l;
}

bool is_empty(list l){
    bool b= l==NULL;
    return b;
}

list_elem head(list l){
    return l->elem;
}

list tail(list l){
    list p=NULL;
    p=l;
    l=l->next;
    free (p);
    return l;
}

list addr(list l,list_elem e){
    list p=NULL,q=NULL;
    q=malloc(sizeof(list));
    q->elem= e;
    q->next=NULL;
    if(!is_empty(l)){
        p=l;
        while(p->next!=NULL){
            p=p->next;
        }
        p->next=q;
    }else{
        l=q;
    }
    return l;
}


int list_length(list l){
    list p=NULL;
    int i=0;
    p=l;
    if (!is_empty(l)){
        while (p!=NULL){
            i=i+1;
            p=p->next;
        }
    }
    return i;
}

list concat(list l, list l0){
    list p=l;
    while (p!=NULL){
        p=p->next;
    }
    p->next=l0;
    return l;
}

list_elem index(list l,int n){
    list p=l;
    list_elem e;
    if (list_length(l)>n){
        for (int i = 1; i < n; i++){
            p=p->next;
        }
        e=p->elem;     
    }
    return e;
}

list take(list l, int n){
    list p = NULL, q = NULL;
    int i = 1;

    if (list_length(l) >= n) {
        p=l;
        while (i < n) {
            p = p -> next;
            i++;
        }
        q=p->next;
        p->next = NULL;
        list_distroy(q);
    }
    return l;
}

list drop(list l,int n){
    list p=NULL;
    for (int i = 0; i < n; i++){
        p=l;
        l=p->next;
        free(p);
    }
    return l;
}


list copy_list(list l){
    list q=NULL,p=NULL;
    list_elem e;
    p=l;
    if (!is_empty(l)){
        for (int i = 0; i < list_length(l); i++){
            e=p->elem;
            q=addr(q,e);
            p=p->next;
        }
    }else{
        q=empty();
    }
    return q;
}

list list_distroy(list l){
    list p=NULL;
    if (!is_empty(l)){
        p=l;
        while (p->next!=NULL){
            l=p->next;
            free(p);
            p=l;
        }
    }
    return l;
}