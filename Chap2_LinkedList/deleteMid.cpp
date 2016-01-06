#include <iostream>
#include "LinkedList.h"

void delete_middle_node(Node*);

int main() 
{
    LinkedList list;
 	int mid = 3;
 	
    list.insert(10); list.insert(9); list.insert(5); list.insert(7);  list.insert(8); list.insert(11); list.insert(12);
	Node* node = list.head;

	// Move to the middle of the list
   	for(int i = 0; i<mid; i++)
   	{
   		node = node->next;
   	}
    
    delete_middle_node(node);
    list.display();
}

void delete_middle_node(Node* node)
{
	Node* temp;

	node->data = node->next->data;	// copy the data from the next node to the current node
	temp = node->next;				// save the address of the next node 
	node->next = node->next->next;	// disconnect current node with the next node

	delete temp;					// delete the next node
}
