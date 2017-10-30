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
  
  //  for i in 0..<str.characters.count {
  //
  //    if let _ = dict[str[str.index(str.startIndex, offsetBy: i)]] {
  //      j = max(j, dict[str[str.index(str.startIndex, offsetBy: i)]]! + 1)
  //    }
  //
  //    dict[str[str.index(str.startIndex, offsetBy: i)]] = i
  //    substringLen = max(substringLen, i-j+1)
  //  }
  
  for (i, char) in str.characters.enumerated() {
    
    if let _ = dict[char] {
      j = max(j, dict[char]! + 1)
    }
    
    dict[char] = i
    substringLen = max(substringLen, i-j+1)
    
  }
  
  
  return substringLen
}

getLengthOfLongestSubstring(str:"abcadea")

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
    
    if result >= (Int32.min/10) && result <= (Int32.max/10) {
      
      result = result * 10
      
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



struct Stack {
  
  fileprivate var element:[Character]
  
  init() {
    element = [Character]()
  }
  
  public mutating func push(char:Character) {
    element.append(char)
  }
  
  public mutating func pop()->Character{
    let last = element.removeLast()
    return last
  }
  
  public func peek()->Character?{
    return element.last
  }
  
  public func count()->Int {
    return element.count
  }
  
  public func isEmpty()->Bool {
    if element.count == 0 {
      return true
    } else {
      return false
    }
  }
  
}

func isValid(_ s:String)->Bool {
  
  var stack = Stack()
  
  for (_, char) in s.characters.enumerated() {
    
    
    if char == "(" || char == "[" || char == "{" {
      stack.push(char: char)
    } else {
      
      if let stackLastElement = stack.peek() {
        
        if char == ")" && stackLastElement == "(" {
          stack.pop()
        } else if char == "]" && stackLastElement == "[" {
          stack.pop()
        } else if char == "}" && stackLastElement == "{" {
          stack.pop()
        } else {
          stack.push(char: char)
        }
      } else {
        stack.push(char: char)
      }
    }
    
  }
  
  return stack.isEmpty()
  
  //  if stack.count() == 0 {
  //    return true
  //  } else {
  //    return false
  //  }
  
}

isValid("[]")
isValid("[](){}")
isValid("[}")
isValid("[()]")
isValid("[(])")
isValid("]")


func containsDuplicate(_ nums:[Int]) -> Bool {
  
  var dict:[Int:Int] = [:]

//  for i in 0..<nums.count {
    
//    dict[nums[i]] = (dict[nums[i]] ?? 0) + 1
//    
//    if dict[nums[i]]! > 1{
//      return true
//    }
//  }
  
  for element in nums {
    
    if let _ = dict[element] {
      return true
    } else {
      dict[element] = 1
    }
    
  }
  
  return false
  
}

containsDuplicate([1,2,2])


func moveZeroes(_ nums: inout [Int]) {
  
  var insertPosition = 0
  
  if nums.count == 0 {
    return
  }
  
  for i in 0..<nums.count {
    if nums[i] != 0 {
      nums[insertPosition] = nums[i]
      insertPosition += 1
    }
  }
  
  while( insertPosition < nums.count) {
    nums[insertPosition] = 0
    insertPosition += 1
  }
}


var zeroContainArr = [0,0,1,2]

moveZeroes(&zeroContainArr)
print(zeroContainArr)

public class Interval {
  
  public var start : Int
  public var end : Int
  public init(_ start:Int, _ end:Int) {
    self.start = start
    self.end = end
  }
  
  
}

func merge(_ intervals:[Interval])->[Interval] {
  
  guard intervals.count > 1 else {
    return intervals
  }
  
  var i = 0

  var sortedIntervals = intervals.sorted {
    return $0.start < $1.start
  }
  
  
  
  while( i <= sortedIntervals.count - 2 && sortedIntervals.count > 1) {
  
    
    if sortedIntervals[i].end >= sortedIntervals[i+1].start {
      
      if sortedIntervals[i].end <= sortedIntervals[i+1].end {
        sortedIntervals[i].end = sortedIntervals[i+1].end
      }

      sortedIntervals.remove(at: i+1)
      
    } else {
      i = i + 1
    }
    
  }
  
  return sortedIntervals
}

//merge([Interval(1,3), Interval(2,6), Interval(8,10), Interval(15,18)])
//merge([Interval(1,3)])
//merge([])
//
//merge([Interval(1,3), Interval(4,7), Interval(6,12)])
merge([Interval(1,4), Interval(0,4)])

func maxSubArray(_ nums: [Int]) -> Int {
  var dp = Array(repeating: 0, count: nums.count)
  dp[0] = nums[0]
  var maxValue = nums[0]

  for i in 1..<nums.count {
    dp[i] = dp[i-1] > 0 ? (dp[i-1] + nums[i]) : nums[i]
    maxValue = max(dp[i], maxValue)
  }

  return maxValue
}

maxSubArray([-2,1,-3,4,-1,2,1,-5,4])




