//
//  PrimExample.swift
//  Structures
//
//  Created by Игорь Яськин on 12.09.2021.
//

import Foundation

class PrimExample {
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

        graph.add(.undirected, from: a, to: b, weight: 8)
        graph.add(.undirected, from: a, to: f, weight: 9)
        graph.add(.undirected, from: a, to: g, weight: 1)
        
        graph.add(.undirected, from: b, to: e, weight: 1)
        graph.add(.undirected, from: b, to: f, weight: 3)

        graph.add(.undirected, from: c, to: b, weight: 3)
        graph.add(.undirected, from: c, to: e, weight: 1)
        
        graph.add(.undirected, from: e, to: d, weight: 2)
        
        graph.add(.undirected, from: g, to: c, weight: 3)

        graph.add(.undirected, from: h, to: f, weight: 2)
        graph.add(.undirected, from: h, to: g, weight: 5)

        let (cost,mst) = Prim().produceMinimumSpanningTree(for: graph)
        print("cost: \(cost)")
        print("mst:")
        print(mst.description)
    }
}
