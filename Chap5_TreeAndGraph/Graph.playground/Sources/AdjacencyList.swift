import Foundation

open class AdjacencyList<T: Hashable> {
  
  public var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
  public init() {}
  
  fileprivate func addDirectedEdge(from source:Vertex<Element>, to destination:Vertex<Element>, weight:Double?) {
    let edge = Edge(source: source, destination: destination, weight: weight)
    adjacencyDict[source]?.append(edge)
  }
  
  fileprivate func addUndirectedEdge(vertices:(Vertex<Element>, Vertex<Element>), weight:Double?) {
    
    let (source,destination) = vertices
    addDirectedEdge(from: source, to: destination, weight: weight)
    addDirectedEdge(from: destination, to: source, weight: weight)
  
  }
  
  
}


extension AdjacencyList: Graphable {
  
  public  var description: CustomStringConvertible {
    var result = ""
    
    for (vertex, edges) in adjacencyDict {
      
      var edgeString = ""
      
      for (index, edge) in edges.enumerated() {
        
        if index != edges.count - 1 {
          edgeString.append("\(edge.destination), ")
        } else {
          edgeString.append("\(edge.destination)")
        }
      }
      
      result.append("\(vertex)---> [ \(edgeString) ] \n")
    }
    
    return result
  }

  
//  associatedtype Element:Hashable
//  var description: CustomStringConvertible { get } // 2
//  func createVertex(data: Element) -> Vertex<Element> // 3
//  func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) // 4
//  func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? // 5
//  func edges(from source: Vertex<Element>) -> [Edge<Element>]? // 6

  public typealias Element = T
  
  public func createVertex(data: T) -> Vertex<T> {
    let vertex = Vertex(data: data)
    
    if adjacencyDict[vertex] == nil {
      adjacencyDict[vertex] = []
    }
    
    return vertex
  }
  
  public func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
    
    switch type {
    case .directed :
      addDirectedEdge(from: source, to: destination, weight: weight)
    case .undirected:
      addUndirectedEdge(vertices: (source, destination), weight: weight)
    }
  }
  
  public func weight(from source:Vertex<Element>, to destination:Vertex<Element>)-> Double? {
    guard let edges = adjacencyDict[source] else {
      return nil
    }
    
    for edge in edges {
      if edge.destination == destination {
        return edge.weight
      }
    }
    
    return nil
  }
  
  public func edges(from source: Vertex<Element>) -> [Edge<Element>]? {
    return adjacencyDict[source]
  }
  
  
}




