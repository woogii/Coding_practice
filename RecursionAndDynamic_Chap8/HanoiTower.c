#include <stdio.h>

void HanoiTowerMove(int num, char from, char by, char to);

int main()
{
	int num = 3;

	HanoiTowerMove(num, 'A', 'B', 'C');
	
	return 0;
}

void HanoiTowerMove(int num, char from, char by, char to)
{
	if(num == 1) 
	{
		printf("Move disc 1 from %c to %c\n", from, to);
	}
	else 
	{
		HanoiTowerMove(num-1, from, to, by);
		printf("Move disc %d from %c to %c\n", num, from, to);
		HanoiTowerMove(num-1, by, from, to);
	}
}