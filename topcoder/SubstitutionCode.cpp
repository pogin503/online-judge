#include <vector>
#include <list>
#include <map>
#include <set>
#include <deque>
#include <stack>
#include <bitset>
#include <algorithm>
#include <functional>
#include <numeric>
#include <utility>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <cctype>
#include <string>
#include <cstring>
#include <ctime>

using namespace std;

//conversion
//------------------------------------------
inline int toInt(string s) {int v; istringstream sin(s);sin>>v;return v;}
template<class T> inline string toString(T x) {ostringstream sout;sout<<x;return sout.str();}

//math
//-------------------------------------------
template<class T> inline T sqr(T x) {return x*x;}

//typedef
//------------------------------------------
typedef vector<int> VI;
typedef vector<VI> VVI;
typedef vector<string> VS;
typedef pair<int, int> PII;
typedef long long LL;

//container util
//------------------------------------------
#define ALL(a)  (a).begin(),(a).end()
#define RALL(a) (a).rbegin(), (a).rend()
#define PB push_back
#define MP make_pair
#define SZ(a) int((a).size())
#define EACH(i,c) for(typeof((c).begin()) i=(c).begin(); i!=(c).end(); ++i)
#define EXIST(s,e) ((s).find(e)!=(s).end())
#define SORT(c) sort((c).begin(),(c).end())

//repetition
//------------------------------------------
#define FOR(i,a,b) for(int i=(a);i<(b);++i)
#define REP(i,n)  FOR(i,0,n)

//constant
//--------------------------------------------
const double EPS = 1e-10;
const double PI  = acos(-1.0);

//clear memory
#define CLR(a) memset((a), 0 ,sizeof(a))

//debug
#define dump(x)  cerr << #x << " = " << (x) << endl;
#define debug(x) cerr << #x << " = " << (x) << " (L" << __LINE__ << ")" << " " << __FILE__ << endl;

class SubstitutionCode {

public:
    int getValue(string key, string code) {
        // key中のcodeを一つづつ見つける
        // find_first_of
        string foundStr;
        for(int keyIdx = 0; keyIdx < key.size(); keyIdx++){
            for(int codeIdx = 0; codeIdx < code.size(); codeIdx++){
                // 見つけた文字列の位置を返す
                int found = key.find(code.at(codeIdx));
                if(found != string :: npos){

                    if(found == 9) foundStr.append("0");
                    else           foundStr.append(key.at(found));
                }

            }

        }
        int result = toInt(foundStr);
        return result;
    }
    run_test(int i){
        assert(SubstitutionCode("TRADINGFEW", "LGXWEV") == 709);
    }
    // void run_test(int Case) { if ((Case == -1) || (Case == 0)) test_case_0();
    //     if ((Case == -1) || (Case == 1)) test_case_1();
    //     if ((Case == -1) || (Case == 2)) test_case_2();
    //     if ((Case == -1) || (Case == 3)) test_case_3(); }

};
// BEGIN CUT HERE
int main() {
    SubstitutionCode ___test;
    ___test.run_test(-1);
}
// END CUT HERE
