//: Playground - noun: a place where people can play

import UIKit

let array = [7,2,6,3,9]


func mergeSort<T:Comparable>(_ array: [T])->[T] {
  
  guard array.count > 1 else { return array }
  
  let middleIndex = array.count / 2
  
  let leftArray = mergeSort(Array(array[0..<middleIndex]))
  let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
  
  return merge(leftArray, rightArray)
}

func merge<T:Comparable>(_ left:[T], _ right:[T]) -> [T] {
  
  print("left: \(left)")
  print("right: \(right)")
  var leftIndex = 0
  var rightIndex = 0
  
  var orderedArray:[T] = []
  
  while leftIndex < left.count && rightIndex < right.count {
    
    if left[leftIndex] < right[rightIndex] {
      orderedArray.append(left[leftIndex])
      leftIndex += 1
    } else if left[leftIndex] > right[rightIndex] {
      orderedArray.append(right[rightIndex])
      rightIndex += 1
    } else {
      orderedArray.append(left[leftIndex])
      leftIndex += 1
      orderedArray.append(right[rightIndex])
      rightIndex += 1
    }
    
  }
  
  while leftIndex < left.count {
    orderedArray.append(left[leftIndex])
    leftIndex += 1
  }
  
  while rightIndex < right.count {
    orderedArray.append(right[rightIndex])
    rightIndex += 1
  }
  
  
  return orderedArray
  
}

mergeSort(array)
