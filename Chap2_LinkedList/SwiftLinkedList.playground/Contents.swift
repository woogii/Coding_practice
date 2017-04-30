//: Playground - noun: a place where people can play

import UIKit

//public class Node {
//
//  var value:String
//  var next:Node?
//  weak var previous : Node?
//  
//  init(value:String) {
//    self.value = value
//  }
//  
//}
//
//
//public class LinkedList {
//  
//  fileprivate var head: Node?
//  private var tail: Node?
//  
//  public var isEmpty: Bool {
//    return head == nil
//  }
//  
//  public var first: Node? {
//    return head
//  }
//  
//  public var last: Node? {
//    return tail
//  }
//
//  public func append(value: String) {
//    
//    let newNode = Node(value: value)
//    
//    if let tailNode = tail {
//      newNode.previous = tailNode
//      tailNode.next = newNode
//    }else {
//      head = newNode
//    }
//    
//    tail = newNode
//  }
//
//}

//let dogBreeds = LinkedList()
//dogBreeds.append(value: "Labrador")
//dogBreeds.append(value: "Bulldog")
//dogBreeds.append(value: "Beagle")
//dogBreeds.append(value: "Husky")


class Node<T> {
  
  var element:T?
  var next:Node<T>?
  
  init(element:T) {
    self.element = element
  }
}


public class LinkedList<T>  {
  
  var head:Node<T>?
  var tail:Node<T>?
  
  func isEmpty()-> Bool {
    return head == nil
  }
  
  func append(newNode:Node<T>) {
    
    if let tailNode = tail {
      
      tailNode.next = newNode
      
    } else {
      
      head = newNode
    }
    
    tail = newNode
  }
  
  
  
}



var linkedList = LinkedList<String>()
var apple  = Node(element: "apple")
var banana = Node(element: "banana")
var kiwi   = Node(element: "kiwi")
var orange = Node(element: "orange")
var peach   = Node(element: "peach")

linkedList.append(newNode: apple)
linkedList.append(newNode: banana)
linkedList.append(newNode: kiwi)
linkedList.append(newNode: orange)
linkedList.append(newNode: peach)

extension LinkedList : CustomStringConvertible {
  
  public var description : String {
    
    var text = "["
    var node = head
    
    while node != nil {
      text += "\(node!.element!)"
      node = node!.next
      
      if node != nil {
        text += ", "
      }
    }
    
    text += "]"
    
    return text
  }
}

linkedList


func printNthElementFromLast<T>(node:Node<T>?, N:Int)->Int {
  
  if node == nil {
    return 0
  }
  
  let index = printNthElementFromLast(node: node?.next, N: N) + 1
  
  if index == N {
    print("\(node?.element!)")
  }
  
  return index
  
}

printNthElementFromLast(node: linkedList.head, N: 3)

var head = Node(element: "apple")

func reverseLinkedListRecursive<T>(list:LinkedList<T>, prev:Node<T>?, curr:Node<T>?) {
  
  if prev == nil {
    list.tail = curr
  }
  
  if curr != nil {
    reverseLinkedListRecursive(list: list, prev: curr, curr: curr?.next)
    curr?.next = prev
  } else {
    list.head = prev
  }
}

linkedList.head?.element
linkedList.tail?.element

reverseLinkedListRecursive(list:linkedList, prev: nil, curr: linkedList.head)
linkedList
linkedList.head?.element
linkedList.tail?.element