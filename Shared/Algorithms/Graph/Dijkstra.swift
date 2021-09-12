//
//  Dijkstra.swift
//  Structures
//
//  Created by Игорь Яськин on 10.09.2021.
//

import Foundation

enum Visit<T: Hashable> {
    case start
    case edge(Edge<T>)
}

extension Visit: CustomStringConvertible {
    var description: String {
        switch self {
        case .start:
            return "start"
        case let .edge(edge):
            return "\(edge.source)-\(Int(edge.weight ?? 0))-\(edge.destination)"
        }
    }
}


class Dijkstra<T: Hashable> {
    typealias Graph = AdjacencyList<T>
    let graph: Graph
    
    init(graph: Graph) {
        self.graph = graph
    }
    
    private func route(to destination: Vertex<T>,
                       with paths: [Vertex<T>: Visit<T>]) -> [Edge<T>] {
        
        var vertex = destination
        var path: [Edge<T>] = []
        
        while let visit = paths[vertex], case .edge(let edge) = visit {
            path = [edge] + path
            vertex = edge.source
        }
        
        return path
    }
    
    private func distance(to destination: Vertex<T>,
                          with paths: [Vertex<T>: Visit<T>]) -> Double {
        let path = route(to: destination, with: paths)
        let distances = path.compactMap{ $0.weight }
        return distances.reduce(0.0, +)
    }
    
    func shortestPath(from start: Vertex<T>) -> [Vertex<T> : Visit<T>] {
        var paths: [Vertex<T> : Visit<T>] = [start: .start]
        
        var priorityQueue = PriorityQueue<Vertex<T>> {
            self.distance(to: $0, with: paths) < self.distance(to: $1, with: paths)
        }
        priorityQueue.enqueue(start)
        
        while let vertex = priorityQueue.dequeue() {
            print("Dequeue = \(vertex.data)")
            for edge in graph.edges(from: vertex) {
                guard let weight = edge.weight else {
                    continue
                }
                
                if paths[edge.destination] == nil ||
                    distance(to: vertex, with: paths) + weight <
                    distance(to: edge.destination, with: paths) {
                    if paths[edge.destination] == nil {
                        print("paths[\(edge.destination.data)] = nil")
                    }
                    if distance(to: vertex, with: paths) + weight <
                        distance(to: edge.destination, with: paths) {
                        print("\(vertex.data) + \(weight) < \(edge.destination.data)")
                    }
                    
                    paths[edge.destination] = .edge(edge)
                    print("Paths = \(paths)")
                    print("Enqueue = \(edge.destination.data)")

                    priorityQueue.enqueue(edge.destination)
                    print("PriorityQueue = \(priorityQueue)\n")
                }
            }
        }
        
        return paths
    }
    
    func shortestPath(to destination: Vertex<T>,
                             paths: [Vertex<T> : Visit<T>]) -> [Edge<T>] {
      return route(to: destination, with: paths)
    }

}
