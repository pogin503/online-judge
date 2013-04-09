#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <climits>
#include <cfloat>
#include <iostream>
#include <string>
#include <vector>
#include <sstream>
#include "stdlib.h"

using namespace std;
bool inRange(int x, int y){return x >= 0 && x < y;}
int myPow(int base, int exponent)
{
    int result = 1;
    // printf("Power");

    for( int i = 1; i <= exponent; i++) {
        result *= base;
    }
    // printf("result = %d", result);

    return result;
}
int string2int(vector<string>& str_vec,int row,  int column)
{
    stringstream is(str_vec.at(row));
    int value;
    cout << "str_vec = "<< str_vec.at(row) << endl;
    is >> value;
    printf ("value = %d\n",value % 10);
    printf ("value = %d column = %d pow = %d\n",value, column, myPow(10, column));
    if(column == str_vec[0].size() - 1)
        return value % 10;
    else if (column == 0){
        return value / (int)myPow(10, (str_vec[0].size() - 1));
    }
    else{
        value = value / myPow(10, (str_vec[0].size() - 1 - column ));
        return value % 10;

    }
}

class SpiralWalking {
public:

	int totalPoints(vector <string> levelMap) {
        //(column, row)
        int width = levelMap[0].size();
        int height = levelMap.size();
        printf ("width = %d height = %d\n",width, height);
        bool visitedMap[51][51];
        for (int i = 0; i < 51; i++){
            for (int j = 0; j < 51; j++){
                visitedMap[i][j] = false;
            }
        }
        int result = 0;
        // istream istr(levelMap[ii][jj]);
        int ii = 0, jj = 0;
        string buf;
        buf = levelMap[ii][jj];
        result += atoi(buf.c_str());
        visitedMap[0][0] = true;
        enum dir{
            LEFT,
            RIGHT,
            UP,
            DOWN,
        };
        enum dir d = RIGHT;
        // int column_range = levelMap[0].size();
        // int row_range = levelMap.size();
        // int row_min = 0, column_min = 0;
        ii = jj = 0;
        for (;;){
            if(d == RIGHT){
                if(inRange(jj + 1, width) && visitedMap[ii][jj + 1] == false){
                    jj++;
                    result += string2int(levelMap, ii, jj);
                    cout << result << endl;
                    cout << "right" << endl;
                    visitedMap[ii][jj] = true;
                }else{
                    result -= string2int(levelMap, ii, jj);
                    cout << "right to down" << endl;
                    d = DOWN;
                    // jj++;
                }
            }
            else if(d == DOWN){
                if(inRange(ii + 1, height) && visitedMap[ii + 1][jj] == false){
                    ii++;
                    result += string2int(levelMap, ii, jj);
                    cout << result << endl;
                    cout << "donw" << endl;

                    visitedMap[ii][jj] = true;
                }else{
                    result -= string2int(levelMap, ii, jj);
                    cout << result << endl;
                    cout << "donw to left" << endl;
                    d = LEFT;
                    // ii++;
                }

            }
            else if(d == LEFT){
                if(inRange(jj - 1, width) && visitedMap[ii][jj - 1] == false){
                    jj--;
                    result += string2int(levelMap, ii, jj);
                    cout << result << endl;
                    cout << "left" << endl;

                    visitedMap[ii][jj] = true;

                }else{
                    result -= string2int(levelMap, ii, jj);
                    cout << result << endl;
                    cout << "left to up" << endl;

                    d = UP;
                    // jj--;
                }
            }
            else if(d == UP){
                if(inRange(ii - 1, height) && visitedMap[ii - 1][jj] == false){
                    ii--;
                    result += string2int(levelMap, ii, jj);
                    cout << result << endl;
                    cout << "up" << endl;

                    visitedMap[ii][jj] = true;
                }else{
                    result -= string2int(levelMap, ii, jj);
                    cout << result << endl;
                    cout << "up to right" << endl;

                    d = RIGHT;
                    // ii--;
                }
            }
            cout << ii << jj << endl;

            if((inRange(ii + 1, height) == false || visitedMap[ii + 1][jj]) &&
               (inRange(jj + 1, width) == false || visitedMap[ii][jj + 1]) &&
               (inRange(ii - 1, height) == false || visitedMap[ii - 1][jj]) &&
               (inRange(jj - 1, width) == false || visitedMap[ii][jj - 1]))
                break;

        }
		return result;
	}
};
// // BEGIN CUT HERE
// int main() {
//     SpiralWalking ___test;
//     vector<string>levelMap;
//     levelMap.push_back("111");
//     levelMap.push_back("111");
//     levelMap.push_back("111");
//     for (int i = 0; i < 3; i++){
//         cout << levelMap[i] << endl;

//     }

//     ___test.totalPoints(levelMap);
// }
// END CUT HERE
