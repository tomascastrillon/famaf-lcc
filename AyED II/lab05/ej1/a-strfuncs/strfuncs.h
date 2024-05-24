#include <stdbool.h>

/** @brief Develve la lognitud de la cadena apuntada */
size_t string_length(const char *str);

/** @brief Develve una nueva cadena tomando los caracteres distintos a c */
char *string_filter(const char *str, char c);

/** @brief Indica si la cadena apuntada por str es simetrica */    
bool string_is_symmetric(const char *str);