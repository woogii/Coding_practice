#include <iostream>
#include <vector>
#include <string>

int binarySearch(std::vector<int>&, int, int, int );
int binarySearch(std::vector<std::string>&, std::string, int, int );


int main()
{

	std::vector<int> v;
	v.push_back(1);v.push_back(2);v.push_back(3);v.push_back(4);v.push_back(5);
	v.push_back(6);v.push_back(7);v.push_back(8);v.push_back(9);v.push_back(10);

	// int ret = binarySearch(v, 10, 0, v.size()-1);
	const char* str[] = {"at", "", "", "", "ball", "", "", "car", "", "", "dad", "", ""};
	std::string key = "at";

	std::vector<std::string> strVector(str, str + sizeof(str)/sizeof(str[0]));
	int ret = binarySearch(strVector,key, 0, strVector.size()-1);
	std::cout << "ret : " << ret << std::endl;
	(ret >= 0) ? std::cout << "ret : " << strVector[ret] << std::endl : std::cout << "there is no search result" << std::endl;

	return 0;
}

int binarySearch(std::vector<std::string>& v, std::string key, int first, int last)
{
	if (first > last)
		return -1;

	int i,j;
	int mid = (first+last)/2;

	if (v[mid].compare("") == 0) 		
	{
		std::cout << "first : " << first << std::endl;
		std::cout << "last : " << last << std::endl;

		int left = mid - 1;
		int right = mid + 1;

		while(true) 
		{
			if( left < first && right > last ) 	// Check if both left and right indices are within the range of string vector
			{
				return -1;
			}
			else if ( right <= last && v[right].compare("") != 0) // When a value located at the right index of string vector is non empty string, terminate loop
			{
				mid = right;
				break;
			} 
			else if ( left >= first && v[left].compare("") != 0 ) // When a value located at the left index of string vector is non empty string, terminate loop
			{
				mid = left;
				break;
			}

			// move each pointer index
			right++;
			left--;

		}

		#if 0

		for(i = mid; i>=first; i--)
		{
			if( v[i].compare("") != 0 )
				break;
		}

		if (i < first) i= first;		// If empty string is appearing continuously, index 'i' can be out of the range 
										// This line prevents 'i' index from moving out of the range 

		for(j= mid; j<=last; j++)
		{
			if( v[j].compare("") != 0 )
				break;
		}

		if (j > last) j = last ;		
		std::cout << "after i : " << i << std::endl;
		std::cout << "after j : " << j << std::endl;

		(mid-i) < (j-mid) ? mid = i : mid = j;

		#endif 
	}
	
	std::cout << "after mid : " << mid << std::endl;
	std::cout << "after mid value: " << v[mid] << std::endl;

	if (v[mid].compare(key) < 0 )  
	{
		return binarySearch(v,key, mid+1, last);
	}
	else if ( v[mid].compare(key) > 0) 
	{
		return binarySearch(v,key,first, mid-1);
	}
	else 
	{
		return mid;
	}
	

}

int binarySearch(std::vector<int>& v, int key, int first, int last)
{
	if (first > last)
		return -1;

	int mid = (first+last)/2;

	if (v[mid] < key) 
	{
		return binarySearch(v,key, mid+1, last);
	}
	else if ( v[mid] > key) 
	{
		return binarySearch(v,key,first, mid-1);
	}
	else 
	{
		return v[mid];
	}

}