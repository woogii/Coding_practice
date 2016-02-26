#include <iostream>
#include <string>
#include <algorithm>

bool checkOneEdit(std::string& str1, std::string& str2);
bool checkReplace(std::string& str1, std::string& str2);
bool checkInsert(std::string& str1, std::string& str2);

int main()
{
	std::string str1 = "pale";
	std::string str2 = "ple";

	std::string str3 = "pales";

	if(checkOneEdit(str1, str2))
		std::cout << "there is only one edit away" << std::endl;
	else 
		std::cout << "there are more than one edit" << std::endl;


	return 0;
}

bool checkOneEdit(std::string& str1, std::string& str2)
{
	bool result;

	if( str1.length() == str2.length() )
	{
		result = checkReplace(str1, str2);
	}
	else if( str1.compare(str2) < 0)
	{
		result = checkInsert(str1, str2);
	}
	else 
	{
		result = checkInsert(str2, str1);
	}	

	return result;
}

bool checkInsert(std::string& str1, std::string& str2)
{
	for(int i = 0; i < str1.size(); i++)
	{
		if(str1[i]!=str2[i])
			return false;
	}
	return true;
}


bool checkReplace(std::string& str1, std::string& str2)
{
	int numOfEdit = 0;

	sort(str1.begin(), str1.end());
	sort(str2.begin(), str2.end());

	for(int i = 0; i<str1.size(); i++)
	{
		if(str1[i] != str2[i])
		{
			numOfEdit++;
		}
	}
	std::cout << "num of edit : " << numOfEdit << std::endl;
	return numOfEdit == 1;
}
