//
//  Prim.swift
//  Structures
//
//  Created by Игорь Яськин on 12.09.2021.
//

import Foundation

class Prim<T: Hashable> {
    
    typealias Graph = AdjacencyMatrix<T>
    init() {}
    
    func copyVertices(from graph: Graph, to graph2: Graph) {
        for vertex in graph.vertices {
            graph2.createVertex(data: vertex.data)
        }
        print("Copied vertices: \(graph2.vertices)\n")
    }
    
    func addAvailableEdges(for vertex: Vertex<T>,
                           in graph: Graph,
                           check visited: Set<Vertex<T>>,
                           to priorityQueue: inout PriorityQueue<Edge<T>>) {
        print("AddAvailableEdges:")
        for edge in graph.edges(from: vertex) {
            if !visited.contains(edge.destination) {
                priorityQueue.enqueue(edge)
                print("add edge to queue = \(edge)")
            }
        }
        print("\n")
    }
    
    func produceMinimumSpanningTree(for graph: Graph) -> (cost: Double, mst: Graph) {
        var cost = 0.0
        let mst = Graph()
        var visited: Set<Vertex<T>> = []
        var priorityQueue = PriorityQueue<Edge<T>> {
            $0.weight ?? 0.0 < $1.weight ?? 0.0
        }
        
        copyVertices(from: graph, to: mst)
        
        guard let start = graph.vertices.first else {
            return (cost: cost, mst: mst)
        }
        
        visited.insert(start)
        print("Insert start")
        addAvailableEdges(for: start,
                          in: graph,
                          check: visited,
                          to: &priorityQueue)
        
        while let smallestEdge = priorityQueue.dequeue() {
            print("Dequeue = \(smallestEdge)")
            let vertex = smallestEdge.destination
            guard !visited.contains(vertex) else {
                continue
            }
            
            visited.insert(vertex)
            print("Add weight = \(smallestEdge.weight)")
            cost += smallestEdge.weight ?? 0.0
            
            mst.add(.undirected,
                    from: smallestEdge.source,
                    to: smallestEdge.destination,
                    weight: smallestEdge.weight)
            
            addAvailableEdges(for: vertex,
                              in: graph,
                              check: visited,
                              to: &priorityQueue)
        }
        
        return (cost: cost, mst: mst)
    }
    
}
