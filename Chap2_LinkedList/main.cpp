//
//  main.cpp
//  LinkedListStack
//
//  Created by TeamSlogup on 2016. 10. 29..
//  Copyright © 2016년 siwookhyun. All rights reserved.
//

#include <iostream>
#include <string>

const std::string E_EMPTY = "Stack is Empty";

class StackError {
public:
    StackError(std::string);
    ~StackError();
};

StackError::StackError(std::string errorMessage) {
    std::cout << errorMessage << std::endl;
}

StackError::~StackError() {
    
}


class Stack {
 
    protected :
    
    typedef struct Element {
        struct Element *next;
        void *data;
    };
    
    Element* head;

    
public:
    Stack();
    ~Stack();
    void push(void* data);
    void *pop();
    void printAllElementsInStack();
    
    Element *findMToListElement(Element *head, int m);
    int findMToListElementByRecursive(Element *head, int m);
    Element* getHead();
    
};

Stack::Stack() {
    head = NULL;
    return;
}

Stack::~Stack() {
    
    while(head) {
        
        Element* next = head->next;
        delete head;
        head = next;
    }
    return;
}

void Stack::push(void *data) {
    
    Element* newElement = new Element;
    newElement->data = data;
    newElement->next = head;
    head = newElement;
    return;
    
}

void* Stack::pop() {

    if ( head == NULL )
        throw StackError(E_EMPTY);
    
    if (head != NULL) {
        Element* deletedElement = head;
        void * deletedData = deletedElement->data;
        head = head->next;
        delete deletedElement;
        
        return deletedData;
    } else {
        return NULL;
    }
}

Stack::Element* Stack::getHead() {
    return this->head;
}

void Stack::printAllElementsInStack() {

    while(head) {
        std::cout << *((int*)(head->data)) << std::endl;
        head = head->next;
    }
}

Stack::Element* Stack::findMToListElement(Stack::Element *head, int m) {
    
    Stack::Element *current = head;
    Stack::Element *mBehind;
    
    if (head == NULL) {
        return NULL;
    }
    
    for( int i =0; i < m; i++) {
        if (current->next) {
            current = current->next;
        } else {
            return NULL;
        }
    }
    
    mBehind = head;
    
    while(current->next) {
        current = current->next;
        mBehind = mBehind->next;
    }
    
    return mBehind;
}



int Stack::findMToListElementByRecursive(Stack::Element *current, int m) {
    
    int index = 0;
    
    if (current->next != NULL) {
        index = findMToListElementByRecursive(current->next, m) + 1;
    }
    
    if (index == m) {
        std::cout << *((int*)current->data) << std::endl;
    }
    
    return index;
}

int main(int argc, const char * argv[]) {
    
    Stack stack;
    int arr[5] = {1,2,3,4,5};
    
    stack.push(&arr[0]);
    stack.push(&arr[1]);
    stack.push(&arr[2]);
    stack.push(&arr[3]);
    stack.push(&arr[4]);
    
//    for(int i=0; i<sizeof(arr)/sizeof(int); i++) {
//        std::cout << *((int*)stack.pop()) << std::endl;
//    }
    
    // std::cout << *((int*)(stack.findMToListElement(stack.getHead(), 4)->data)) << std::endl;
    
    stack.findMToListElementByRecursive(stack.getHead(), 3);
    
    return 0;
}
