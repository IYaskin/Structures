//
//  BreadthFirstSearch.swift
//  Structures
//
//  Created by Игорь Яськин on 09.09.2021.
//

import Foundation

extension Graph where Element: Hashable {
    
    func breadthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        var queue = QueueStack<Vertex<Element>>() {
            didSet {
                print("Queue = \(queue)")
            }
        }
        var enqueued: Set<Vertex<Element>> = [] {
            didSet {
                print("Enqueued = \(enqueued)")
            }
        }
        var visited: [Vertex<Element>] = [] {
            didSet {
                print("Visited = \(visited)")
            }
        }
        
        queue.enqueue(source)
        enqueued.insert(source)
        print("\n")
        while let vertex = queue.dequeue() {
            visited.append(vertex)
            
            let neighborEdges = edges(from: vertex)
            
            neighborEdges.forEach { edge in
                if !enqueued.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    enqueued.insert(edge.destination)
                }
            }
            print("\n")
        }
        
        return visited
    }
}
