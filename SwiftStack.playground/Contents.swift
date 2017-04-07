//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Stack<T> {
  
  fileprivate var array:[T] = []
  
  
  mutating func push(_ element:T) {
    array.append(element)
  }
  
  mutating func pop()->T? {
    return array.popLast()
  }
  
  func peek()-> T? {
    return array.last
  }
  
  var isEmpty : Bool {
    return array.isEmpty
  }
  
  var count : Int {
    return array.count
  }
  
  
}



var rwBookStack = Stack<String>()

rwBookStack.push("3D Games by Tutorials")
rwBookStack.push("tvOS Apprentice")
rwBookStack.push("iOS Apprentice")
rwBookStack.push("Swift Apprentice")

//print(rwBookStack)
//rwBookStack.peek()
//rwBookStack.pop()
//rwBookStack.pop()

extension Stack : CustomStringConvertible {
  
  var description : String {
    
    let topDivider = "---Stack---\n"
    let bottomDivider = "\n-----------\n"
    
    let stackElements = array.map{"\($0)"}.reversed().joined(separator: "\n")
    
    return topDivider + stackElements + bottomDivider
  }
}


extension String {
  
  subscript(i:Int)->Character {
    return self[self.characters.index(self.characters.startIndex, offsetBy: i)]
  }
}

func isBalanced(sentence:String)->Bool {
  
  var parenthesisStack = Stack<Character>()

  for i in 0..<sentence.characters.count {
    
    let charInString = sentence[i]
    
    if charInString == "{" || charInString == "(" || charInString == "[" {
      
      parenthesisStack.push(charInString)
    
    } else if charInString == "]" {
      
      if parenthesisStack.isEmpty { return  false }
      if parenthesisStack.pop() != "[" { return false }
      
    } else if charInString == ")" {
      
      if parenthesisStack.isEmpty { return false }
      if parenthesisStack.pop() != "(" { return false }
      
    } else if charInString == "}" {
      
      if parenthesisStack.isEmpty { return  false }
      if parenthesisStack.pop() != "{" { return false }
      
    }
  }
  
  return parenthesisStack.isEmpty
}

isBalanced(sentence:"(kjds(hfkj)sdhf)")
isBalanced(sentence:"(sfdsf)(fsfsf")
isBalanced(sentence:"{[]}()")
isBalanced(sentence:"{[}]")
isBalanced(sentence:"a(bcd)d")
isBalanced(sentence:"()(){}{}{()}")
isBalanced(sentence:"((({}{}))()")
isBalanced(sentence:"{(a,b)}")
isBalanced(sentence:"{(a},b)")
isBalanced(sentence:"{)(a,b}")



//print(parenthesisStack)

  
  
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

    sumAfter -= elem
    
    if sumBefore == sumAfter {
      return idx
    }
    sumBefore += elem
  }
  
  
  return -1
}

solution(&A)





