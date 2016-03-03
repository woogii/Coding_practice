
#include <iostream>

typedef struct _node 
{
	int data;
	struct _node* next;

} Node;

void insert(Node** head, int value)
{
	Node* tmp = (*head);
	(*head) = (Node*)malloc(sizeof(Node));
	(*head)->data = value;
	(*head)->next = tmp;
}

void print(Node** head)
{
	Node* curr = (*head);

	if(curr == NULL) 
		return;

	while( curr->next != NULL) 
	{
		std::cout << curr->data << " ";
		curr = curr->next;
	}
	std::cout << curr->data << " ";
	std::cout << std::endl;
}

void reverse(Node** head)
{
	Node* pred = NULL;
	Node* curr = (*head);
	Node* tmp;

	while(curr->next != NULL)
	{
		tmp = curr;
		curr = curr->next;
		tmp->next = pred;
		pred = tmp;
		
	}
	curr->next = pred;
	(*head) = curr;
	
}


int main()
{
	Node* head = NULL;

	insert(&head, 1);
	insert(&head, 2);
	insert(&head, 3);
	insert(&head, 4);
	insert(&head, 5);

	print(&head);
	reverse(&head);
	print(&head);

	reverse(&head);
	print(&head);


	return 0;
}