//: Playground - noun: a place where people can play

import UIKit

public struct Queue<T> {
 
  fileprivate var list = LinkedList<T>()
  
  public var isEmpty:Bool {
    return list.isEmpty
  }
  
  public mutating func enqueue(_ element:T) {
    list.append(element)
  }
  
  public mutating func dequeue()->T? {
    if let head = list.first {
      list.remove(head)
      return head.value
    }
    return nil
  }
  
  public func peek()->T?{
    if let node = list.first {
      return node.value
    }
    return nil
  }
}

extension Queue:CustomStringConvertible {
  
  public var description:String {
    return list.description
  }
  
}

var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(3)
queue.enqueue(57)


var queue2 = Queue<String>()
queue2.enqueue("mad")
queue2.enqueue("lad")
if let first = queue2.dequeue() {
  print(first)
}
print(queue2)


