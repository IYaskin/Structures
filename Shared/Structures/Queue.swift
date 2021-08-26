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


//DoubleLinkedList - не понял почему нельзя было просто на LL сделать
//Despite O(1) performance, it suffers from high overhead. Each element has to have extra storage for the forward and back reference. Moreover, every time you create a new element, it requires a relatively expensive dynamic allocation. By contrast QueueArray does bulk allocation which is faster.
class QueueDoublyLinkedList<T>: Queue {
    private var list = DoublyLinkedList<T>()
    init() {}
    
    func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    func dequeue() -> T? {
        return list.pop()
    }
    
    var peek: T? {
        return list[list.startIndex]
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
}

extension QueueDoublyLinkedList: CustomStringConvertible {
    var description: String {
        return list.description
    }
}


//Ring buffer
//Can you eliminate allocation overhead and main O(1) dequeues? If you don’t have to worry about your queue ever growing beyond a fixed size, you can use a different approach like the ring buffer. For example, you might have a game of Monopoly with five players. You can use a queue based on a ring buffer to keep track of whose turn is coming up next.


struct QueueRingBuffer<T>: Queue {
    private var ringBuffer: RingBuffer<T>
    
    init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    var isEmpty: Bool {
        return ringBuffer.isEmpty
    }
    
    var peek: T? {
        return ringBuffer.peek()
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        return ringBuffer.write(element)
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : ringBuffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        return ringBuffer.description
    }
}


//TwoStack
//The idea behind using two stacks is simple. Whenever you enqueue an element, it goes in the right stack. When you need to dequeue an element, you reverse the right stack and place it in the left stack so you can retrieve the elements using FIFO order.

struct QueueStack<T>: Queue {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    init() {}
    
    var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    var peek: T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {
  public var description: String {
    let printList = leftStack + rightStack.reversed()
    return printList.description
  }
}
