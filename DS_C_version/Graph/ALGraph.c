#include "ALGraph.h"
#include <stdio.h>
#include <stdlib.h>

int WhoIsPrecede(int num1, int num2) 
{
	if(num1 > num2) 
	{
		return 1;
	} 
	else 
	{
		return 0;
	}
}

// Initialize the graph 
void GraphInit(ALGraph* pg, int numOfVertex)
{
	int i;
	pg->numOfVertex = numOfVertex;
	pg->numOfEdge = 0;

	pg->adjList = (List*)malloc(sizeof(List)*numOfVertex);
	// Integer type array to store visited vertex information
	pg->visitInfo = (int*)malloc(sizeof(int)*numOfVertex);

	for(i=0; i < numOfVertex; i++)
	{
		ListInit(&(pg->adjList[i]));
		SetSortRule(&(pg->adjList[i]), WhoIsPrecede);
	}	
}

// Deallocate the graph 
void GraphDestroy(ALGraph *pg)
{
	if(pg->adjList != NULL) 
		free(pg->adjList);

	if(pg->visitInfo != NULL)
		free(pg->visitInfo);
}

// Add edges 
void AddEdge(ALGraph* pg, int fromV, int toV)
{
	// Add vertex 'toV' into the list of v
	LInsert(&(pg->adjList[fromV]), toV);
	LInsert(&(pg->adjList[toV]), fromV);

	pg->numOfEdge++;
}

// Print the information of the vertex 
void ShowGraphEdgeInfo(ALGraph* pg)
{
	int i;
	int data;

	for(i= 0; i< pg->numOfVertex; i++)
	{
		printf( "Vertices which are connected with %c : ", i+65);
		if(LFirst(&(pg->adjList[i]),&data)) 
		{
			printf( "%c, ", data+65);

			while(LNext(&(pg->adjList[i]),&data))
			{
				printf("%c ", data+65);
			}
		}
		printf("\n");
	}
}

int VisitVirtex(ALGraph* pg, int visitV) 
{
	if(pg->vistiInfo[visitV] == 0)
	{
		pg->visitInfo[visitV] = 1;
		printf("%c ", visitV + 65);
		return TRUE;
	}
	return FALSE;
}

void DFShowGraphVertex(ALGraph* pg, int startV)
{
	Stack stack;
	int visitV = startV;
	int nextV;

	StackInit(&stack);
	VisitVirtex(pg, visitV);
	SPush(&stack, visitV);

	while( LFirst(&(pg->adjList[visitV], &nextV)) == TRUE ) 
	{
		int visitFlag = FALSE;

		if(VisitVirtex(pg, nextV) == TRUE)  // if nextV is the virtex that was visited 
		{
			SPush(&stack, nextV);			// Push nextV in the stack
			visitV = nextV;
			visitFlag = TRUE;
		}
		else	// if nextV is not the virtex that was visited before   
		{
			while(LNext(&(pg->adjList[visitV],&nextV)) == TRUE)
			{
				if( VisitVirtex(pg, nextV) == TRUE) 
				{
					SPush(&stack, visitV);
					visitV = nextV;
					visitFlag = TRUE;
					break;
				}
			}

		}

		if(visitFlag == FALSE)
		{
			if(SIsEmpty(&stack) == TRUE)
				break;
			else 
				visitV = SPop(&stack);
		}

	}


	memset(pg->visitInfo, 0, sizeof(int) * pg->numV);

}
