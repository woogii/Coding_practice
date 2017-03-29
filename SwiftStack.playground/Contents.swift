//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Stack {
  
  fileprivate var array:[String] = []
  
  
  mutating func push(_ element:String) {
    array.append(element)
  }
  
  mutating func pop()->String? {
    return array.popLast()
  }
  
  func peek()-> String? {
    return array.last
  }
  
  
}



var rwBookStack = Stack()

rwBookStack.push("3D Games by Tutorials")
rwBookStack.push("tvOS Apprentice")
rwBookStack.push("iOS Apprentice")
rwBookStack.push("Swift Apprentice")

print(rwBookStack)
//rwBookStack.peek()
//rwBookStack.pop()
//rwBookStack.pop()

extension Stack : CustomStringConvertible {
  
  var description : String {
    
    let topDivider = "---Stack---\n"
    let bottomDivider = "\n-----------\n"
    
    let stackElements = array.reversed().joined(separator: "\n")
    
    return topDivider + stackElements + bottomDivider
  }
}

var A = [Int]()

A.append(-1)
A.append(3)
A.append(-4)
A.append(5)
A.append(1)
A.append(-6)
A.append(2)
A.append(1)

func solution(_ A : inout [Int]) -> Int {
  // write your code in Swift 3.0 (Linux)
  
  var sumBefore = 0
  var sumAfter = A.reduce(0, +)
  
  //print("sumAfter : \(sumAfter)")
  
  for (idx, elem) in A.enumerated() {
    
    //print(idx)
    //print(elem)
    sumAfter -= elem
    
    if sumBefore == sumAfter {
      return idx
    }
    sumBefore += elem
  }
  
  
  return -1
}

solution(&A)





