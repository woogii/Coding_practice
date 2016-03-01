
#include <iostream>

void rotate(int matrix[][4], int n)
{

	for( int i = 0; i < n/2 ; i++ )
	{
		int first = i;

		int last = n - 1 - i;

		for(int j = first; j < last; j++) {
			int offset = j - first;

			int top = matrix[first][j];

			matrix[first][j] = matrix[last - offset][first];

			matrix[last-offset][first] = matrix[last][last-offset];

			matrix[last][last-offset] = matrix[i][last];

			matrix[i][last] = top;
		}
	}

}

int main()
{
	int matrix[][4] = { {1,2,3,4}, {5,6,7,8}, {9,10,11,12}, {13,14,15,16}};

	std::cout << sizeof(matrix)/sizeof(matrix[0]) << std::endl;

	rotate(matrix, sizeof(matrix)/sizeof(matrix[0]));

	return 0;
}