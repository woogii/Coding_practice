//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node {
  
  var operation : String?
  var value: Float?
  var leftChild : Node?
  var rightChild : Node?
  
  init(operation:String?, value:Float?, leftChild:Node?, rightChild: Node?) {
    self.operation = operation
    self.value = value
    self.leftChild = leftChild
    self.rightChild = rightChild
  }
}


// 25 * 6 + 5

//    +
//   + 5
// 25 6

let sixNode = Node(operation: nil, value: 6, leftChild: nil, rightChild: nil)
let fiveNode = Node(operation: nil, value: 5, leftChild: nil, rightChild: nil)
let twentyFiveNode = Node(operation: nil, value: 25, leftChild: nil, rightChild: nil)

let mult25_6Node = Node(operation: "*", value: nil, leftChild: twentyFiveNode, rightChild: sixNode)

let rootPlusNode = Node(operation: "+", value: nil, leftChild: mult25_6Node, rightChild: fiveNode)


func evaluate(node:Node)-> Float {

  if node.value != nil {
    return node.value!
  }
  
  if node.operation == "+" {
    return evaluate(node: node.leftChild!) + evaluate(node:node.rightChild!)
  } else if node.operation == "*" {
    return evaluate(node: node.leftChild!) * evaluate(node:node.rightChild!)
  } else if node.operation == "-" {
    return evaluate(node: node.leftChild!) - evaluate(node:node.rightChild!)
  } else if node.operation == "/" {
    return evaluate(node: node.leftChild!) / evaluate(node:node.rightChild!)
  }
  
  return 0
}

evaluate(node: rootPlusNode)

func performBinaryOperation(operation: String) -> (Float, Float) -> Float {
  
  switch operation {
  case "+":
    return { $0 + $1 }
  case "-":
    return { $0 - $1 }
  case "*":
    return { $0 * $1 }
  case "/":
    return {(lhs: Float, rhs: Float) -> Float in
      if rhs == 0 {
        fatalError("Divide by zero")
      }
      else {
        return lhs / rhs
      }
    }
  default:
    fatalError("Invalid Operator: \"\(operation)\"")
  }
}


func evaluateFuctionally(node: Node) -> Float {
  
  if node.value != nil {
    return node.value!
  }
  
  let performBinaryOperationOn = performBinaryOperation(operation: node.operation!)
  return performBinaryOperationOn(evaluateFuctionally(node: node.leftChild!), evaluateFuctionally(node: node.rightChild!))
}


evaluateFuctionally(node: rootPlusNode)