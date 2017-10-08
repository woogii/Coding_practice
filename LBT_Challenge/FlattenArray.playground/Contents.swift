//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"



func flattenArray(originArray:[Any])->[Int] {
  
  //var subArray = [Int]()
  //var nestedSubArray = [Int]()
  var flattenResultArray = [Int]()
  
  for element in originArray {
  
    print(element)
    
    if let value = element as? Int{
      flattenResultArray.append(value)
    } else {
      
      let recursionResult = flattenArray(originArray: element as! [Any])
      
      for num in recursionResult {
        flattenResultArray.append(num)
      }
    }
  }

  return flattenResultArray
}

flattenArray(originArray: [1,[2,[3,4]]])
flattenArray(originArray: [1])
flattenArray(originArray: [1,[2]])
flattenArray(originArray: [1,[2,[3]]])
flattenArray(originArray: [[-1,0],1,2,[3,[4,5]]])
flattenArray(originArray: [[-1,0],[1],2,[3,[4,5]]])
flattenArray(originArray: [1,2,3,4,5,[6,7]])
flattenArray(originArray: [[1,2],[3,4]])
