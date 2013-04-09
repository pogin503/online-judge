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
class StreetWalking {
public:
	long long minTime(int X, int Y, int walkTime, int sneakTime) {

        int absX = abs(X), absY = abs(Y);
		long long result;

        result = abs(absX - absY) * walkTime;
        if(absX > absY){
            result += absY * sneakTime;
            
        }else{
            result += absX * sneakTime;
            
        }
		return result;	
	}
};
// BEGIN CUT HERE
int main() {
  StreetWalking ___test;
  ___test.run_test(-1);
}
// END CUT HERE
