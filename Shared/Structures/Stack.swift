//
//  Stack.swift
//  Structures
//
//  Created by Игорь Яськин on 24.08.2021.
//

import Foundation
//The stack data structure is identical in concept to a physical stack of objects. When you add an item to a stack, you place it on top of the stack. When you remove an item from a stack, you always remove the topmost item.
//Stacks are used prominently in all disciplines of programming. To list a few:
//iOS uses the navigation stack to push and pop view controllers into and out of view.
//Memory allocation uses stacks at the architectural level. Memory for local variables is also managed using a stack.
//Search and conquer algorithms, such as finding a path out of a maze, use stacks to facilitate backtracking.

//Less is More
//You may have wondered if you could adopt the Swift collection protocols for the stack. A stack's purpose is to limit the number of ways to access your data, and adopting protocols such as Collection would go against this goal by exposing all the elements via iterators and the subscript. In this case, less is more!

struct Stack<Element> {
    var storage: [Element] = []
    init(_ elements: [Element]? = nil){
        storage = elements ?? []
    }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    func peek() -> Element? {
        return storage.last
    }
    
    var isEmpty: Bool {
        return peek() == nil
    }
    
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "---top---\n"
        let bottomDivider = "\n--------"
        
        let stackElements = storage
            .map { "\($0)" }
            .reversed()
            .joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

extension Stack: ExpressibleByArrayLiteral {
    
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
