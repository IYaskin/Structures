//
//  DepthFirstSearch.swift
//  Structures
//
//  Created by Игорь Яськин on 10.09.2021.
//

import Foundation

extension Graph where Element: Hashable {
    
    func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        var stack = Stack<Vertex<Element>>() {
            didSet {
                print("stack = \(stack)")
            }
        }
        var pushed: Set<Vertex<Element>> = [] {
            didSet {
                print("pushed = \(pushed)")
            }
        }
        var visited: [Vertex<Element>] = [] {
            didSet {
                print("Visited = \(visited)")
            }
        }
        
        stack.push(source)
        pushed.insert(source)
        visited.append(source)
        
        
        outer: while let vertex = stack.peek() {
            print("\n")
            let neighbors = edges(from: vertex)
            
            guard !neighbors.isEmpty else {
                stack.pop()
                continue
            }
            
            for edge in neighbors {
                if !pushed.contains(edge.destination) {
                    stack.push(edge.destination)
                    pushed.insert(edge.destination)
                    visited.append(edge.destination)
                    
                    continue outer
                }
            }
            stack.pop()
        }
        
        return visited
    }
}
