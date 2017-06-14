//: Playground - noun: a place where people can play

import UIKit


public class ListNode {
  
  public var val: Int
  public var next: ListNode?
  
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
  
}

//extension ListNode : CustomStringConvertible {
//  
//  public var description : String  {
//    
//    var text = "[\(self.val),"
//    
//    var node = self.next
//    
//    while node != nil {
//      
//      //print("val : \(node!.val)")
//      text += "\(node!.val),"
//      node = node!.next
//    }
//    
//    text.remove(at: text.index(before: text.endIndex))
//    text += "]"
//    return text
//  }
//}



func mergeTwo2Lists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
  
  let initialL1 = l1
  let initialL2 = l2
  
  var currentL1 = l1
  var currentL2 = l2
  var firstPos = l1
  var secondPos = l2
  
  if l1 == nil && l2 == nil {
    return nil
  } else if l1 == nil {
    return l2
  } else if l2 == nil {
    return l1
  }
  
  while firstPos != nil || secondPos != nil {
    
    if firstPos!.val <= secondPos!.val {
      
      //print("first is less than second")
      //print(firstPos!.val)
      
      firstPos = firstPos?.next
      //print("first move to the next")
      currentL1?.next  = currentL2
      //print("currentL1 to currentL2")
      
      //if let _ = secondPos?.next {
      // while (secondPos?.next?.val)! < firstPos!.val
      
      if firstPos != nil {
      
        while let nextSecondPos = secondPos?.next, nextSecondPos.val < (firstPos?.val)! {
          secondPos = secondPos!.next
        }
      }
      
    
    } else {
      
      
      secondPos = secondPos?.next
      currentL2?.next = currentL1
      
      //print("first : \(firstPos!.val)")
      //print("second : \(secondPos!.val)")
      
      if secondPos != nil {
        
        // while (firstPos?.next?.val)! < secondPos!.val
        while let nextPos = firstPos?.next, nextPos.val < secondPos!.val {
          firstPos = firstPos?.next
          print(firstPos!.val)
        }
        
      }
    }
    
    //print("second after while : \(secondPos!.val)")
    currentL1 = firstPos
    currentL2 = secondPos
    
    //print("current L1: \(currentL1!.val)")
    //print("current L2: \(currentL2!.val)")
    
  }
  
  //print("after while")
  if (initialL1?.val)! > (initialL2?.val)! {
    //print("Start with L2")
    //print(initialL2!.val)
    return initialL2
  } else {
    //print("Start with L1")
    return initialL1
  }
}


var node_1:ListNode? = ListNode(2)
//var node_2 = ListNode(13)
//node_1.next = node_2
//var node_3 = ListNode(21)
//node_2.next = node_3
//var node_4 = ListNode(28)
//node_3.next = node_4
//
//var node_5 = ListNode(8)
//var node_6 = ListNode(11)
//node_5.next = node_6
//var node_7 = ListNode(14)
//node_6.next = node_7
//var node_8 = ListNode(35)
//node_7.next = node_8

//var node_1 = ListNode(1)
//var node_2 = ListNode(3)
//node_1.next = node_2
//var node_3 = ListNode(4)
//node_2.next = node_3

var node_5:ListNode? = ListNode(1)

//print(node_1)
print(node_5)



func mergeTwoLists( l1: inout ListNode?, l2: inout ListNode?) -> ListNode? {
  
  
  if l1 == nil && l2 == nil {
    return nil
  } else if l1 == nil {
    return l2
  } else if l2 == nil {
    return l1
  }
  
  let dummy = ListNode(0)
  var curr = dummy
  
  while l1 != nil && l2 != nil {
    
    if l1!.val < l2!.val {
      curr.next = l1
      l1 = l1!.next
    } else {
      curr.next = l2
      l2 = l2?.next
    }
    curr = curr.next!
  }
  
  curr.next = (l1 != nil) ? l1 : l2
  return dummy.next
}

var newList = mergeTwoLists(l1: &node_1, l2: &node_5)


//print(newList!.val)

while newList != nil {
  print("value : \(newList!.val)")
  newList = newList?.next
}



