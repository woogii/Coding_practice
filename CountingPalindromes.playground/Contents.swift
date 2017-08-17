//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let sentence = "madam anna kayak notapalindrome anna Civic racecar"


func allPalindromCounts(sentence:String) {
  
  var result:[String:Int] = [:]
  let wordList = sentence.components(separatedBy: " ")
  
  for word in wordList {
    
    let reversedWord = String(word.characters.reversed())
    
    if word.caseInsensitiveCompare(reversedWord) == ComparisonResult.orderedSame {
      
      if let wordCount = result[word]  {
        result[word] = wordCount + 1
      } else {
        result[word] = 1
      }
    }
    
    
  }
  
  print(result)
}



allPalindromCounts(sentence: sentence)

