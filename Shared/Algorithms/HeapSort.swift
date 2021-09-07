//
//  HeapSort.swift
//  Structures
//
//  Created by Игорь Яськин on 07.09.2021.
//

import Foundation

extension Heap {
    func sorted() -> [Element] {
        var heap = Heap(sort: sort, elements: elements)
        
        for index in heap.elements.indices.reversed() {
            heap.elements.swapAt(0, index)
            heap.siftDown(from: 0, upTo: index)
        }
        return heap.elements
    }
}
