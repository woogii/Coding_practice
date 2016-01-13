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
