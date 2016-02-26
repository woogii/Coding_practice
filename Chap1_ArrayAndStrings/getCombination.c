


#include <stdio.h>
#include<stdio.h>
#include<string.h>

void combination(int [], int, int, int, int);
int combination2(int n, int r);
void printElement(int[], int);

int main() {
    
    int arr[5];
    
    combination(arr, 0, 5, 3, 0);
    //printf("result : %d\n", combination2(5,3));
    return 0;
}

int combination2(int n, int r)
{
    printf("(n, r) : (%d, %d) \n", n, r);
    
    if(n == r || r == 0) return 1;
    else return combination2(n-1, r-1) + combination2(n-1, r);
}

void combination(int arr[], int index, int n, int r, int target) {

    if      (r == 0) printElement(arr, index);
    else if (target == n) return;
    else {
        arr[index] = target;
        printf("arr[%d]: %d\n", index, arr[index]);
        combination(arr, index + 1, n, r - 1, target + 1);
        combination(arr, index, n, r, target + 1);
    }
    
}//end combination()

void printElement(int arr[], int length)
{
    for (int i = 0; i < length; i++)
        printf("%d", arr[i]);
    
    printf("\n");
}