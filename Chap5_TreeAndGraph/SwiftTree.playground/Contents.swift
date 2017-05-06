//: Playground - noun: a place where people can play

import UIKit

class Node<T> {
  
  var value : T
  var children:[Node] = []
  weak var parent:Node?
  
  init(value:T) {
    self.value = value
  }
  
  func add(child:Node) {
    children.append(child)
    child.parent = self
  }
  
  
}

let beverages = Node(value:"beverages")

let hotBeverages = Node(value: "hot")

let tea = Node(value: "tea")
let coffee = Node(value: "coffee")
let cocoa = Node(value: "cocoa")

let black = Node(value: "black")
let green = Node(value: "green")
let chai  = Node(value: "chai")

let coldBeverages = Node(value: "cold")

let soda = Node(value: "soda")

let gingerAle = Node(value: "gingerAle")
let bitterLemon = Node(value: "bitterLemon")

let milk = Node(value: "milk")


beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)

hotBeverages.add(child: tea)
hotBeverages.add(child: coffee)
//hotBeverages.add(child: cocoa)

tea.add(child: black)
tea.add(child: green)
//tea.add(child: chai)

coldBeverages.add(child: soda)
coldBeverages.add(child: milk)

//soda.add(child: gingerAle)
//soda.add(child: bitterLemon)


extension Node : CustomStringConvertible {
  
  var description : String {
    
    var text = "\(value)"
  
    if !children.isEmpty {
  
      text += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
//      text += " {"
//      
//      for child in children {
//        text += child.description + ", "
//      }
//      
//      text += "} "
    }
    
    return text
  }
}

print(beverages)

extension Node where T : Equatable {
  
  func search(value: T) -> Node? {
    
    if value == self.value {
      return self
    }
  

    for child in children {

      let str = "\(child) is finding \(value)"
      
      print(str)
      
      if let found = child.search(value: value) {
        return found
      } else {
        print("Search function calls from \(child) result is nil")
      }
      
    }
    
    //print("\(self) cann not find \(value)")
    return nil
  }
  
  func delete(value:T) {
    
    let deletedNode = self.search(value: value)
    
    if let deletedNode = deletedNode {
      if let parent = deletedNode.parent {
        if let index = parent.children.index(where: { return $0.value == deletedNode.value }) {
          print("index : \(index)")
          parent.children.remove(at: index)
        }
      }
    }
  }
}


print(beverages.search(value: "milk") ?? "")
//beverages.delete(value: "hot")
print(beverages)


