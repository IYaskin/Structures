//
//  PriorityQueue.swift
//  Structures
//
//  Created by Игорь Яськин on 03.09.2021.
//

import Foundation

struct PriorityQueue<Element: Equatable>: Queue {
    
    private var heap: Heap<Element>
    
    init(sort: @escaping (Element, Element) -> Bool,
         elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var peek: Element? {
        return heap.peek()
    }
    
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    mutating func dequeue() -> Element? {
        return heap.remove()
    }
}

extension PriorityQueue: CustomStringConvertible {
    var description: String {
        var heap1 = heap
        var string = ""
        while let element = heap1.remove() {
            string += "\(element)<"
        }
        return "\(string)"
    }
}
