//
//  Queue.swift
//  Structures
//
//  Created by Игорь Яськин on 24.08.2021.
//

import Foundation
//Queues use FIFO or first-in-first-out ordering, meaning the first element that was enqueued will be the first to get dequeued. Queues are handy when you need to maintain the order of your elements to process later.
//Can be made on array, doubly linked list, ring buffer, two stacks

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

//Array-based

struct QueueArray<T>: Queue {
    private var array: [T] = []
    init() {}
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
  public var description: String {
    return array.description
  }
}


//DoubleLinkedList
