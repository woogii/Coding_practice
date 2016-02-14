#include <stdio.h>
#include <string.h>
#include <stdlib.h>


void replaceSpace(char [], int);

int main()
{
	char str[32] = "Mr John Smith        ";
	// char str[32] = "Mr John is from Korea      ";

	int length = 13;

	replaceSpace(str, length);

	return 0;
}

void replaceSpace(char str[], int length) 
{
	int i = 0;
	int space_count = 0;
	int new_length;

	for(i = 0; i<length; i++) 
	{
		if (str[i] == ' ')
			space_count++;
	}

	// Secure enough space which can accomodate modified string 
	// Mr_John_Smith : 13 ( 11 + 2 space characters) 
	// Mr%20John%20Smith : 17 ( = 11 + 2 + 2*2 )
	new_length = length + space_count*2;

	str[new_length--] = '\n';
	
	for(i = length-1; i>=0; i--)
	{
		if(str[i] == ' ')
		{	
			str[new_length] = '0';
			str[new_length-1] = '2';
			str[new_length-2] = '%';
			new_length -= 3;
		}
		else 
		{
			str[new_length--] = str[i];
		}
	}


	#if 0 

	char* newStr = (char*)malloc(strlen(str));

	for (i = 0; i < len; i++) 
	{
		if( str[i] != 32)  // ASCII value of the space character is  32
		{
			newStr[j++] = str[i];
			printf("%s\n", newStr);
		}	
		else 
		{
			strcat(newStr, "%20"); // Replace space character with a string "%20"
			
			j = j+3;
		}
	}
	 
	newStr[strlen(newStr)] = '\n'; 
	
	#endif 

	printf("%s\n", str);


}