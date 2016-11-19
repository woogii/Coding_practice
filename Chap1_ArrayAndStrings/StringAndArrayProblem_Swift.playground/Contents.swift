//: Playground - noun: a place where people can play

import UIKit

var str = "HelloPlayground"
print(str)

extension Character {
    
    func unicodeScalarCodePoint()->UInt32 {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        return scalars[scalars.startIndex].value
    }
}

var dict = [Character:Int]()
var orderedDict = [Int:[Character:Int]]()
var i = 0
var length = 0


func firstNonRepeated(str: String)-> Character? {
    
    for i in 0..<str.characters.count {
        
        let index = str.index(str.startIndex, offsetBy: i)
        
        if dict[str[index]] != nil {
            dict[str[index]] = dict[str[index]]! + 1
        } else {
            dict[str[index]] = 1
        }
        
        
    }
    
    for i in 0..<str.characters.count {
        
        let index = str.index(str.startIndex, offsetBy:i)
        let ch = str[index]
        
        if dict[ch] == 1{
            print(ch)
            return ch
        }
    
    }
    
    return nil 
}

print(firstNonRepeated(str: str))