//
//  BreadthFirstSearchExample.swift
//  Structures
//
//  Created by Игорь Яськин on 09.09.2021.
//

import Foundation

class BreadthFirstSearchExample {
    
    static func test() {
        let graph = AdjacencyMatrix<String>()
        
        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")
        let f = graph.createVertex(data: "F")
        let g = graph.createVertex(data: "G")
        let h = graph.createVertex(data: "H")

        graph.add(.undirected, from: a, to: d, weight: 1)
        graph.add(.undirected, from: a, to: c, weight: 1)
        graph.add(.undirected, from: a, to: b, weight: 1)
        graph.add(.undirected, from: c, to: g, weight: 1)
        graph.add(.undirected, from: c, to: f, weight: 1)
        graph.add(.undirected, from: f, to: g, weight: 1)
        graph.add(.undirected, from: b, to: e, weight: 1)
        graph.add(.undirected, from: e, to: f, weight: 1)
        graph.add(.undirected, from: e, to: h, weight: 1)

        
        let vertices = graph.breadthFirstSearch(from: a)
        
        vertices.forEach { vertex in
            print(vertex)
        }
    }
}
