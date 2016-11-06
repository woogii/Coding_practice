//
//  main.cpp
//  Stack_LinkedList
//
//  Copyright © 2016년 siwookhyun. All rights reserved.
//

#include <iostream>
#include <string>


typedef struct Node {
    Node* next;
    Node* prev;
    Node* child;
    int value;
    
} Node;

void append(Node* child, Node **tail);

void flattenList(Node* head, Node** tail);

void exploreAndSeparate(Node* childListStart);

void unflattenList(Node* start, Node** tail);
//struct Node {
//    Node* next;
//    int data;
//};



struct LinkedList {
    
    Node* head = NULL;
    Node* tail = NULL;
    
    bool insertAfter(Node* node, int value) {
        
        Node* newNode;
        Node* currentPosition = head;
        
        newNode = (Node*)malloc(sizeof(Node));
        
        // Checek whether the dynamic memory allocation is performed properly
        if (!newNode) {
            return false;
        }
        newNode->value = value;
        newNode->child = NULL;
        newNode->prev  = NULL;
        newNode->next  = NULL;
        
        // Insert at the beginning of the list
        if (!node) {
            
            newNode->next = head;
            newNode->prev = NULL;
            head = newNode;
            
            
            // In case the list is an empty
            if (!tail ){
                tail = newNode;
            }
            
            return true;
        }
        
        
        while(currentPosition) {
            
            if( currentPosition == node ){
                
                newNode->next = currentPosition->next;
                currentPosition->next = newNode;
                newNode->prev = currentPosition;
                
                if ( currentPosition != head && currentPosition != tail ) {
                    newNode->next->prev = newNode;
                }
                
                if (currentPosition == tail) {
                    tail = newNode;
                }
                return true;
            }
            currentPosition = currentPosition->next;
        }
        
        // Couldn't location a position where newNode is inserted
        free(newNode);
        return false;
        
    }
    
    bool remove(Node* node) {
        
        Node *currentPosition = head;
        
        if( !node ) {
            return false;
        }
        
        if (node == head) {
            
            head = node->next;
            head->prev = NULL;
            free(node);
            
            // if there is no Node in the list
            if(!head)
                tail = NULL;
            
            return true;
        }
        
        while( currentPosition ) {
            
            if (currentPosition->next == node) {
                
                currentPosition->next = node->next;
                free(node);
                if(currentPosition->next == NULL)
                    tail = currentPosition;
                return true;
            }
            
            currentPosition = currentPosition->next;
        }
        
        
        return false;
    }
    
    void printAllNodesInList() {
        
        Node* current = head;
        
        if (current == NULL) {
            printf("No data is the list");
        }
        
        while(current != NULL) {
            printf("%d ", current->value);
            current = current->next;
        }
        
        printf("\n");
    }
    
    void removeHead(Node** head) {
        
        // if list is an empty
        
        if ( head && *head) {
            Node* temp = (*head)->next;
            free(*head);
            (*head) = temp;
        }
        
    }
};



int main(int argc, const char * argv[]) {
    
    
    LinkedList list;
    
    LinkedList secondLevelChildListOne;
    LinkedList secondLevelChildListTwo;
    LinkedList thirdLevelChildListOne;
    LinkedList thirdLevelChildListTwo;
    LinkedList thirdLevelChildListThree;
    LinkedList fourthLevelChildListOne;
    LinkedList fourthLevelChildListTwo;
    //list.insertAfter(NULL, 1);
    //list.insertAfter(list.head, 2);
    //list.insertAfter(list.tail, 4);
    //list.insertAfter(list.head->next, 3);
    
    //list.remove(list.head);
    //list.remove(list.tail);
    //
    // printf("%p\n", (void*)list.head);
    // list.removeHead(NULL);
    //list.removeHead(&list.head);
    
    // make the first level list
    list.insertAfter(NULL, 5);
    list.insertAfter(list.head, 33);
    list.insertAfter(list.head->next, 17);
    list.insertAfter(list.head->next->next, 2);
    list.insertAfter(list.head->next->next->next, 1);
    
    
    
    // make the first child level-2 list
    secondLevelChildListOne.insertAfter(NULL, 6);
    secondLevelChildListOne.insertAfter(secondLevelChildListOne.head, 25);
    secondLevelChildListOne.insertAfter(secondLevelChildListOne.head->next, 6);
    
    list.head->child = secondLevelChildListOne.head;
    
    
    // make the second child level-2 list
    secondLevelChildListTwo.insertAfter(NULL, 2);
    secondLevelChildListTwo.insertAfter(secondLevelChildListTwo.head , 7);
    
    list.head->next->next->next->child = secondLevelChildListTwo.head;

    flattenList(list.head, &list.tail);
    
    list.printAllNodesInList();
    
    unflattenList(list.head, &list.tail);
    
    list.printAllNodesInList();
    return 0;
}

void append(Node* child, Node **tail) {
    
    Node* currNode;
    
    (*tail)->next = child;
    child->prev = *tail;
    
    for( currNode = child; currNode->next; currNode = currNode->next)
        ;
    
    *tail = currNode;
    
}


void flattenList(Node* head, Node** tail) {
    
    Node* currNode = head;
    
    while(currNode) {
        if (currNode->child) {
            append(currNode->child, tail);
        }
        currNode = currNode->next;
    }
}

void exploreAndSeparate(Node* childListStart) {
    
    Node* currNode = childListStart;
    
    while(currNode) {
        
        if (!currNode->child) {
        
        } else {
        if ( currNode->child->prev ) {
            currNode->child->prev->next = NULL;
            currNode->child->prev = NULL;
            exploreAndSeparate(currNode->child);
        }
        
        }
        
        currNode = currNode->next;
    }
}

void unflattenList(Node* start, Node** tail) {
    
    Node* currNode;
    
    exploreAndSeparate(start);
    
    for ( currNode = start; currNode->next; currNode = currNode->next)
        ;
    
    *tail = currNode;
}

