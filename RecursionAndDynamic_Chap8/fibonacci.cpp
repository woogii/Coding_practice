
#include <iostream>

//int fibonacci(int n);

int fibonacci(int* memo, int n);

int main()
{
	int n = 5;
	int result;

	//result = fibonacci(n);
	int* memo = new int [n];

	result = fibonacci(memo, n);

	std::cout << result << std::endl;

	return 0;
}


int fibonacci(int* memo, int n)
{
	if( n == 0 || n == 1) 
		return n;

	if(memo[n] == 0) 
	{
		memo[n] = fibonacci(memo, n-1) + fibonacci(memo, n-2);
		std::cout << "in func " << memo[n] << std::endl;
	}

	return memo[n];
}


#if 0 
// Using bottom-up
int fibonacci(int n)
{
	if(n == 0) return 0;

	int a = 0;
	int b = 1;
	int c;

	for(int i = 2; i<n; i++)
	{
		c = a + b;
		a = b;
		b = c;
	}

	return a+b;
}
#endif 

#if 0 

# Using Recursion

int fibonacci(int n)
{
	if( n == 0 ||  n == 1)
		return n;
	else 
		return fibonacci(n-1) + fibonacci(n-2);
}

#endif 