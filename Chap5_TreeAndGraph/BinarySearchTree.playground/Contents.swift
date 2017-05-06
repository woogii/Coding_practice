//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public class BinarySearchTree<T: Comparable> {
  
  private(set) public var value: T
  private(set) public var parent: BinarySearchTree?
  private(set) public var left: BinarySearchTree?
  private(set) public var right: BinarySearchTree?
  
  public init(value:T) {
    self.value = value
  }
  
  public var isRoot:Bool {
    return parent == nil
  }
  
  public var isReaf: Bool {
    return left == nil && right == nil
  }
  
  public var isLeftChild:Bool {
    return parent?.left === self
  }
  
  public var isRightChild:Bool {
    return parent?.right === self
  }
  
  public var hasLeftChild:Bool {
    return left != nil
  }
  
  public var hasRightChild:Bool {
    return right != nil
  }
  
  public var hasAnyChild:Bool {
    return hasLeftChild || hasRightChild
  }
  
  public var hasBothChild:Bool {
    return hasLeftChild && hasRightChild
  }
  
  public var count : Int {
    return (left?.count ?? 0) + 1 + (right?.count ?? 0)
  }
  
  public func insert(value:T) {

      if value < self.value {
        if let left = left {
          left.insert(value: value)
        } else {
          left = BinarySearchTree(value: value)
          left?.parent = self
        }
      } else {
        if let right = right {
          right.insert(value: value)
        } else {
          right = BinarySearchTree(value: value)
          right?.parent = self
        }
      }
  }
  
  
}



let tree = BinarySearchTree<Int>(value: 7)
tree.insert(value: 2)
tree.insert(value: 5)
tree.insert(value: 10)
tree.insert(value: 9)
tree.insert(value: 1)


//func checkBST(tree:BinarySearchTree<Int>)->Bool {
//  
//  
//  checkBST(tree: tree.left!)
//  
//  if tree.isRoot {
//    
//  }
//  
//  checkBST(tree: tree.right!)
//}
//

