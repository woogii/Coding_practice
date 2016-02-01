
#include <iostream>

int binarySearch(int arr[],int&, int , int ); 

int main() 
{
	int arr[10] = {1,2,3,4,5,6,7,8,9,10};

	int searchKey = 3;

	int resultIndex = binarySearch(arr, searchKey, 0,9);
	
	if (resultIndex != -1) 
	{
		std::cout << "A result of search : " << arr[resultIndex] << std::endl;
	} 
	else 
	{
		std::cout << "there is no key in the array" << std::endl;
	}

	return 0;
}

int binarySearch(int arr[],int& searchKey, int first, int last) 
{
	if( first > last) 
		return -1;
	
	int mid = (first+last)/2;

	if( arr[mid] == searchKey) 
	{
		return mid; 
	}
	else if ( arr[mid] > searchKey) 
	{
		return binarySearch(arr, searchKey, first, mid-1);
	}
	else 
	{
		return binarySearch(arr, searchKey, mid+1, last);
	}

}