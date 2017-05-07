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
  
  public convenience init(array:[T]) {
    precondition(array.count > 0)
    
    self.init(value: array.first!)
    
    for v in array.dropFirst() {
      print("value :\(v)")
      insert(value: v)
    }
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
        left = BinarySearchTree(value:value)
        left?.parent = self
      }
      
    } else {
      
      if let right = right {
        right.insert(value: value)
      } else {
        right = BinarySearchTree(value:value)
        right?.parent = self
      }
    }
    
  }
  
  public func searchRecursive(value: T) -> BinarySearchTree? {
  
    if value == self.value {
      return self
    } else if value < self.value {
      return left?.searchRecursive(value: value)
    } else {
      return right?.searchRecursive(value: value)
    }
  
  }
  
  public func searchIterative(value: T) -> BinarySearchTree? {
    
    var node:BinarySearchTree? = self
    
    while case let n? = node {
      
      if value < n.value {
        node = n.left
      } else if value > n.value {
        node = n.right
      } else {
        return node
      }
    }
    
    return nil
  }

  public func traverseInOrder(process:(T)->Void) {
    left?.traverseInOrder(process: process)
    process(value)
    right?.traverseInOrder(process: process)
  }
  
  public func traversePostOrder(process:(T)->Void) {
    
    left?.traversePostOrder(process: process)
    right?.traversePostOrder(process: process)
    process(value)
  }
  
  public func traversePreOrder(process:(T)->Void) {
    process(value)
    left?.traversePreOrder(process: process)
    right?.traversePreOrder(process: process)
  }
}



let point = (3, 2)
switch point {
// Bind x and y to the elements of point.
case let (x, y):
  print("The point is at (\(x), \(y)).")
}


//var tree = BinarySearchTree<Int>(array:[7,2,5,10,9,1])
var tree = BinarySearchTree<Int>(array:[1,5,10,15,25,30])

print("InOrder traverse")
tree.traverseInOrder { value in
  print("\(value) ", separator: "", terminator: "")
}

print("\nPreOrder traverse")
tree.traversePreOrder { value in
  print("\(value) ", separator: "", terminator: "")
}

print("\nPostOrder traverse")
tree.traversePostOrder { value in
  print("\(value) ", separator: "", terminator: "")
}


//tree.insert(value: 2)
//tree.insert(value: 5)
//tree.insert(value: 10)
//tree.insert(value: 9)
//tree.insert(value: 1)
tree.searchRecursive(value:9)?.value

print("\n====================Check BST==============================")


var treeValue = [Int]()

func copyBST<T>(tree:BinarySearchTree<T>?) {
  
  if tree != nil {
    
    copyBST(tree: tree?.left)
    treeValue.append(tree?.value as! Int)
    copyBST(tree: tree?.right)
  }
}


func checkBST()->Bool{
  
  copyBST(tree: tree)
  
  print(treeValue.count)
  
  for i in 1..<treeValue.count  {
    

    if treeValue[i-1] > treeValue[i] {
      return false
    }
  }
  
  return true
}

checkBST()

let bstInputArray = [1,5,10,15,25,30,40]

var secondTree: BinarySearchTree<Int>?  //(value:inputArray.first!)

func createMinimumHeightTree(treeArray:[Int], low:Int, high:Int) {
  
  let mid = (low + high)/2

  print("low, high : \(low) \(high)")
  
  // Base case
  if low > high {
    return
  }

  if secondTree == nil {
    secondTree = BinarySearchTree<Int>(value: treeArray[mid])
    print("inserted first value : \(treeArray[mid])")
  } else {
    print("inserted value : \(treeArray[mid])")
    secondTree!.insert(value: treeArray[mid])
  }
  
  createMinimumHeightTree(treeArray: treeArray,low: low, high: mid-1)
  createMinimumHeightTree(treeArray: treeArray,low: mid + 1, high: high)
  
}


print("\n====================Create Minimum Height==============================")

createMinimumHeightTree(treeArray: bstInputArray, low: 0, high: bstInputArray.count - 1)

secondTree?.traverseInOrder { value in
  print("\(value) ", separator: "", terminator: "")
}

