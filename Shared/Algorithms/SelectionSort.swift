//
//  SelectionSort.swift
//  Structures
//
//  Created by Игорь Яськин on 04.09.2021.
//

import Foundation
//Проходим массив, находим самый маленький элемент и ставим его в начало(1 свайп). На следующей итерации массив без начального элемента.
func selectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count >= 2 else {
        return
    }
    var swapCounter = 0
    defer {
        print("Swaps = \(swapCounter)")
    }
    for current in 0..<(array.count - 1) {
        var lowest = current
        
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        
        print("Current = \(array[current])")
        print("Lowest = \(array[lowest])")

        if lowest != current {
            print("swap")
            array.swapAt(lowest, current)
            swapCounter += 1

        }
        print(array)
    }
}


func genericSelectionSort<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
    guard collection.count >= 2 else {
        return
    }
    
    for current in collection.indices {
        var lowest = current
        var other = collection.index(after: current)
        
        while other < collection.endIndex {
            if collection[lowest] > collection[other] {
                lowest = other
            }
            other = collection.index(after: other)
        }
        
        if lowest != current {
            collection.swapAt(lowest, current)
        }
    }
}
