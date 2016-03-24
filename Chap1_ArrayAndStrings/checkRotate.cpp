#include <iostream>
#include <cstring>

int checkRotate(char* string1, char* string2);

int main()
{
	char string1[16] = "abcdef";
	char string2[16] = "eeabcd";


	if(checkRotate(string1, string2)){
		std::cout << "The second string is a rotaion of the first string " << std::endl; 
	} else {
		std::cout << "The second string is not a rotaion of the first string " << std::endl; 
	}

	return 0;
}

int checkRotate(char* string1, char* string2)
{

	char* string3 = new char [strlen(string1)*2];

	// Append the string1 to the same string1 to check whether string2 is contained or not 
	string3 = strcat(string1, string1);

	// Returns a pointer to the first occurrence of string2 in string3, or a null pointer if string2 is not part of string3
	return strstr(string3, string2) != NULL ? 1 : 0;
}