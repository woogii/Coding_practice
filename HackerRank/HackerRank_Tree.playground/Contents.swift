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



class BinaryNode {
  
  var value:Int
  var left:BinaryNode?
  var right:BinaryNode?
  
  init(value:Int) {
    self.value = value
  }
}




class BinaryTree {
  
  func insert(root:BinaryNode?, value:Int)->BinaryNode? {
    
    guard root != nil else {
      return BinaryNode(value: value)
    }
    
    if value <= root!.value {
      root?.left = insert(root: root?.left, value: value)
    } else if value > root!.value {
      root?.right = insert(root: root?.right, value: value)
    }
    
    return root
  }
  
  func getHeight(root:BinaryNode?)->Int {
    
    if root == nil {
      return -1
    }
    
    let leftHeight = getHeight(root: root?.left)
    let rightHeight = getHeight(root: root?.right)
    return max(leftHeight, rightHeight) + 1
    
  }
  
  
}


var binaryTree = BinaryTree()

let binaryTreeRoot = binaryTree.insert(root: nil, value: 4)

binaryTree.insert(root: binaryTreeRoot, value: 2)
binaryTree.insert(root: binaryTreeRoot, value: 7)
binaryTree.insert(root: binaryTreeRoot, value: 1)
binaryTree.insert(root: binaryTreeRoot, value: 3)
binaryTree.insert(root: binaryTreeRoot, value: 6)

print(binaryTree.getHeight(root: binaryTreeRoot))

print("===========")
func inOrderTraverse(root:BinaryNode?) {
  
  if root != nil {
    print(root?.value ?? 0)
    inOrderTraverse(root: root?.left)
    inOrderTraverse(root: root?.right)
  }
  
  return
}

inOrderTraverse(root:binaryTreeRoot)

