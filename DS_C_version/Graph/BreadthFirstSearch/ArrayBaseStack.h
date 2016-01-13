#ifndef __AB_STACK_H__
#define __AB_STACK_H__

#define TRUE 		1
#define FALSE		0
#define STACK_LEN	100 

typedef int Data;

typedef struct _arrayStack 
{
	Data stackArr[STACK_LEN];
	int topIndex;
} ArrayStack;

typedef ArrayStack Stack;

void StackInit(Stack* pstack);			// Stack initialization
int SIsEmpty(Stack* pstack);			// Check stack whether it is empty 
void SPush(Stack* pstack, Data data);   // Stack push operation 
void SPop(Stack* pstack);				// Stack pop operation
Data SPeek(Stack* pstack);				// Peek operation

#endif 