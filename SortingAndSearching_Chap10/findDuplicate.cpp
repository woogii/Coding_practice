
#include <iostream>
#include <vector>

// This problem is all about bit manipulation. 
// Should understand how 'SHIFT' and 'AND' operations are used in this program.
// First, creates a bit vector with 32000 bits, where each bit represents one integer.
// We declare integer(=4byte) array with 1000 elements of data, which can be thought as if we secure the space where we can store 32000 bits information in the array.
// From the given input data, it is divided by 32, which is equivalent of '>> 5' operation, to locate which array index the data exits on. 
// Then, do additional bit wise operation within single 'word'(= 4 bytes) to flag each element by setting a bit to 1.

// & 0x1F == mod 32,    ex)  00100001 (=33) & 00011111 = 1, 00100000 (=32) & 00011111 = 0 , 00000001 & 00011111  = 1 

class BitSet 
{
	public : 
		int* bitArray;

		BitSet(int size) 
		{	
			std::cout << "in constructor...." << std::endl;
			std::cout << "size : " <<  (size>>5) + 1 << std::endl;
			bitArray = new int [(size>>5)+1];	
		}

		bool get(int pos) 
		{
			int wordNumber = (pos >> 5);
			int bitNumber  = (pos & 0x1F);
			std::cout << "in get..." << std::endl;
			std::cout << "wordNumber : " << wordNumber << std::endl;
			std::cout << "bitNumber  : " << bitNumber << std::endl;
			std::cout << "1 << bitNumber  : " << (1<<bitNumber) << std::endl;

			return (bitArray[wordNumber] & (1 << bitNumber));				
		}

		void set(int pos)
		{
			int wordNumber = (pos >> 5);			// divide 32 
			int bitNumber = (pos & 0x1F);			// mod 32 

			std::cout << "in set..." << std::endl;
			std::cout << "wordNumber : " << wordNumber << std::endl;
			std::cout << "bitNumber  : " << bitNumber << std::endl;

			bitArray[wordNumber] |= 1 << bitNumber;					// flag each element by setting to 1 
		}

};


void checkDuplicates(int arr[], int size) 
{
	BitSet* bs = new BitSet(32000);

	for(int i = 0; i < size; i++)
	{
		int num = arr[i];
		int num0 = num - 1;
		std::cout << "num  : " << num << std::endl;
		std::cout << "num0 : " << num0 << std::endl;

		if(bs->get(num0)) 
		{
			std::cout << "Duplicate : " <<  num << std::endl;
		}
		else 
		{
			bs->set(num0);
		}
	}

}




int main()
{

	//std::cout << (32000>>5) << std::endl;
	int array[] = { 1,2,3,4,5,6,7,8,9,10,1,11,12,13,14,15,16,17,18,2,20,3};
	std::cout << sizeof(array)/sizeof(int) << std::endl;	

	checkDuplicates(array, sizeof(array)/sizeof(int));

	return 0;
}
 