#include <iostream>
#include <map>
#include "LinkedList.h"

void remove_duplicate(Node* head);
void remove_duplicateWithRunner(Node* head);

int main() 
{
    LinkedList list;

    list.insert(10); list.insert(10); list.insert(5); list.insert(7);  list.insert(10); list.insert(12); list.insert(12);
    // remove_duplicate(list.head);

    remove_duplicateWithRunner(list.head);
    list.display();
}

// This algorithm takes the quadratic time complexity O(N2) and constant space complexity O(1).
void remove_duplicateWithRunner(Node* head)
{
    Node* current = head;

    Node* runner;

    while(current != NULL )
    {
        runner = current;
    
        while(runner->next != NULL)
        {
            if( current->data != runner->next->data )
            {            
                runner = runner->next;
            }
            else 
            {
                Node* temp = runner->next;
                runner->next =  runner->next->next;
                delete temp;
            }
        }
        current = current->next;
    }
}

// This algorithm takes the linear time complexity O(N). N is the number of elements in the linked list.
void remove_duplicate(Node* head)
{

    Node* current = head;
    std::map<int, bool> hashMap;

    if( current == NULL )
    {
        return;
    }

    hashMap[current->data] = 1;

    while(current->next != NULL)
    {
        if( hashMap[current->next->data] == 0 )      // if key does not exist
        {
            hashMap[current->next->data] = 1;
            current = current->next;
        }
        else
        {                                           // if key already exists
            Node* temp = current->next;             // store the address of the node which contains duplicate data
            current->next = current->next->next;    // connect two nodes to skip the duplicate node
            delete temp;                            // delete disconnected node
        }
    }
}