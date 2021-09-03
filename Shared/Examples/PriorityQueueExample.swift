//
//  PriorityQueueExample.swift
//  Structures
//
//  Created by Игорь Яськин on 03.09.2021.
//

import Foundation

class PriorityQueueExample {
    static func test() {
        var priorityQueue = PriorityQueue(sort: >, elements: [1,12,3,4,1,6,8,7])
        
        while !priorityQueue.isEmpty {
            print(priorityQueue.dequeue()!)
        }
    }
}
