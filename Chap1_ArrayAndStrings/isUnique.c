
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>


bool checkUnique(char str[]);
bool isUnique(char str[]);

int main()
{
	#if 1   // With extra data structure

	//char str[16] = "abcdefghijklm";
	char str[16] = "abcdefghijklc";
	
	if (isUnique(str))
	{
		printf("A string is unique\n");
	} else 
	{
		printf("A string is not unique\n");
	}


	#endif 
	
	return 0;
}

bool isUnique(char str[])
{
	int val;
	int i;
	int length = strlen(str);
	int checkValue = 0;

	printf("length: %d\n", length);

	for (i=0; i< length; i++){
		val = str[i] - 'a';

		if( checkValue & (1 << val)  ) {
			return false;
		}

		checkValue |= (1 << val);
	}

	return true;
}



bool checkUnique(char str[])
{
	int length = strlen(str);
	bool frequency[128] = {false,};

	int count = 0;
	int i;

	for(i=0; i<length; i++)
	{
		if(frequency[str[i]]){
			return false;
		}
		frequency[str[i]] = true;
		
	}
	return true;
}