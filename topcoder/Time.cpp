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
class Time {
public:
	string whatTime(int seconds) {
        int hour, minite, sec;
        hour = seconds / 3600;
        minite = seconds % 3600;
        sec  = minite;
        
        minite  = minite / 60;
        sec = sec % 60;
        stringstream s;
        s << hour << ":" << minite << ":" << sec;
        
        string result = s.str();
		return result;	
	}
};


// Powered by FileEdit
// Powered by TZTester 1.01 [25-Feb-2003]
// Powered by CodeProcessor
