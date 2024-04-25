#include <stdlib.h>
#include <limits.h>

#include "weather.h"
#include "weather_utils.h"

char* parse_month(int month) {
  char* months[MONTHS] = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };

  return months[month];
}

int min_temp_historic_cba(WeatherTable array){
    int min_temp= INT_MAX;

    for (int y = 0; y < YEARS; y++){
        for (int m = 0; m < MONTHS; m++){
            for (int d = 0; d < DAYS; d++){
                if (array[y][m][d]._min_temp<min_temp){
                    min_temp=array[y][m][d]._min_temp;
                }  
            }  
        }
    }
    return min_temp;
}

void max_temp_years(WeatherTable array,int maxtempyears[]){

    for (int y = 0; y < YEARS; y++){
        int max_temp=INT_MIN;
        for (int m = 0; m < MONTHS; m++){
            for (int d = 0; d < DAYS; d++){
                if (array[y][m][d]._max_temp>max_temp){
                    max_temp=array[y][m][d]._max_temp;
                }  
            }  
        }
        maxtempyears[y]=max_temp;
    }      
}

void max_rain_month_years(WeatherTable array,int months[]){
     for (int y = 0; y < YEARS; y++){
        int max_rain=INT_MIN;
        unsigned int mes;
    
        for (int m = 0; m < MONTHS; m++){
            int sum_rain=0;
            for (int d = 0; d < DAYS; d++){
                sum_rain=sum_rain+array[y][m][d]._rainfall;
            }  
            if (sum_rain>max_rain){
                max_rain=sum_rain;
                mes=m;
            }  
        }
        months[y]=mes;
    } 
}

void print_data(WeatherTable array){
    int min_temp;
    int max_temp_yearly[YEARS];
    int max_rain_months[YEARS];

    min_temp=min_temp_historic_cba(array);
    max_temp_years(array,max_temp_yearly);
    max_rain_month_years(array,max_rain_months);

    fprintf(stdout, "\nThe lowest temperature registered in Cordoba was: %i,%iºC\n", min_temp / 10, abs(min_temp % 10));
    for (int i = 0; i < YEARS; i++) {
      fprintf(stdout, "The highest temperature in %i was: %i,%iºC\n", FST_YEAR + i, max_temp_yearly[i] / 10, abs(max_temp_yearly[i] % 10));
    }
    for (int i = 0; i < YEARS; i++){
        fprintf(stdout, "The highest rainfall in %i was in %s\n", FST_YEAR + i, parse_month(max_rain_months[i]));
    }
    
}

