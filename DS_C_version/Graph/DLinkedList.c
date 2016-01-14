//
//  DLinkedList.c
//  LinkedList
//
//  Created by Hyun on 2015. 9. 13..
//  Copyright (c) 2015년 Hyun. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

#include "DLinkedList.h"

void ListInit(List* plist)
{
    plist->head = (Node*)malloc(sizeof(Node));
    plist->head->next = NULL;
    plist->comp = NULL;
    plist->numOfData = 0;

}

void LInsert(List* plist, LData data)
{
    if (plist->comp == NULL)
    {
        FInsert(plist, data);
    }
    else
    {
        SInsert(plist, data);
    }
}

void FInsert(List* plist, LData data)
{
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    
    newNode->next = plist->head->next;
    plist->head->next = newNode;
    
    (plist->numOfData)++;
}

void SInsert(List* plist, LData data)
{
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    
    Node* pred = plist->head;
    
    if (pred->next == NULL)
    {
        plist->head->next = newNode;
        newNode->next = NULL;
    }
    else
    {
        while (pred->next != NULL &&  plist->comp(data , pred->next->data) != 0 )
        {
            pred = pred->next;
        }
    
        newNode->next = pred->next;
        pred->next = newNode;
    }
    
    (plist->numOfData)++;
}

int LFirst(List* plist, LData * pdata)
{
    if (plist->head->next == NULL)
        return FALSE;

    plist->before = plist->head;
    plist->cur  = plist->head->next;
    
    *pdata = plist->cur->data;
    return TRUE;
}

int LNext(List* plist, LData* pdata)
{
    if (plist->cur->next == NULL)
        return FALSE;
    
    plist->before = plist->cur;
    plist->cur    = plist->cur->next;
    
    *pdata = plist->cur->data;
    return TRUE;
}

LData LRemove(List* plist)
{
    Node* tempNode = plist->cur;
    LData data = tempNode->data;
  
    plist->before->next = plist->cur->next;
    plist->cur = plist->before;
  
    free(tempNode);
    (plist->numOfData)--;
    
    return data;
}

int LCount(List* plist)
{
    return plist->numOfData;
}


void SetSortRule(List* plist, int (*comp)(LData d1, LData d2))
{
    plist->comp = comp;
}
