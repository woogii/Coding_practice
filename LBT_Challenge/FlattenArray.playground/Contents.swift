//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"



func flattenArray(originArray:[Any])->[Int] {
  
  let nestedArray = originArray
  var subArray = [Int]()
  var nestedSubArray = [Int]()
  
  for element in nestedArray {
    print(element)
    
    if let value = element as? Int{
      subArray.append(value)
    } else {
      nestedSubArray = flattenArray(originArray: element as! [Any])
    }
  }

  return subArray + nestedSubArray
}

//flattenArray(originArray: [1,[2,[3,4]]])
//flattenArray(originArray: [1])
//flattenArray(originArray: [1,[2]])
flattenArray(originArray: [1,[2,[3]]])
flattenArray(originArray: [1,2,[3,[4,5]]])