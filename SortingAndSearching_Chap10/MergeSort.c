

#include <stdio.h>
#include <stdlib.h>


void MergeTwoArea(int [], int, int, int);
void MergeSort(int [], int, int);

void MergeSort(int arr[], int left, int right) 
{
	int mid;

	if(left < right) 
	{
		mid = (left+right)/2;

		MergeSort(arr, left, mid);
		MergeSort(arr, mid+1, right);
		MergeTwoArea(arr, left, mid, right);
	}

}

void MergeTwoArea(int arr[], int left, int mid, int right) 
{
	int length = right+1;

	int* sorted_arr = (int *)malloc(sizeof(int)*length);
	int newArrIdx = left;
	int frontIdx = left;
	int rearIdx = mid+1;
	int i;

	while(frontIdx <= mid && rearIdx <= right)
	{
		if(arr[frontIdx] < arr[rearIdx])
		{
			sorted_arr[newArrIdx] = arr[frontIdx++];
		}else 
		{
			sorted_arr[newArrIdx] = arr[rearIdx++];
		}
		newArrIdx++;
	}

	if ( frontIdx > mid )
	{
		while(rearIdx <= right) 
		{
			sorted_arr[newArrIdx++] = arr[rearIdx++];
		}
	}
	else 
	{
		while(frontIdx <= mid) 
		{	
			sorted_arr[newArrIdx++] = arr[frontIdx++];
		}
	}

	for(i = left; i<=right; i++) 
	{
		arr[i] = sorted_arr[i];
		printf("%d ", arr[i]);
	}
	printf("\n");

	free(sorted_arr);
}
	
int main() 
{
	int arr[] = {15,19,1,45,34,18,30,20};
	int i = 0;

	MergeSort(arr,0, sizeof(arr)/sizeof(int) - 1);

	for(i=0; i< sizeof(arr)/sizeof(int); i++) 
	{
		printf("%d ", arr[i]);
	}

	printf("\n");

	return 0;
}