#include <stdio.h>
#include "ALGraph.h"

int main(void)
{
	ALGraph graph;

	GraphInit(&graph, 5);

	AddEdge(&graph, A, B);
	AddEdge(&graph, A, D);
	AddEdge(&graph, B, C);
	AddEdge(&graph, C, D);
	AddEdge(&graph, D, E);
	AddEdge(&graph, E, A);

	ShowGraphEdgeInfo(&graph);

	DFShowGraphVertex(&graph, A); printf("\n");
	DFShowGraphVertex(&graph, C); printf("\n");
	DFShowGraphVertex(&graph, E); printf("\n");
	DFShowGraphVertex(&graph, G); printf("\n");

	GraphDestroy(&graph);

	printf("change.....");

	return 0;
}