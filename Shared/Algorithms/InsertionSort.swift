//
//  InsertionSort.swift
//  Structures
//
//  Created by Игорь Яськин on 05.09.2021.
//

import Foundation
//Идем вперед на 1 элемент, двигаем маленький элемент влево.

//Insertion sort is one of the fastest sorting algorithm, if the data is already sorted. That sounds obvious, but it isn't true for all sorting algorithms. In practice, a lot of data collections will already be largely — if not entirely — sorted, and insertion sort will perform quite well in those scenarios.

func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    guard array.count >= 2 else {
        return
    }
    var swapCounter = 0
    defer {
        print("Swaps = \(swapCounter)")
    }

    for current in 1..<array.count {
        
        for shifting in (1...current).reversed() {
            
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
                print("Swap")
                swapCounter += 1
            } else {
                break
            }
        }
        print(array)
    }
}

func genericInsertionSort<T>(_ collection: inout T) where T: BidirectionalCollection & MutableCollection,
                                                          T.Element: Comparable {
    guard collection.count >= 2 else {
        return
    }
    
    for current in collection.indices {
        var shifting = current
        print("Shifting = \(shifting)")
        print("collection.startIndex =\(collection.startIndex)")
        while shifting > collection.startIndex {
            let previous = collection.index(before: shifting)
            
            if collection[shifting] < collection[previous] {
                collection.swapAt(shifting, previous)
            } else {
                break
            }
            shifting = previous
        }
    }
}
