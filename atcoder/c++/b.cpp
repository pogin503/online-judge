#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include <set>
#include "stdio.h"
#include "stdlib.h"
#include <algorithm>
#define FOR(i,a,b) for(int i=(a);i<(b);++i)
#define REP(i,n)  FOR(i,0,n)
#define dump(x)  cerr << #x << " = " << (x) << endl;
#define debug(x) cerr << #x << " = " << (x) << " (L" << __LINE__ << ")" << " " << __FILE__ << endl;

using namespace std;

int main(){
    int n = 0;
    cin >> n;
    vector<string> jisho;
    string buf;
    while(cin >> buf){
        // getline(cin, buf);
        // if(!cin.fail())break;
        // if(buf.size() == 0)break;
        jisho.push_back(buf);
        
    }
    reverse(jisho.begin(), jisho.end());
    sort(jisho.begin(), jisho.end());
    dump(111);
    for(int ii = 0; ii < jisho.size(); ii++){
        cout << jisho[ii] << endl;
    }
    
}
