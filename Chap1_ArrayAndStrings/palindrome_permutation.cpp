#include <iostream>
#include <string>
#include <vector>

void getCharFrequency(std::vector<int> & , std::string str);
void convertToLowerCase(std::string& str);
bool checkPalindrome(std::vector<int>&);

int main() 
{
	std::string str("Tact Coa");
	std::vector<int> v;

	convertToLowerCase(str);
	getCharFrequency(v, str);
	
	if(checkPalindrome(v)) 
	{
		std::cout << "there is palindrome permutations in this string" << std::endl;
	}
	else 
	{
		std::cout << "there is not palindrome permutations in this string" << std::endl;
	}

	return 0;
}

bool checkPalindrome(std::vector<int>& v)
{
	bool checkOdd = false;

	for(int i = 0; i<v.size(); i++)
	{
		if(v[i]%2 == 1)
		{
			if(checkOdd)
			{
				return false;
			}
			checkOdd = true;	
		}
	}

	return true;
}


void convertToLowerCase(std::string& str)
{
	for(int i = 0; i < str.size(); i++)
	{
		if( str[i] >= 'A' && str[i] <= 'Z' )
		{
			str[i] += 32;
		}
	}
}

void getCharFrequency(std::vector<int>& v, std::string str)
{
	int num = 'z' - 'a' + 1;
	int index;

	for(int i = 0; i < num; i++) 
	 	v.push_back(0);

 	for(int i = 0; i < str.size(); i++) 
 	{
	 	if( str[i] != ' ')
	 	{	
	 		index = str[i] - 'a';
	 		v[index]++;
	 	}
	 }

	// for(int i = 0; i < num; i++) 
	//  	std::cout << char(i+97)  << " : " << v[i] << std::endl;	 
}

