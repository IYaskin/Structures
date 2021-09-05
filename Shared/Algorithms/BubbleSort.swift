//
//  BubbleSort.swift
//  Structures
//
//  Created by Игорь Яськин on 04.09.2021.
//

import Foundation
//На каждом цикле последний элемент массива заполняется самым большим числом, он всплывает как пузырик(много свайпов). С каждым циклом мы прочесываем массив на 1 элемент меньше(без последнего).

public func bubbleSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    guard array.count >= 2 else {
        return
    }
    var swapCounter = 0
    defer {
        print("Swaps = \(swapCounter)")
    }
    for end in (1..<array.count).reversed() {
        var swapped = false
        
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                swapCounter += 1
                swapped = true
            }
        }
        print(array)
        if !swapped {
            return
        }
    }
}


func genericBubbleSort<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
    
    guard collection.count >= 2 else {
        return
    }
    
    for end in collection.indices.reversed() {
        var swapped = false
        var current = collection.startIndex
        
        while current < end {
            let next = collection.index(after: current)
            
            if collection[current] > collection[next] {
                collection.swapAt(current, next)
                swapped = true
            }
            current = next
        }
        
        if !swapped {
            return
        }
    }
}
