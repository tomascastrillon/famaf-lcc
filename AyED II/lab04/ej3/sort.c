/*
  @file sort.c
  @brief sort functions implementation
*/

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.h"
#include "sort.h"
#include "player.h"

bool goes_before(player_t x, player_t y){
    bool b= x->rank<=y->rank;
    return b;
}

void swap(player_t atp[], unsigned int i, unsigned int j) {
    player_t temp = atp[i];
    atp[i] = atp[j];
    atp[j] = temp;
}
static unsigned int partition(player_t atp[], unsigned int izq, unsigned int der) {
    unsigned int pivot= izq;
    unsigned int i=izq+1;
    unsigned int j=der;

    while (i<=j){
        if (goes_before(atp[i],atp[pivot])){
            i++;
        }else if (goes_before(atp[pivot],atp[j])){
            j--;
        }else if (goes_before(atp[pivot],atp[i])&&goes_before(atp[j],atp[pivot])){
            swap(atp,i,j);
            i++;
            j--;
        }    
    }
    swap(atp,pivot,j);
    pivot=j;
    return pivot;   
}

static void quick_sort_rec(player_t atp[], unsigned int izq, unsigned int der) {
     if (der>izq){
        unsigned int pivot=partition(atp,izq,der);
        quick_sort_rec(atp,izq,(pivot==0u)? 0u:pivot-1);
        quick_sort_rec(atp,pivot+1,der);
    }   
}

bool array_is_sorted(player_t atp[], unsigned int length) {
    unsigned int i = 1u;
    while (i < length && goes_before(atp[i - 1u], atp[i])) {
        i++;
    }
    return (i == length);
}

void sort(player_t a[], unsigned int length) {
    quick_sort_rec(a, 0, (length == 0) ? 0 : length - 1);
}

