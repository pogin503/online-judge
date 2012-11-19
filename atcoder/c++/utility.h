#ifndef _UTILITY_H_
#define _UTILITY_H_

#include <cassert>
#include <sstream>
#include <string>
#include <vector>


/**
  * 文字列を数字に変換する.
  * @param[in] text 数字を表わす文字列
  * @param[in] base 基数（８進数 or １０進数 or １６進数）
  * @return 変換された数字
  * @see http://www.02.246.ne.jp/~torutk/cxx/tips/BtwBinaryAndString.html
  */
template<typename T>
T string2binary(const std::string& text, int base)
{
    assert(base == 8 || base == 10 || base == 16);
    std::istringstream is(text);
    T value;
    switch (base) {
	case 8:  is >> std::oct >> value; break;
    case 10: is >> value;        break;
    case 16: is >> std::hex >> value; break;
    default: ;
    }
    return value;
}

/**
 * 文字列を区切り文字で分割する.
 * @param[in]  data      文字列
 * @param[in]  delimiter 区切り文字
 * @param[out] result    分割された文字列集合
 * @see http://oshiete.goo.ne.jp/qa/7085291.html
 */
void splitstring(const std::string& data, const char* delimiter, std::vector<std::string>& result)
{
	result.clear();
	if( data.empty() ) return;

	std::string::size_type pos = 0;
	std::string::size_type new_pos;
	while( ( new_pos = data.find( delimiter, pos)) != std::string::npos ){
		result.push_back( data.substr( pos, new_pos-pos ) );
		pos = new_pos+1;
	}
	result.push_back( data.substr( pos ) );
}

/**
 * 0-9の値かを判定
 */
bool isNumChar(char c){
    if('0' <= c && c <= '9') return true;
    else return false;
}

/*
 * 桁数を返す
 */
int numberOfDigit(int num){
    return (int)log10(num) + 1;
}

#endif /* _UTILITY_H_ */
