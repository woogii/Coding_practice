
#include <iostream>
#include <string>

std::string compress(std::string& str);

int main()
{
	std::string str = "aabcccccaaa";


	std::cout << compress(str) << std::endl;


	return 0;
}

#if 1
std::string compress(std::string& str)
{
	std::string compressedStr;
	int countConsecutive = 0;

	for( int i = 0; i < str.length(); i ++) {

		countConsecutive++;

		if( i+1 >= str.length() || str[i] != str[i+1] ) {
			compressedStr +=  std::string(1,str[i]) + std::to_string(countConsecutive);
			std::cout << compressedStr << std::endl;
			countConsecutive = 0;
		}
	}
	return compressedStr.length() < str.length() ? compressedStr : str;

}
#endif 

#if 0

std::string compress(std::string& str)
{
	std::string compressedStr;
	int count = 1;
	int num = 0;

	for(int i = 0; i < str.size(); i++)
	{
		compressedStr += str[i];

		while(1) {

			if(str[i] == str[i+1])
			{
				count++;
				i++;
				continue;
			}
			compressedStr += std::to_string(count);
			count = 1;		// reset
			break;
		}	

	}

	return compressedStr;
}

#endif 

