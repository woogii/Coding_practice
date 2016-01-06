#include <iostream>
#include <map>
#include "LinkedList.h"

int last_kth_element(Node* node, int k);


int main() 
{
    LinkedList list;
    int k;
    list.insert(10); list.insert(9); list.insert(5); list.insert(7);  list.insert(8); list.insert(11); list.insert(12);
    
    std::cout << "Enter the number larger than 0 to get the last element of list: ";
    std::cin >> k;

    int ret = last_kth_element(list.head, k);

}

int last_kth_element(Node* node, int k)
{
	int index = 0;

	if(node != NULL) 
	{
		index = last_kth_element(node->next, k) + 1;
	} 

	if(index == k) 
	{
		std::cout << node->data << std::endl;
	}

	return index;
}
