//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Start of Node class
class Node {
  var data: Int
  var left: Node?
  var right: Node?
  
  init(d : Int) {
    data  = d
  }
} // End of Node class

// Start of Tree class
class Tree {
  
  var height = 0
  var heightCal = -1
  var leftHeight = 0
  var rightHeight = 0
  
  func insert(root: Node?, data: Int) -> Node? {
    
    
    if root == nil {
      return Node(d: data)
    }
    
    if data <= (root?.data)! {
      root?.left = insert(root: root?.left, data: data)
    } else {
      root?.right = insert(root: root?.right, data: data)
    }
    
    return root
  }

  func getHeight(root: Node?) -> Int {
   
    if root == nil {
      
      return -1
      
    } else {
      
      return max(getHeight(root: root?.left),getHeight(root: root?.right)) + 1
      
    }
    
  }
  
  
}

var root: Node?
var tree = Tree()

let t = 5

for _ in 0..<t {
  root = tree.insert(root: root, data: t)
}

//tree.insert(root: root, data: 1)
//tree.insert(root: root, data: 7)
print(tree.getHeight(root: root))

