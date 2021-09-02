//
//  HeapExample.swift
//  Structures
//
//  Created by Игорь Яськин on 02.09.2021.
//

import Foundation

class HeapExample {
    
    static func insertAndRemove() {
        var heap = Heap<Int> { $0 > $1 }
        
        heap.insert(8)
        heap.insert(6)
        heap.insert(5)
        print(heap.elements)

        heap.insert(7)
        print(heap.elements)

        heap.insert(3)
        heap.insert(2)
        heap.insert(1)
        
        print(heap.elements)
        heap.insert(10)
        heap.insert(0)
        print(heap.elements)
        
        heap.remove()
        print(heap.elements)

        heap.remove()
        print(heap.elements)

        heap.remove()
        print(heap.elements)

        print("remove 5")
        heap.remove(at: 2)
        print(heap.elements)

    }
    
    static func indexOf() {
        var heap = Heap<Int> { $0 > $1 }
        
        heap.insert(8)
        heap.insert(6)
        heap.insert(5)
        heap.insert(7)
        heap.insert(3)
        heap.insert(2)
        heap.insert(1)
        heap.insert(10)
        heap.insert(0)
        print(heap.elements)
        
        print(heap.index(of: 3, startingAt: 1))
    }
    
    static func initFromArray() {
        print([1,12,3,4,1,6,8,7])
        var heap = Heap(sort: >, elements: [1,12,3,4,1,6,8,7])
        print(heap)
        while !heap.isEmpty {
          print(heap.remove()!)
        }
    }

}
