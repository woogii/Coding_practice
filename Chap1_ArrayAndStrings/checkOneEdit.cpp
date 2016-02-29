#include <iostream>
#include <string>
#include <algorithm>

bool checkOneEdit(std::string& str1, std::string& str2);
bool checkReplace(std::string& str1, std::string& str2);
bool checkInsert(std::string& str1, std::string& str2);

int main()
{
	std::string str1 = "pale";
	std::string str2 = "pl";

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
	else if( str1.length() +1 ==  str2.length() )
	{
		printf("str1 is shorter\n");
		result = checkInsert(str1, str2);
	}
	else if( str1.length() -1 == str2.length() )
	{
		printf("str1 is longer\n");
		result = checkInsert(str2, str1);
	}	

	return false;
}

bool checkInsert(std::string& str1, std::string& str2)
{
	int index1 = 0;
	int index2 = 0;

	while(index2 < str2.length() && index1 < str1.length() ) 
	{
		if( str1[index1] != str2[index2])
		{
			if(index1 != index2)
			{
				return false;
			}
			index2++;
		}
		else 
		{
			index1++;
			index2++;
		}
	}

	return true;
}


bool checkReplace(std::string& str1, std::string& str2)
{
	int numOfEdit = 0;

	//sort(str1.begin(), str1.end());
	//sort(str2.begin(), str2.end());
	bool foundDifference = false;

	for(int i = 0; i<str1.size(); i++)
	{

		if(str1[i] != str2[i])
		{
			// 	numOfEdit++;
			if(foundDifference) 
			{
				return false;
			}
			
			foundDifference = true;
		}
	}
	// std::cout << "num of edit : " << numOfEdit << std::endl;
	
	return foundDifference;
	// return numOfEdit == 1;
}
