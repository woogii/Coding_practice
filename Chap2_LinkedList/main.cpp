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

class Stack {
    
public:
    Stack();
    ~Stack();
    void push(void* data);
    void *pop();
    void printAllElementsInStack();
    
    protected :
    
    typedef struct Element {
        struct Element *next;
        void *data;
    };
    
    Element* head;
    
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

void Stack::printAllElementsInStack() {

    while(head) {
        std::cout << *((int*)(head->data)) << std::endl;
        head = head->next;
    }
}

int main(int argc, const char * argv[]) {
    
    Stack stack;
    int arr[5] = {1,2,3,4,5};
    
    stack.push(&arr[0]);
    stack.push(&arr[1]);
    stack.push(&arr[2]);
    stack.push(&arr[3]);
    stack.push(&arr[4]);
    
    for(int i=0; i<sizeof(arr)/sizeof(int); i++) {
        std::cout << *((int*)stack.pop()) << std::endl;
    }
    
    return 0;
}
