//: Playground - noun: a place where people can play

import UIKit
import XCPlayground



//let edge = Edge(source:singapore,destination:tokyo, weight:500)

let adjacencyList = AdjacencyList<String>()

let singapore    = adjacencyList.createVertex(data:"Singapore")
let tokyo        = adjacencyList.createVertex(data:"Tokyo")
let detroit      = adjacencyList.createVertex(data:"Detroit")
let austinTexas  = adjacencyList.createVertex(data:"Austin Texas")
let washingtonDC = adjacencyList.createVertex(data:"Washington DC")
let seattle      = adjacencyList.createVertex(data:"Seattle")
let hongkong     = adjacencyList.createVertex(data:"Hong Kong")
let sanfrancisco = adjacencyList.createVertex(data:"San Francisco")


adjacencyList.add(.undirected, from: singapore, to: tokyo, weight: 500)
adjacencyList.add(.undirected, from: singapore, to: hongkong, weight: 300)
adjacencyList.add(.undirected, from: hongkong,  to: sanfrancisco, weight: 600)
adjacencyList.add(.undirected, from: hongkong, to: tokyo, weight: 250)
adjacencyList.add(.undirected, from: tokyo, to: detroit, weight: 450)
adjacencyList.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
adjacencyList.add(.undirected, from: detroit, to: austinTexas, weight: 50)
adjacencyList.add(.undirected, from: washingtonDC, to: austinTexas, weight: 292)
adjacencyList.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
adjacencyList.add(.undirected, from: washingtonDC, to: sanfrancisco, weight: 337)
adjacencyList.add(.undirected, from: sanfrancisco, to: seattle, weight: 218)
adjacencyList.add(.undirected, from: sanfrancisco, to: austinTexas, weight: 297)

print(adjacencyList.description)

adjacencyList.weight(from: singapore, to: tokyo)


if let edges = adjacencyList.edges(from: sanfrancisco) {
  for edge in edges {
    print(edge.destination)
  }
}


