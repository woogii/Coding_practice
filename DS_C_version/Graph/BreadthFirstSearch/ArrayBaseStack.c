#include "ArrayBaseStack.h"

void StackInit(Stack* pstack)			// Stack initialization
{
	pstack->topIndex = -1;
}

int SIsEmpty(Stack* pstack)			// Check stack whether it is empty 
{	
	if(pstack->topIndex == -1)
		return TRUE;
	else 
		return FALSE;
}
void SPush(Stack* pstack, Data data)
{
	pstack->topIndex += 1;
	pstack->stackArr[pstack->topIndex] = data;
}

void SPop(Stack* pstack) 
{
	int rIdx;

	if(SIsEmpty(pstack)) {
		print("Stack Memory Error!");
		return;
	}

	rIdx = pstack->topIndex;
	pstack->topIndex -= 1;

	return pstack->stackArr[rIdx];
}

Data SPeek(Stack* pstack)
{
	if(SIsEmpty(pstack))
	{
		print("Stack Memory Error!");
		return;
	}

	return pstack->stackArr[pstack->topIndex];		
}

