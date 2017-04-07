//: Playground - noun: a place where people can play

import UIKit


//Sort the content of the a file based on second field, e.g.
//
//Input file:
//Jervie,12,M
//Jaimy,11,F
//Tony,23,M
//Janey,11,F
//
//Output file:
//Jaimy,11,F
//Janey,11,F
//Jervie,12,M
//Tony,23,M
//don’t worry about open file, close file etc

let array = ["Jervie,12,M", "Jaimy,11,F", "Tony,23,M", "Janey,11,F"]
var intStringArrayPairDict = [String:Int]()

for i in 0..<array.count {
  
  intStringArrayPairDict[array[i]] = Int(array[i].components(separatedBy: ",")[1])
}

print(intStringArrayPairDict)

for arr in intStringArrayPairDict.sorted(by:<).map({$0.key}) {
  print("\(arr)")
}

//print(intStringArrayPairDict.sorted(by:<).map({$0.key}))
