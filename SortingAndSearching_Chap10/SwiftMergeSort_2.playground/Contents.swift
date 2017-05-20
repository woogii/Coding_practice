//: Playground - noun: a place where people can play

import UIKit

let array = [7,2,6,3,9]

func mergeSort<T:Comparable>(with array:[T])->[T] {
  
  if array.count == 1 {
    return array
  }
  
  let mid = array.count/2
  
  let onePart = mergeSort(with: Array(array[0...mid-1]))
  let theOtherPart = mergeSort(with: Array(array[mid...array.count-1]))
  return merge(onePart: onePart, theOtherPart: theOtherPart)
  
}

func merge<T:Comparable>(onePart:[T], theOtherPart:[T])->[T]{
  
  var mergedArray = [T]()
  var i = 0
  var j = 0
  
  while(i < onePart.count && j < theOtherPart.count ) {
    
    if onePart[i] <= theOtherPart[j] {
      mergedArray.append(onePart[i])
      i += 1
    } else {
      mergedArray.append(theOtherPart[j])
      j += 1
    }
  
  }
  
  if i < onePart.count  {
    
    while i < onePart.count  {
      mergedArray.append(onePart[i])
      i += 1
    }
  }
  
  if j < theOtherPart.count {
    
    while j < theOtherPart.count  {
      mergedArray.append(theOtherPart[j])
      j += 1
    }
    
  }
  
  
  return mergedArray
}

print(mergeSort(with: array))



