#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <climits>
#include <cfloat>
#include <iostream>
#include <string>
#include <vector>
#include <sstream>
using namespace std;
class SquareDigitNumbers 
{
public:
    int getNumber(int n) {
        //vector<int> v_array;
        int result = 0;        
        for (int exp = 1; n > 0; exp *= 10){
            //v_array.push_back(i);
            result +=  exp * (n % 4) * (n % 4);
            n /= 4;
            
            
        }
        return result;	
    }
};
// BEGIN CUT HERE
int main() {
  SquareDigitNumbers ___test;
  ___test.run_test(-1);
}
// END CUT HERE
