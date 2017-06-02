//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//let n = Int(readLine()!)!

// read array
//let arr2 = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let arr = [1,2,3,4,5]

let newArr = Array(arr.suffix(from: 3)) + Array(arr.prefix(upTo: 3))

// print(arr.suffix(from: 3) + arr.prefix(upTo: 3))

//for element in newArr {
//  print(element, separator: "", terminator: " ")
//}



var grades = [73,67,38,33]

for i in 0..<grades.count {

  var num:Int
  
  if grades[i] < 38 {
    print(grades[i])
    continue
    
  } else {
    
    let val = grades[i]/5
    let mod = grades[i]%5
    
    if mod >= 3 {
      grades[i] = (val + 1)*5
    }
    print(grades[i])
  }

}

// print(grades)
