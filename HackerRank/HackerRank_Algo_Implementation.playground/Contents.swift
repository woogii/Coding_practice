//: Playground - noun: a place where people can play

import UIKit



var arr = [1,2,3]


let shiftOperation = 2


let arrayCount = arr.count

let onePart = arr[arrayCount-shiftOperation..<arrayCount]
let theOtherPart = arr[0..<arrayCount-shiftOperation]

let shiftedArr = Array(onePart) + Array(theOtherPart)
print(shiftedArr)

for i in 0..<arr.count {
  print(arr[(i + shiftOperation)%arrayCount])
}

assert(-arrayCount...arrayCount ~= shiftOperation, "out of index")


//let lastElement = arr.remove(at: arr.count-1)
//arr.insert(lastElement, at: 0)

// print(arr)



