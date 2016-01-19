
#include <iostream>
#include <vector>

void merge(int [], int [], int , int);

int main()
{
	// Declare two sorted array. Suppose array1 has enough space that can accomodate whole elements of the array2
	
	#if 0 	
	// If all elements of one array are larger than those of the other array 
	int arr1[8] = {1,5,10,15};
	int arr2[3] = {30,35,39};
	#endif 

	#if 0 
	// If all elements of one array are smaller than those of the other array 
	int arr1[8] = {30,35,39,42};
	int arr2[3] = {1,5,10};
	#endif 

	int arr1[9] = {1,4,9,10,14};
	int arr2[3] = {2,8,12};

	merge(arr1, arr2, 5, 3);

}

void merge(int arr1[], int arr2[], int numOfArr1, int numOfArr2)
{	

	int mergedIdx = numOfArr1 + numOfArr2 -1;
	int last_idx1 =  numOfArr1-1;
	int last_idx2 =  numOfArr2-1;

	std::cout << "mergedIndex: " << mergedIdx << std::endl;
	std::cout << "last_idx1: " << last_idx1 << std::endl;
	std::cout << "last_idx2: " << last_idx2 << std::endl;


	while( last_idx2 >= 0) 
	{
		if( last_idx1 >= 0 && (arr1[last_idx1] > arr2[last_idx2]) ) 
		{
			arr1[mergedIdx] = arr1[last_idx1];
			last_idx1--;
		}
		else 
		{
			arr1[mergedIdx] = arr2[last_idx2];
			std::cout << arr2[last_idx2] << " ";
			last_idx2--;
		}

		mergedIdx--;
	}
	std::cout << std::endl;

	for(int i = 0; i < (numOfArr1 + numOfArr2); i++)
	{
		std::cout << arr1[i] << std::endl;
	}

}