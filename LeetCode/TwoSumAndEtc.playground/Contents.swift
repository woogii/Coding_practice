//: Playground - noun: a place where people can play

import UIKit


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

//  1. brute force search
  
//  var indices = [Int]()
//  var remain:Int
//  
//  for i in 0..<nums.count {
//    
//    indices = []
//    indices.append(nums[i])
//    remain = target - nums[i]
//
//    for j in 0..<nums.count {
//      
//      if i != j {
//        if remain - nums[j] == 0 {
//          indices.append(nums[j])
//          return indices
//        }
//      }
//      
//    }
//  }
//  
//  return indices
  
  var dict = [Int:Int]()
  
  //  2. Use Hash
  
//  for i in 0..<nums.count {
//    dict[nums[i]] = i
//  }
//  
//  print(dict)
//  
//  for i in 0..<nums.count {
//    
//    let remain = target-nums[i]
//    
//    if let index = dict[remain], index != i {
//      return [index, i]
//    }
//
//    
//    
//  }
//  
  for i in 0..<nums.count {
    
    let remain = target-nums[i]
    
    if let _ = dict[remain]  {
      return [dict[remain]! , i]
    }
    
    dict[nums[i]] = i
    
  }

 
  return [Int]()
}


let numbers = [2,7,15,20]
let target = 9

print(twoSum(numbers, target))

public class ListNode {
  
  public var val: Int
  public var next: ListNode?
  
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
  
}

extension ListNode : CustomStringConvertible {
  
  public var description : String  {
    
    var text = "[\(self.val),"
    
    var node = self.next
    
    while node != nil {
      
      text += "\(node!.val),"
      node = node!.next
    }
    
    text.remove(at: text.index(before: text.endIndex))
    text += "]"
    return text
  }
}


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

  var mutableL1 = l1
  var mutableL2 = l2
  let initialL3:ListNode = ListNode(0)
  var l3 = initialL3
  var carry = 0
  
  while(mutableL1 != nil || mutableL2 != nil) {
  
    l3.next = ListNode(0)
    l3 = l3.next!
    
    var sum = carry
    if let val1 = mutableL1?.val {
      sum += val1
    }
    
    if let val2 = mutableL2?.val {
      sum += val2
    }
    
    l3.val = sum%10
    carry = sum/10
    
    mutableL1 = mutableL1?.next
    mutableL2 = mutableL2?.next
    
  }
  
  if carry > 0 {
    l3.next = ListNode(1)
  }
  
  return initialL3.next
  
}


var node1 = ListNode(1)


var node2 = ListNode(9)
var node3 = ListNode(9)
node2.next = node3

addTwoNumbers(node1, node2)



