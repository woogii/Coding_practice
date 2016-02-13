
#include <stdio.h>
#include <stdlib.h>

void QuickSort(int [], int, int);
int Partition(int [], int, int );
void Swap(int[], int, int);


void QuickSort(int arr[], int left, int right)
{
	if(left <= right) 
	{
		int pivot = Partition(arr, left, right);
		QuickSort(arr,left, pivot-1);
		QuickSort(arr,pivot+1, right);
	}
}

void Swap(int arr[], int low, int high)
{
	int temp = arr[low];
	arr[low] = arr[high];
	arr[high] = temp;
}


int Partition(int arr[], int left, int right)
{
	int pivot = left;
	int low = pivot+1;
	int high = right;
 
	
	while(low <= high) 
	{
		while(arr[pivot] >= arr[low] && low <= right ) 
			low++;

		while(arr[pivot] <= arr[high] && high >= (left+1) )
			high--;

		if(low<=high)
		    Swap(arr, low, high);

		printf("%d %d\n", low, high);
	}

	Swap(arr, pivot, high);

	return high;
}



int main() 
{
	int arr[7] = {3,2,4,1,7,6,5};
	//int arr[3] = {3,3,3};

	int len = sizeof(arr)/sizeof(int);
	int i;

	QuickSort(arr, 0, sizeof(arr)/sizeof(int)-1);

	for(i = 0; i<len; i++)
		printf("%d ", arr[i]);

	printf("\n");
	return 0;
}	