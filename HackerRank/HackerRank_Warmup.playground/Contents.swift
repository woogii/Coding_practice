//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let arr = [1,4,3,2]


for element in arr.reversed() {
  print("\(element) ", separator: "", terminator: "")
}
print()

// number of elements
//let n = Int(readLine()!)!

// read array
//let arr2 = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let arr3 = ["4","aba","baba","aba","xzxb","3","aba","xzxb","ab"]

let original = ["aba","baba","aba","xzxb"]

let queryArray = ["aba","xzxb","ab"]

for i in 0..<queryArray.count {
  print(original.filter({ return $0 == queryArray[i]}).count)
}

/*
var strList = [String]()
var queryList = [String]()

// number of elements
let n = Int(readLine()!)!

for i in 0..<n {
  let str = readLine()!
  strList.append(str)
}


let queryNum = Int(readLine()!)!

for i in 0..<queryNum {
  let str = readLine()!
  queryList.append(str)
}

for i in 0..<queryNum {
  print(strList.filter({ return $0 == queryList[i]}).count)
}
*/


var timeInfo = "11:05:45PM"

let amPmInfoStartIndex = timeInfo.index(timeInfo.endIndex, offsetBy: -2)
let amPmInfo = timeInfo.substring(from: amPmInfoStartIndex)

var newTimeInfo = String(timeInfo.characters.prefix(upTo:amPmInfoStartIndex))
print(amPmInfo)
var hour = Int(timeInfo.components(separatedBy: ":").first!)!
print(hour)

if amPmInfo == "AM" {
  if hour == 12 {
    hour = hour - 12
    let replaceRange = newTimeInfo.startIndex...newTimeInfo.index(timeInfo.startIndex, offsetBy: 1)
    newTimeInfo.replaceSubrange(replaceRange, with: "0"+String(hour))
  }
} else {
  if hour < 12 {
    hour = hour + 12
    let replaceRange = newTimeInfo.startIndex...newTimeInfo.index(timeInfo.startIndex, offsetBy: 1)
    newTimeInfo.replaceSubrange(replaceRange, with: String(hour))
  }
}

print(newTimeInfo)

