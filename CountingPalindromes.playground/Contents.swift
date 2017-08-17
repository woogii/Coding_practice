//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let sentence = "madam anna kayak notapalindrome anna Civic racecar"

extension String {
  
  func charAtIndex(index:Int)->Character {
    return self[self.index(self.characters.startIndex, offsetBy: index)]
  }
  
}

func allPalindromCounts(sentence:String) {
  
  var result:[String:Int] = [:]
  let wordList = sentence.components(separatedBy: " ")
  
  wordList.forEach { word in
    
    print(word)
    
    if isPalindrom(word:word) {
      
      let wordCount = result[word] ?? 0
      result[word]  = wordCount + 1
      
    }
    
  }
  
  print(result)
}

func isPalindrom(word:String) -> Bool {
  
  let characters = Array(word.lowercased().characters)
  var startIndex = 0
  var endIndex = word.characters.count - 1
  
  while startIndex < endIndex {
    
    if characters[startIndex] != characters[endIndex] {
      return false
    }
    
    startIndex += 1
    endIndex -= 1
    
  }
  
  return true
}


allPalindromCounts(sentence: sentence)

