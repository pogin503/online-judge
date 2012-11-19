#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include "stdio.h"
#include "stdlib.h"
#define FOR(i,a,b) for(int i=(a);i<(b);++i)
#define REP(i,n)  FOR(i,0,n)
#define dump(x)  cerr << #x << " = " << (x) << endl;
#define debug(x) cerr << #x << " = " << (x) << " (L" << __LINE__ << ")" << " " << __FILE__ << endl;

using namespace std;

int main(){
    int n = 0;
    // scanf("%d", &n);
    cin >> n;
    string str;
    int total = 0;
    // getline(cin, str);
    cin >> str;
    // dump(str);
    for(int ii = 0; ii < str.size(); ii++){
        // if(cin.good() != false)break;
        // dump(str.at(ii));
        // dump(total);
        switch(str.at(ii)){
        case 'A':
            total += 4;
            break;
        case 'B':
            total += 3;
            break;
        case 'C':
            total += 2;
            break;
        case 'D':
            total += 1;
            break;
        case 'F':
            break;
        default:
            exit(1);
            break;
        }
    }
    double ave = 0;
    if(total != 0)
        ave = total / (long double)n;
    printf("%.14f\n", ave);
    
}
