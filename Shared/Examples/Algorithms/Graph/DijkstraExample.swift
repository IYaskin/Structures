//
//  DijkstraExample.swift
//  Structures
//
//  Created by Игорь Яськин on 11.09.2021.
//

import Foundation

class DijkstraExample {
    static func test() {
        let graph = AdjacencyList<String>()
        
        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")
        let f = graph.createVertex(data: "F")
        let g = graph.createVertex(data: "G")
        let h = graph.createVertex(data: "H")

        graph.add(.directed, from: a, to: b, weight: 8)
        graph.add(.directed, from: a, to: f, weight: 9)
        graph.add(.directed, from: a, to: g, weight: 1)
        
        graph.add(.directed, from: b, to: e, weight: 1)
        graph.add(.directed, from: b, to: f, weight: 3)

        graph.add(.directed, from: c, to: b, weight: 3)
        graph.add(.directed, from: c, to: e, weight: 1)
        
        graph.add(.directed, from: e, to: b, weight: 1)
        graph.add(.directed, from: e, to: c, weight: 8)
        graph.add(.directed, from: e, to: d, weight: 2)
        
        graph.add(.directed, from: f, to: a, weight: 2)

        graph.add(.directed, from: g, to: c, weight: 3)

        graph.add(.directed, from: h, to: f, weight: 2)
        graph.add(.directed, from: h, to: g, weight: 5)
        
        let dijkstra = Dijkstra(graph: graph)
        
        let pathsFromA = dijkstra.shortestPath(from: a) // 1
        let path = dijkstra.shortestPath(to: d, paths: pathsFromA) // 2
        var pathString = ""
        for edge in path { // 3
            pathString += "\(edge.source)-\(Int(edge.weight ?? 0))->\(edge.destination) "
        }
        print(pathString)
    }
}
