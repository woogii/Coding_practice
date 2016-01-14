
#ifndef __AL_GRAPH__
#define __AL_GRAPH__

#include "DLinkedList.h"
#include "ArrayBaseStack.h"

enum { A,B,C,D,E,F,G,H,I,J };

typedef struct _ual {

	int numOfVertex;
	int numOfEdge;
	List* adjList;
	int* visitInfo;
	ArrayStack* stack;

} ALGraph;

// Initialize the graph 
void GraphInit(ALGraph* pg, int numOfVertex);

// Deallocate the graph 
void GraphDestroy(ALGraph *pg);

// Add edges 
void AddEdge(ALGraph* pg, int fromV, int toV);

// Print the information of the vertex 
void ShowGraphEdgeInfo(ALGraph* pg);

// DFS search
void DFShowGraphVertex(ALGraph* pg, int startV);

#endif 