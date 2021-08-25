//
//  QueueExample.swift
//  Structures
//
//  Created by Игорь Яськин on 24.08.2021.
//

import Foundation

class QueueExample {
    static func queueArray() {
        var queue = QueueArray<String>()
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")
        print(queue)
        queue.dequeue()
        print(queue)
        print("peek" + queue.peek!)
        print(queue)
    }
    
    static func queueDoubleLinkedList() {
        var queue = QueueDoublyLinkedList<String>()
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")
        print(queue)
        queue.dequeue()
        print(queue)
        print("peek" + queue.peek!)
        print(queue)
    }

    static func queueRingBuffer() {
        var queue = QueueRingBuffer<String>(count: 10)
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")
        print(queue)
        queue.dequeue()
        print(queue)

        print(queue.peek)
    }
    
}
