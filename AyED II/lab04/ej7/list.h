#include <stdlib.h>

typedef int list_elem;
typedef struct _list * list;

/** @brief Crea una lista vacia */
list empty(void);

/** @brief Agrega el elemento e al comienzo de la lista l */
list addl(list l,list_elem e);

/** @brief Devuelve true si l es vacia */
bool is_empty(list l);

/** @brief Devuelve el primer elemento de la lista l */
list_elem head(list l);

/** @brief Elimina el primer elemento de la lista l */
list tail(list l);

/** @brief Agrega el elemento e al final de la lista */
list addr(list l,list_elem e);

/** @brief Nos devuelve el largo de la lista l */
int list_length(list l);

/** @brief Agrega al final de l todos los elementos de l0 en el mismo orden*/
list concat(list l, list l0);

/** @brief Devuelve el n-esimo elemento de l */
list_elem index(list l,int n);

/** @brief Deja en l solo los primeros n elementos eliminado el resto */
list take(list l, int n);

/** @brief Elimina los primeros n elementos de l*/
list drop(list l,int n);

/** @brief Copia todos los elementos de l en una lista l1 */
list copy_list(list l);

/** @brief Libera memoria en caso que sea necesario */
list list_distroy(list l);