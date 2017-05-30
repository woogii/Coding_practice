//: Playground - noun: a place where people can play

import UIKit
import Foundation

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


extension String {
  
  func charAt(index:Int)-> Character {
    return self[self.characters.index(self.characters.startIndex, offsetBy: index)]
  }
}

extension Character {
  var asciiValue: UInt32? {
    return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
  }
}

//var str = "bca"
//print(str.index(str.startIndex, offsetBy: 1))
//str[str.index(str.startIndex, offsetBy: 2)]

var arr = [Int].init(repeating: 3, count: 0)
//print(arr[0])

func getLengthOfLongestSubstring(str:String) -> Int {
  
  var dict = [Character:Int]()
  var substringLen = 0
  var j = 0
  
  guard str.characters.count > 0 else {
    return 0
  }
  
//  var cache = [Int].init(repeating: 0, count: 256)
//  cache.reserveCapacity(256)
//  
//  for i in 0..<str.characters.count {
//    
//    if let value = str.charAt(index: i).asciiValue {
//      
//      j = (cache[Int(value)] > 0) ? max(j, cache[Int(value)]) : j
//    
//      cache[Int(value)] = i + 1
//      substringLen = max(substringLen, i - j + 1)
//    }
//  }

  
  for i in 0..<str.characters.count {
    
    if let _ = dict[str[str.index(str.startIndex, offsetBy: i)]] {
      j = max(j, dict[str[str.index(str.startIndex, offsetBy: i)]]! + 1)
    }
    
    dict[str[str.index(str.startIndex, offsetBy: i)]] = i
    substringLen = max(j, i-j+1)
  }
  
  return substringLen
}

getLengthOfLongestSubstring(str:"aab")

// var dict = [Character:Int]()
// var substringLen = 0
// var j = 0

// guard s.characters.count > 0 else {
//     return 0
// }

// for i in 0..<s.characters.count {

//     if let _ = dict[s.charAt(index: i)] {
//         j = max(j, dict[s.charAt(index: i)]! + 1)
//     }

//     dict[s.charAt(index: i)] = i
//     substringLen = max(substringLen, i-j+1)
// }

// return substringLen

//int result = 0;
//int[] cache = new int[256];
//for (int i = 0, j = 0; i < s.length(); i++) {
//  j = (cache[s.charAt(i)] > 0) ? Math.max(j, cache[s.charAt(i)]) : j;
//  cache[s.charAt(i)] = i + 1;
//  result = Math.max(result, i - j + 1);
//}
//return result;

// 7. Reverse Integer

func reverse(_ x: Int)-> Int {
  
  var result:Int32 = 0
  var mutableX = x
  var modValue:Int
  
  while(mutableX != 0) {
    
    modValue = mutableX % 10
    mutableX = mutableX / 10
    print(Int32.max)
    if result >= (Int32.min/10) && result <= (Int32.max/10) {
      
      result = result * 10
      print("result : \(result)")
      let addResult = Int32.addWithOverflow(Int32(modValue), result)
      
      if !addResult.overflow {
        result = modValue + result
      }
    } else {
      return 0
    }
  }
  

  return Int(result)
}

// print(reverse(1534236469))
print(reverse(1463847412))


func isPalindrome(_ x: Int)->Bool {
  
  var origin = x
  var div = 1
  var divideVal:Int
  var modValue:Int
  
  if x < 0 {
    return false
  }
  
  while(origin/div >= 10) {
    div = div * 10
  }
  
  while( origin != 0) {
    
    divideVal = origin / div
    modValue = origin % 10
    
    if divideVal != modValue {
      return false
    }
    
    origin = (origin % div)/10
    div /= 100
  }
  
  return true
}

isPalindrome(121)
isPalindrome(1331)
isPalindrome(1213)




