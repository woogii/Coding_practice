
#include <stdio.h>


int isUnique(char [], int);

int main()
{

	char str[] = "abcdefghijk";

	int ret = isUnique(str, sizeof(str)/sizeof(int));

	(ret > 0) ? printf("Unique\n") : printf("Not unique\n");

	return 0;
}

int isUnique(char str[], int len) 
{
	int bitFlag = 0;
	int numOfShift;

	for(int i = 0; i<len; i++) 
	{
		numOfShift = str[i] - 'a';
	
		if( (bitFlag & (1 << numOfShift )) != 0 ) 
		{
			return -1;
		}

		bitFlag |= (1 <<  numOfShift);
	}

	return 0;

}