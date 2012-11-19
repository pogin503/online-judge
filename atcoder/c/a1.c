/* #include "stdio.h" */
/* #define printf_d(x) printf("%s = %d",#x,(x)) */
/* #define printf_str(x) printf("%s = %s",#x,(x)) */
#include "stdio.h"
#include "string.h"
int main(){
    int total;
    char value[100];
    char *p; 
    int a=0,b=0,c=0,d=0,f=0,i;
 
    scanf("%d",&total);
    scanf("%s",value);
    
    p = value;
    
    for(i=0;i<total;i++){
        if(strncmp(p,"A",1) == 0)a++;
        else if(strncmp(p,"B",1) == 0)b++;
        else if(strncmp(p,"C",1) == 0)c++;
        else if(strncmp(p,"D",1) == 0)d++;
        else f++;
        p++;
    }
    printf("%.14lf\n",(double)(a*4+b*3+c*2+d*1+f*0) / (long double)total);
}

