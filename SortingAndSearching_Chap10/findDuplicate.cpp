
#include <iostream>
#include <vector>

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

			return (bitArray[wordNumber] & (1 << bitNumber)) != 0;
		}

		void set(int pos)
		{
			int wordNumber = (pos >> 5);
			int bitNumber = (pos & 0x1F);

			std::cout << "in set..." << std::endl;
			std::cout << "wordNumber : " << wordNumber << std::endl;
			std::cout << "bitNumber  : " << bitNumber << std::endl;

			bitArray[wordNumber] |= 1 << bitNumber;
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
			std::cout << num << std::endl;
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
 