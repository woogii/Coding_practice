//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 
We have a log file, can grow pretty big.
Each line is a trace-log, and the first field is the RequestID.
We need to scan the file, and print all the logs for requests which resulted in error ..

001 <timestamp> BEGIN
001 <timestamp> fetched from db
001 <timestamp> some processing ..
002 <timestamp> BEGIN ..
002 <timestamp> fetched from db
001 <timestamp> returned success
003 <timestamp> BEGIN
001 <timestamp> END
003 <timestamp> some work
002 <timestamp> ERROR
003 <timestamp> some other work
 
*/

//let logString =
"001 <timestamp> BEGIN\n001 <timestamp> fetched from db\n001 <timestamp> some processing ..\n002 <timestamp> BEGIN ..\n002 <timestamp> fetched from db\n001 <timestamp> returned success\n003 <timestamp> BEGIN\n001 <timestamp> END\n003 <timestamp> some work\n002 <timestamp> ERROR\n003 <timestamp> some other work"


func fetchStringFromFile()->[String] {

  let stringsInFile:[String]!
  
  if let path = Bundle.main.path(forResource: "log", ofType: "txt") {
  
    do {
      let convertedString = try String(contentsOfFile: path, encoding:.utf8)
      stringsInFile = convertedString.components(separatedBy: .newlines)
      return stringsInFile
    } catch {
      print(error)
    }
  }
  return [String]()
}

let logStringArray = fetchStringFromFile()

//print(logString.components(separatedBy: "\n").filter({ $0.contains("ERROR")}))
print(logStringArray.filter({ $0.contains("ERROR")}))

class StreamReader  {
  
  let encoding : String.Encoding
  let chunkSize : Int
  var fileHandle : FileHandle!
  let delimData : Data
  var buffer : Data
  var atEof : Bool
  
  init?(path: String, delimiter: String = "\n", encoding: String.Encoding = .utf8, chunkSize: Int = 4096) {
    
    guard let fileHandle = FileHandle(forReadingAtPath: path),
      let delimData = delimiter.data(using: encoding) else {
        return nil
    }
    self.encoding = encoding
    self.chunkSize = chunkSize
    self.fileHandle = fileHandle
    self.delimData = delimData
    self.buffer = Data(capacity: chunkSize)
    self.atEof = false
  }
  
  deinit {
    self.close()
  }
  
  /// Return next line, or nil on EOF.
  func nextLine() -> String? {
    precondition(fileHandle != nil, "Attempt to read from closed file")
    
    // Read data chunks from file until a line delimiter is found:
    while !atEof {
      if let range = buffer.range(of: delimData) {
        // Convert complete line (excluding the delimiter) to a string:
        let line = String(data: buffer.subdata(in: 0..<range.lowerBound), encoding: encoding)
        // Remove line (and the delimiter) from the buffer:
        buffer.removeSubrange(0..<range.upperBound)
        return line
      }
      let tmpData = fileHandle.readData(ofLength: chunkSize)
      if tmpData.count > 0 {
        buffer.append(tmpData)
      } else {
        // EOF or read error.
        atEof = true
        if buffer.count > 0 {
          // Buffer contains last line in file (not terminated by delimiter).
          let line = String(data: buffer as Data, encoding: encoding)
          buffer.count = 0
          return line
        }
      }
    }
    return nil
  }
  
  /// Start reading from the beginning of file.
  func rewind() -> Void {
    fileHandle.seek(toFileOffset: 0)
    buffer.count = 0
    atEof = false
  }
  
  /// Close the underlying file. No reading must be done after calling this method.
  func close() -> Void {
    fileHandle?.closeFile()
    fileHandle = nil
  }
}

extension StreamReader : Sequence {
  func makeIterator() -> AnyIterator<String> {
    return AnyIterator {
      return self.nextLine()
    }
  }
}




// Problem 10.5
let stringList = ["at","","","","ball","","","car","","","dad","",""]
stringList.index(of: "ball")



